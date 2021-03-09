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

# source('002_read-data-ucitele.R')
# source('003_check-and-process-ucitele.R')

# -------------------------------------------------------------------------

# for which REDIZO shlould the report be compiled?
red_izos <- read_rds(here("data-processed", "ucitele_ZS_SS_wave1.rds")) %>%
  pull(red_izo) %>%
  unique()

# iterate over all redizos, save errors in dedicated file
purrr::walk(
  red_izos,
  ~ {
    message("\n\n________________________________CURR_SCHOOL__\nREDIZO: ", .x, "\n")

    result <- tryCatch(
      {
        rmarkdown::render("02_ucitele_ZS_SS_with_comparisons.Rmd",
          output_dir = here("reports-output", "ucitele", "pdf"),
          output_file = paste0("02_ucitele_ZS_SS_", .x, ".pdf"),
          params = list(redizo = .x),
          clean = TRUE
        )
      },
      error = function(e) {
        message(
          "ERROR: Report compilation failed with message:\n",
          "----------------------------------------------"
        )
        writeLines(
          as.character(e),
          here(
            "reports-output", "ucitele", "pdf",
            paste0("failed_", "02_ucitele_ZS_SS_", .x, ".txt")
          )
        )
        message(e)
      }
    )
  }
)


# which redizos failed to compile?
red_izos_failed <- list.files(here("reports-output", "ucitele", "pdf")) %>%
  str_subset("failed") %>%
  str_extract("\\d{9}")





# promissing parallel solution, but prone to errors mainly due to pdfcrop
#
# library(doParallel)
#
# reports <- map(
#   red_izos,
#   ~ list(
#     out_file = paste0("02_ucitele_ZS_SS_", .x, ".pdf"),
#     out_dir = here("reports-output", "ucitele", "pdf"),
#     params = list(redizo = .x)
#   )
# )
#
# do_reports <- function(r) {
#   require(rmarkdown)
#
#   tf <- tempfile()
#   dir.create(tf)
#
#   rmarkdown::render(
#     input = "02_ucitele_ZS_SS_with_comparisons.Rmd",
#     output_file = r$out_file,
#     output_dir = r$out_dir,
#     intermediates_dir = tf,
#     params = r$params,
#     quiet = TRUE
#   )
#   unlink(tf)
# }
#
# registerDoParallel(cores = detectCores()) # maximal power
#
# foreach(r = reports, .combine = c) %dopar% do_reports(r)
