library(reschola)
library(tidyverse)
library(here)
source("shared.R")

# If there is other data you expect to only retrieve once
# (from the web, public databases or APIs, etc.),
# this might be a good place to store the code that does it.

# institutions big database (aka "table of everything")
url_id <- googledrive::as_id("https://drive.google.com/file/d/1Jx_ODcogsOfgetFvVFuyKFisicM1stiP")
drib <- googledrive::as_dribble(url_id)
googledrive::drive_download(drib, paste0("data-input/", drib$name))

# fetch from LimeSurvey ------------------------------------------------------

# list of all questionnares
ls_surveys()  #filter(str_detect(surveyls_title, "(?i)eduzměna"))

# ucitele
ls_responses(867277) %>% write_rds(here("data-input/ucitele_ZS_SS_wave1.rds"))
ls_participants(867277, translate_attrs = FALSE) %>%
  rename(red_izo = attribute_1, izo = attribute_2, p_izo = attribute_3, note = attribute_4) %>%
  select(-c(participant_id, blacklisted, mpid)) %>%
  write_rds(here("data-input/ucitele_MS_ZS_wave1_participants.rds"))

# reditele
ls_responses(258724) %>% write_rds(here("data-input/reditele_ZS_SS_wave1.rds"))
ls_participants(258724, translate_attrs = FALSE) %>%
  select(-c(participant_id, blacklisted, mpid)) %>%
  write_rds(here("data-input/reditele_ZS_SS_wave1_participants.rds"))

# MS
ls_responses(395636) %>% write_rds(here("data-input/ms_ucitele_reditele_wave1.rds"))
ls_participants(395636, translate_attrs = FALSE) %>%
  rename(red_izo = attribute_1, izo = attribute_2, p_izo = attribute_3) %>%
  write_rds(here("data-input/ms_participants_wave1.rds"))

