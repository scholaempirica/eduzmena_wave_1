# Nice examples at https://github.com/rpremraj/mailR

library(tidyverse)
library(mailR)
library(here)
source("shared.R") # import GSuite auth function

# prepare table of recipients, subject, body, file path
emails <- tibble(
  recipients = c("neti.kja@gmail.com", "ne.tikja@gmail.com"),
  subject = c("Test č. 5", "TEst 6"),
  body = "Blablablaaa!", # can by HTML body, in that case, look for HTML arg in ?send.mail and edit the code below
  files = here("reports-output", "01_reditele_anonymni.docx") # can be multiple paths concatenated by c()
)

# prepare email "send job"
jobs <- pmap(
  list(
    emails$recipients, # ..1
    emails$subject, # ..2
    emails$body, # ..3
    emails$files # ..4
  ),
  ~ send.mail(
    from = paste0(gmail_cred("name"), " <", gmail_cred("user"), ">"),
    to = ..1,
    subject = ..2,
    body = ..3,
    attach.files = ..4,
    smtp = list(host.name = "smtp.gmail.com", port = 587, user.name = gmail_cred("user"), passwd = gmail_cred("pass"), ssl = TRUE),
    authenticate = TRUE,
    encoding = "utf-8",
    send = FALSE,
    debug = TRUE
  )
)

# BEWARE! this line executes the whole job
walk(jobs, ~ .x$send())

# if you wanna send just one "iteration", use indexing, like:
# jobs[[1]]$send()
