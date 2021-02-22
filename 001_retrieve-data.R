library(tidyverse)
library(magrittr) # convenient aliases and %<>% operator
library(here)
source("shared.R")

# download all data from GDrive folder set in `shared.R` into `data-input`
reschola::gd_download_folder(gd_url, overwrite = F, files_from_subfolders = T)

# If there is other data you expect to only retrieve once
# (from the web, public databases or APIs, etc.),
# this might be a good place to store the code that does it.

# institutions big database (aka "table of everything")
url_id <- googledrive::as_id("https://drive.google.com/file/d/1Jx_ODcogsOfgetFvVFuyKFisicM1stiP")
drib <- googledrive::as_dribble(url_id)
googledrive::drive_download(drib, paste0("data-input/", drib$name))


# LimeSurvey API fetch ------------------------------------------------------

# fixed and edited fork at my GitHub (main issue is the correct encoding)
if (!require("LimeRick")) remotes::install_github("netique/LimeRick")

# API calls reference list
# https://api.limesurvey.org/classes/remotecontrol_handle.html

options(lsAPIurl = limesurvey_api) # our API URL from shared.R
options(lsUser = ls_cred("user")) # your LS username
options(lsPass = ls_cred("pass")) # password to your LS account
sess_key <- lsSessionKey("get") # obtain sesion key

# MS
data <- lsGetResponses(395636, languageCode = "cs", documentType = "rdata")
tmp <- tempfile(fileext = ".R")
lsGetResponses(395636, languageCode = "cs", documentType = "rsyntax", rfile = tmp)
source(textConnection(readLines(tmp, encoding = "UTF-8")[-1])) # skip 1st line, data are already loaded

data %>% write_rds(here("data-input/msl_wave_1.rds"))

# LimeSurvey API documentation is as bad as LimeSurvey itself,
# after some try-errors and head scratching, found this should
# return complete list of participants
LimeRick::lsAPI("list_participants", params = list( # params order MUST be like that:
  sSessionKey = sess_key,
  iSurveyID = 395636,
  iStart = 0, # API is javascript/node/react, so indexing begins with 0
  iLimit = 9999, # sky is the limit
  bUnused = FALSE,
  aAttributes = c("attribute_1", "attribute_2", "attribute_3")
)) %>%
  unpack("participant_info") %>%
  rename(red_izo = attribute_1, izo = attribute_2, p_izo = attribute_3) %>%
  write_rds(here("data-input/ms_wave_1_participants.rds"))
