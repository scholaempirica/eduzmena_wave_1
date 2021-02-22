library(tidyverse)
library(magrittr) # convenient aliases and %<>% operator
library(janitor) # clean names
library(here)
library(lubridate)


# load the megadatabase of all institutions and save separate relevant data
# (so we do not use too much memory and manipulating the dataset will be faster)
read_rds(here("data-input/institutions.rds")) %>%
  filter(typ_izo_nazev == "MS") %>%
  transmute(
    red_izo = as.character(red_izo), ico, nazev = nazev_1,
    nazev_simple = nazev_2, druh_zarizeni = typ_izo_nazev, email = email_1
  ) %>%
  write_rds(here("data-input/institutions_digest.rds"))


# from LS API, foramtted with R syntax file from LS (see 001_retrieve-data.R)
ms <- read_rds(here("data-input/ms_wave_1.rds"))
ms_particip <- read_rds(here("data-input/ms_wave_1_participants.rds"))

# token is duplicated (read_csv repairs it automatically, read_RDS does not)
colnames(ms) <- make.unique(colnames(ms), sep = "_")

# separate item labels (some operations strip them out)
item_labels <- attributes(ms)$variable.labels
names(item_labels) <- colnames(ms)
item_labels %<>% as_tibble_row %>% clean_names() # harmonize colnames with below

# participant info is packed data.frame
ms_particip %<>% unpack(participant_info)


# to main dataframe
d <- left_join(ms, ms_particip, by = "token")


# clean unnecessary cols and "tidy" the dataframe
d %<>% select(
  -c(
    contains("time"),
    # validfrom,
    validuntil,
    emailstatus,
    # reminded,
    # remindercount,
    # invited,
    # completed,
    usesleft,
    # submitdate,
    # seed,
    startlanguage,
    language,
    # startdate,
    tid,
    id,
    # lastpage
  )
) %>%
  relocate(.after = datestamp, red_izo) %>%
  clean_names() # limesurvey returns pretty nasty colnames, fix it

d %<>%
  mutate(
    opened = ymd_hms(startdate),
    submitted = ymd_hms(submitdate),
    closed = ymd_hms(datestamp)
  ) %>%
  select(
    red_izo,
    email,
    token,
    opened,
    submitted,
    closed,
    lastpage,
    number_invited,
    starts_with("s"),
    -startdate,
    -submitdate,
    -datestamp,
  ) %>%
  rename(
    last_page = lastpage
  )

# repair "_sqxxx" endings to be compatible with the questionnaire
repaired_names <- d %>%
  names() %>%
  str_remove("(?<=_)s.*") %>%
  rle() %$%
  map2(.$values, .$lengths, ~ if (.y != 1) {
    paste0(.x, letters[seq(1, .y)])
  } else {
    .x
  }) %>%
  unlist()

names(d) <- repaired_names

# not necessary as classes are already set properly
d %<>%
  mutate(
    red_izo = as.character(red_izo)
  )

# repair "_sqxxx" endings to be compatible with the questionnaire
repaired_names <- item_labels %>%
  names() %>%
  str_remove("(?<=_)s.*") %>%
  rle() %$%
  map2(.$values, .$lengths, ~ if (.y != 1) {
    paste0(.x, letters[seq(1, .y)])
  } else {
    .x
  }) %>%
  unlist()

names(item_labels) <- repaired_names

# write item labels list (only items present in exported dataset)
item_labels[intersect(names(d), names(item_labels))] %>%
  as.list %>%
  write_rds(here("data-processed", "ms_labels.rds"))

# mark empty strings as NAs
d %<>% mutate_if(is.character, ~na_if(., ""))

# write RDS (empty rows are removed)
d %>%  # remove_empty_at(-c(red_izo, email, token)) %>%
  write_rds(here("data-processed", "ms.rds"))
