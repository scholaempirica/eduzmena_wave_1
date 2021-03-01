library(tidyverse)
library(reschola)
library(magrittr) # convenient aliases and %<>% operator
library(here)
source("shared.R")

# download all data from GDrive folder set in `shared.R` into `data-input`
reschola::gd_download_folder(gd_url, overwrite = F, files_from_subfolders = T)

# If there is other data you expect to only retrieve once
# (from the web, public databases or APIs, etc.),
# this might be a good place to store the code that does it.

# institutions big database (aka "table of everything")
url_id <- googledrive::as_id("https://drive.google.com/file/d/1c94APXNywkhQ9RZ9ajY8njak7Os9O7qb")
drib <- googledrive::as_dribble(url_id)
googledrive::drive_download(drib, paste0("data-input/", drib$name))

# fetch from LimeSurvey ------------------------------------------------------

# list of all questionnares
ls_surveys()  #filter(str_detect(surveyls_title, "(?i)eduzměna"))

# ucitele
ls_responses(867277) %>% write_rds(here("data-input/ucitele_ZS_SS_wave1.rds"))
ls_participants(867277) %>% write_rds(here("data-input/ucitele_ZS_SS_wave1_participants.rds"))

# reditele
ls_export(258724) %>% write_rds(here("data-input/reditele_ZS_SS_wave1.rds"))

# MS
ls_export(395636) %>% write_rds(here("data-input/ucitele_reditele_MS_wave1.rds"))
