library(tidyverse)
library(magrittr) # convenient aliases and %<>% operator
library(janitor)
library(lubridate)
library(here)

# reditele ZS SS wave1 ----------------------------------------------------

d <- read_rds(here("data-input/reditele_ZS_SS_wave1.rds"))

# separate item labels (some operations strip them out)
item_labels <- character(ncol(d))
item_labels[seq_along(attributes(d)$variable.labels)] <- attributes(d)$variable.labels
names(item_labels) <- colnames(d)
item_labels %<>% as_tibble_row %>% clean_names() # harmonize colnames with below

# osloveni reditele
invitation <- read_rds(here("data-input/ucitele_ZS_SS_wave1_osloveni.rds")) %>%
  rename(red_izo_from_invitation = redizo) %>%
  transmute(token, red_izo_from_invitation, group = `int/kontrol`, number_invited = pocet)

# bind with invitation survey to pickup REDIZOs
d <- right_join(invitation, d, by = "token")

# try to retrieve redizos from emails...
instit_digest <- read_rds(here("data-input/institutions_ms_zs_ss.rds")) %>%
  transmute(red_izo_email_1 = red_izo, email = email_1)

d <- right_join(instit_digest, d)

instit_digest <- read_rds(here("data-input/institutions_ms_zs_ss.rds")) %>%
  transmute(red_izo_email_2 = red_izo, email = email_2)

d <- right_join(instit_digest, d)

d <- d %>% mutate(across(contains("red_izo"), as.character))

d <- d %>% mutate(red_izo = coalesce(red_izo_email_1, red_izo_email_2, red_izo_from_invitation)) %>%
  relocate(contains("red_izo"))




# clean unnecessary cols and "tidy" the dataframe
d %<>% select(
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



d %<>%
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
  as.list() %>%
  write_rds(here("data-processed", "reditele_ZS_SS_wave1_labels.rds"))

# mark empty strings as NAs
d %<>% mutate_if(is.character, ~ na_if(., ""))

# remove labels that might be disruptive

attr(d, "variable.labels") <- NULL

# write RDS (empty rows are removed)
d %>% # remove_empty_at(-c(red_izo, email, token)) %>%
  write_rds(here("data-processed", "reditele_ZS_SS_wave1.rds"))
