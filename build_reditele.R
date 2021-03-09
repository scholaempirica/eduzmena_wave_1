# those 2 lines propagates argument form Makefile to prevent report opening
args <- commandArgs(trailingOnly = TRUE)
from_make <- ifelse("dontOpen" %in% args, FALSE, TRUE)

# -------------------------------------------------------------------------

source("shared.R")

source('002_read-data-reditele.R')
source('003_check-and-process-reditele.R')

# -------------------------------------------------------------------------

compile_and_open("01_reditele.Rmd",
  open_success = from_make
) # when called from make, don't open anything regardless of anything
compile_and_open("01_reditele.Rmd",
  output_file = "01_reditele_anonymni.docx",
  params = list(anonymous = TRUE),
  open_success = from_make
)
