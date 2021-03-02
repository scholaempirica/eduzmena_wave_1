library(tidyverse)
library(magrittr) # convenient aliases and %<>% operator
library(janitor)
library(lubridate)
library(here)

# ucitele ZS SS wave1 -----------------------------------------------------
# osloveni reditely
invitation <- read_rds(here("data-input/ucitele_ZS_SS_wave1_osloveni.rds")) %>%
  rename(red_izo_from_invitation = redizo) %>%
  transmute(token, red_izo_from_invitation, group = `int/kontrol`, number_invited = pocet)

# add redizo from invitation and number invited to the participants table
teachers_participants <- read_rds("data-input/ucitele_ZS_SS_wave1_participants.rds") %>%
  rename(red_izo_from_participants = redizo)
teachers_participants <- left_join(teachers_participants, invitation, by = "token")

# from LS API, formatted with R syntax file from LS (see 001_retrieve-data.R)
teachers <- read_rds(here("data-input/ucitele_ZS_SS_wave1.rds")) %>%
  rename(red_izo_from_responses = izo)

# separate item labels (some operations strip them out)
item_labels <- attributes(teachers)$variable.labels
names(item_labels) <- colnames(teachers)
item_labels %<>% as_tibble_row %>% clean_names() # harmonize colnames with below

# to main dataframe
df <- right_join(teachers_participants, teachers, by = "token")

# clean unnecessary cols and "tidy" the dataframe
df %<>% select(
  -c(
    contains("time"),
    token_1,
    ico.x,
    ico.y,
    nazev.x,
    nazev.y,
    validfrom,
    validuntil,
    emailstatus,
    usesleft,
    startlanguage,
    tid,
    id,
    sent,
    blacklisted,
    startlanguage,
    usesleft
  )
) %>%
  clean_names() # limesurvey returns pretty nasty colnames, fix it



df %<>%
  mutate(
    opened = ymd_hms(startdate),
    submitted = ymd_hms(submitdate),
    closed = ymd_hms(datestamp)
  ) %>%
  select(
    red_izo_from_invitation,
    red_izo_from_participants,
    red_izo_from_responses,
    token,
    opened,
    submitted,
    closed,
    lastpage,
    number_invited,
    starts_with("s"),
    -startdate,
    -submitdate,
    -datestamp
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
  as.list() %>%
  write_rds(here("data-processed", "ucitele_ZS_SS_wave1_labels.rds"))

# mark empty strings as NAs
df %<>% mutate_if(is.character, ~ na_if(., ""))

attr(df, "variable.labels") <- NULL

# write RDS (empty rows are removed)
df %>% # remove_empty_at(-c(red_izo, email, token)) %>%
  write_rds(here("data-processed", "ucitele_ZS_SS_wave1.rds"))


# reditele ZS SS wave1 ----------------------------------------------------

df <- read_rds(here("data-input/reditele_ZS_SS_wave1.rds"))

# bind with invitation survey to pickup REDIZOs
df <- left_join(df, invitation, by = "token")

# separate item labels (some operations strip them out)
item_labels <- character(ncol(df))
item_labels[seq_along(attributes(df)$variable.labels)] <- attributes(df)$variable.labels
names(item_labels) <- colnames(df)
item_labels %<>% as_tibble_row %>% clean_names() # harmonize colnames with below

# clean unnecessary cols and "tidy" the dataframe
df %<>% select(
  -c(
    contains("time"),
    validfrom,
    validuntil,
    emailstatus,
    usesleft,
    startlanguage,
    tid,
    id,
    blacklisted,
    startlanguage,
    usesleft
  )
) %>%
  clean_names() # limesurvey returns pretty nasty colnames, fix it



df %<>%
  mutate(
    red_izo = red_izo_from_invitation,
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
    -sent
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
  as.list() %>%
  write_rds(here("data-processed", "reditele_ZS_SS_wave1_labels.rds"))

# mark empty strings as NAs
df %<>% mutate_if(is.character, ~ na_if(., ""))

# remove labels that might be disruptive

attr(df, "variable.labels") <- NULL

# write RDS (empty rows are removed)
df %>% # remove_empty_at(-c(red_izo, email, token)) %>%
  write_rds(here("data-processed", "reditele_ZS_SS_wave1.rds"))
