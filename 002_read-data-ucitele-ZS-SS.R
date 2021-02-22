library(tidyverse)
library(magrittr) # convenient aliases and %<>% operator
library(janitor)
library(lubridate)
library(here)

# load the megadatabase of all institutions and save separate relevant data
# (so we do not use too much memory and manipulating the dataset will be faster)
read_rds(here("data-input/institutions.rds")) %>%
  transmute(red_izo = as.character(red_izo), ico, nazev = nazev_1, nazev_simple = nazev_2, druh_zarizeni = typ_izo_nazev) %>%
  write_rds(here("data-processed/institutions_digest.rds"))



# from LS API, foramtted with R syntax file from LS (see 001_retrieve-data.R)
teachers <- read_rds(here("data-input/ucitele_ZS_SS_wave1.rds"))
teachers_participants <- read_rds("data-input/ucitele_MS_ZS_wave1_participants.rds")

# separate item labels (some operations strip them out)
item_labels <- attributes(teachers)$variable.labels
names(item_labels) <- colnames(teachers)
item_labels %<>% as_tibble_row %>% clean_names() # harmonize colnames with below

teachers <- rename(teachers, "token" = "token...6")

# to main dataframe
df <- right_join(teachers_participants, teachers, by = "token")

# clean unnecessary cols and "tidy" the dataframe
df %<>% select(
  -c(
    contains("time"),
    tid,
    validfrom,
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
    # startdate,
    tid,
    id,
    # lastpage
  )
) %>%
  relocate(.after = datestamp, red_izo) %>%
  clean_names() # limesurvey returns pretty nasty colnames, fix it



df %<>%
  mutate(
    opened = ymd_hms(startdate),
    submitted = ymd_hms(submitdate),
    closed = ymd_hms(datestamp)
  ) %>%
  select(
    red_izo,
    token,
    opened,
    submitted,
    closed,
    lastpage,
    starts_with("s"),
    -startdate,
    -submitdate,
    -datestamp,
  ) %>%
  rename(
    last_page = lastpage
  )

# repair "_sqxxx" endings to be compatible with the questionnaire
repaired_names <- df %>%
  names() %>%
  str_remove("(?<=_)s.*") %>%
  rle() %$%
  map2(.$values, .$lengths, ~ if (.y != 1) {
    paste0(.x, letters[seq(1, .y)])
  } else {
    .x
  }) %>%
  unlist()

names(df) <- repaired_names

# not necessary as classes are already set properly
df %<>%
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
item_labels[intersect(names(df), names(item_labels))] %>%
  as.list %>%
  write_rds(here("data-processed", "ucitele_ZS_SS_wave1_labels.rds"))

# mark empty strings as NAs
df %<>% mutate_if(is.character, ~na_if(., ""))

# write RDS (empty rows are removed)
df %>%# remove_empty_at(-c(red_izo, email, token)) %>%
  write_rds(here("data-processed", "ucitele_ZS_SS_wave1.rds"))
