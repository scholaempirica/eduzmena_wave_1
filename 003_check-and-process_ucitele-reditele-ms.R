library(tidyverse)
library(magrittr)
library(here)
library(assertr)


d <- read_rds(here("data-processed", "ms.rds"))

# include "Jiné" in EDU
d <- d %>%
  mutate(
    s1q4 = if_else(is.na(s1q4) & !is.na(s1q4_other),
      "Jiné",
      as.character(s1q4)
    )
  )

d$s3q3[d$s3q3 > 100] <- NA



# new var -  those with large body of unanswered items
# df$n_miss <- rowSums(is.na(df))
# df %<>% filter(n_miss < 30)
# df$n_miss <- NULL

# df %>% naniar::vis_miss()

# based on assert block below, edit imposible values, store original in xxx_orig
# df$s3q5_orig <- df$s3q5
# df[df$s3q5 == 3500 & !is.na(df$s3q5), "s3q5"] <- 350
#
# # assert possible values
# df %>% assert(within_bounds(23, 95), s0q2, success_fun = success_logical)
# df %>% assert(within_bounds(0, 50), s0q5_a, s0q5_b, success_fun = success_logical)
# df %>% assert(within_bounds(0, 500), s3q5, success_fun = success_logical)
# df %>% assert(within_bounds(0, 100), s8q2_a, s8q2_b, success_fun = success_logical)
#
# mahalanobis - for info
# d %>% insist_rows(maha_dist, within_n_sds(3), s1q2, s1q5, s1q6, s3q3, s3q4, s4q5, error_fun = error_df_return)
#
d %>% write_rds(here("data-processed", "ms.rds"))
