library(tidyverse)
library(magrittr)
library(here)
library(assertr)

df <- read_rds(here("data-processed/ucitele_ZS_SS_wave1.rds"))

# new var -  those with large body of unanswered items
# df$n_miss <- rowSums(is.na(df))
# df %<>% filter(n_miss < 30)
# df$n_miss <- NULL

# df %>% naniar::vis_miss()


# assert possible values
wrong_age_idx <- df %>%
  assert(within_bounds(23, 95), s0q2, success_fun = success_logical, error_fun = error_df_return) %>%
  pull(index)

df %>% assert(within_bounds(0, 50), s0q5_a, s0q5_b, success_fun = success_logical)

wrong_selfedu_idx <- df %>%
  assert(within_bounds(0, 500), s3q5, success_fun = success_logical, error_fun = error_df_return) %>%
  pull(index)

df %>% assert(within_bounds(0, 100), s8q2_a, s8q2_b, success_fun = success_logical)

# mahalanobis - for info
df %>% insist_rows(maha_dist, within_n_sds(3), where(is.numeric), error_fun = error_df_return)


# based on assert block above, edit imposible values, store original in xxx_orig
df$s3q5_orig <- df$s3q5
df[wrong_selfedu_idx, "s3q5"] <- 350

df$s0q2_orig <- df$s0q2
df[wrong_age_idx, "s0q2"] <- NA

df %>% write_rds(here("data-processed/ucitele_ZS_SS_wave1.rds"))
