tribble(
  ~`položka 1`              , ~`položka 2`                    , ~sel,
  "Nevím / nechci odpovědět", "Nevím / nechci odpovědět", TRUE,
  "Rozhodně souhlasím"      , "Souhlasím"               , TRUE,
  "Rozhodně souhlasím"      , "Rozhodně souhlasím"      , TRUE,
  "Nesouhlasím"             , "Nesouhlasím"             , TRUE,
  "Nevím / nechci odpovědět", "Nesouhlasím"             , TRUE,
  "Souhlasím"               , "Rozhodně nesouhlasím"    , TRUE,
  "Souhlasím"               , "Souhlasím"               , TRUE,
  "Nesouhlasím"             , "Nevím / nechci odpovědět", TRUE,

  "Nevím / nechci odpovědět", "Rozhodně souhlasím", FALSE,
  "Rozhodně souhlasím"      , "Souhlasím"               , FALSE,
  "Rozhodně souhlasím"      , "Rozhodně souhlasím"      , FALSE,
  "Rozhodně souhlasím"             , "Nesouhlasím"             , FALSE,
  "Nevím / nechci odpovědět", "Nesouhlasím"             , FALSE,
  "Souhlasím"               , "Rozhodně nesouhlasím"    , FALSE,
  "Rozhodně souhlasím"               , "Souhlasím"               , FALSE,
  "Nesouhlasím"             , "Nevím / nechci odpovědět", FALSE
) %>%
  mutate(across(-sel, ~ factor(.x, levels = c("Nevím / nechci odpovědět", "Rozhodně nesouhlasím", "Nesouhlasím", "Souhlasím", "Rozhodně souhlasím")))) %>%
  pivot_longer(-sel) %>%
  ggplot(aes(y = name %>%
               fct_reorder(
                 value %>% str_detect("(?<!e)[S|s]ouhlasím"),
                 mean
               ), fill = value, alpha =sel)) +
  geom_bar(position = position_fill(), col = "white", size = 1.1) +
  # scale_y_discrete(labels = c("položka 1", "položka 2")) +
  scale_x_percent_cz(limits = c(0, 1)) +
  scale_alpha_discrete(range = c(.5, 1)) +
  scale_fill_schola(
    palette = "RdYlBu", direction = 1, na_pos = "first",
    labels = function(x) str_wrap(x, width = 15)
    ) +
  guides(fill = guide_legend(reverse = T, nrow = 1, override.aes = list(size = NULL))) +
  theme_schola("x",
    margin_side = 7,
    legend.title = element_blank(),
    legend.position = "bottom"
  )

