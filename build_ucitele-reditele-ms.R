######################### HOW TO USE THIS DOCUMENT ############################

# in order to render the reports according to this script, you have 3 options:
# 1) open Terminal tab (next to Console) and type "make ucitele", you're done

# 2) use Rstudio's Build tab (Environment pane)
# by default, it builds "reditele", so you want to click on More > Configure Build Tools...
# and there, in Additional arguments field, type "ucitele", click OK
# then, you can just hit Build All button (with hammer, but don't do it with a real one...)
# it'S also possible to use default keyboard shorcut: Ctrl + Shift + B (on Windows)

# 3)
# build instructions and additional args (see below) are defined in Makefile (see the root dir)
# if you want to run custom builds, you can type into Terminal (has to be BASH, not CMD!):
# "Rscript -e 'source("build_ucitele.R")' additionalArguments"

######################### HOW TO USE THIS DOCUMENT ############################

# LIST OF ADDITIONAL ARGUMENTS:
# preview - renders just one Word file, for REDIZO = 1
# pilot - renders one Word per each of two pilot schools, with smaller plots
# dontOpen - succesfuly rendered Word files are NOT automatically opened


# those 2 lines propagates argument form Makefile to prevent report opening
makefile_args <- commandArgs(trailingOnly = TRUE)

# -------------------------------------------------------------------------
library(here)
library(tidyverse)
library(reschola)
source("shared.R")

# source('002_read-data-ms.R')
# source('003_check-and-process_ucitele-reditele-ms.R')

# -------------------------------------------------------------------------

# for which REDIZO shlould the report be compiled?
red_izos <- read_rds(here("data-processed", "ms.rds")) %>%
  pull(red_izo) %>%
  unique()

purrr::map(
  red_izos,
  ~ compile_and_open("05_ucitele-reditele_ms.Rmd",
    clean = TRUE,
    open_on_success = ifelse("dontOpen" %in% makefile_args, FALSE, TRUE), # when called from make, don't open anything regardless of anything
    output_dir = here("reports-output", "ucitele-reditele-ms"),
    output_file = paste0("02_ucitele-reditele-ms_", .x, ".docx"),
    params = list(
      redizo = .x
      # pilot = ifelse("pilot" %in% makefile_args, TRUE, FALSE),
      # fig_asp_body = ifelse(!"pilot" %in% makefile_args, .6, .225),
      # fig_asp_appdx = ifelse(!"pilot" %in% makefile_args, .4, .225)
    )
  )
)
