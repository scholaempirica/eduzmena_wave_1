library(reschola)
library(tidyverse)
library(here)
library(LimeRick)
source("shared.R")

# download all data from GDrive folder set in `shared.R` into `data-input`
reschola::gd_download_folder(gd_url, overwrite = T, files_from_subfolders = T)

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

# list of all questionnares
lsList() %>% as_tibble %>% view  #filter(str_detect(surveyls_title, "(?i)eduzměna"))

# ucitele
# get whole response dataframe
# first, get rsyntax.R file, then rdata.csv file, then run syntax on rdata
# has to be neamed "data"
data <- lsGetResponses(867277, languageCode = "cs", documentType = "rdata", sessionKey = sess_key)

lsGetResponses(867277,
  languageCode = "cs",
  documentType = "rsyntax",
  rfile = here("data-input/rsyntax_ucitele.R"),
  sessionKey = sess_key
)

source(textConnection(readLines(here("data-input/rsyntax_ucitele.R"), encoding = "UTF-8")[-1])) # skip 1st line, data are already loaded

data %>% write_rds(here("data-input/EZ_ucitele_ZS_SS_wave1.rds"))
