marked_dead_but_measured <- function(test) {
  # This finds any that were marked dead in a year but for whihc there are measurments of shts or ht
  # test<-pa_wide
  df <- test
  df$code2 <- NA
  df$code2[df$code == "dead (2)"] <- "dead"
  df <- df %>%
    group_by(plot, tag_number) %>%
    mutate(code2 = as.character(code2),
           # can be avoided if key is a character to begin with
           code2 = ifelse(code2 == "dead" &
                            (!is.na(ht) | !is.na(shts)), "double_check", NA)) %>%
    filter(cumsum(!is.na(code2)) > 0) %>%
    ungroup()
  head(df, 20)
  df <- df %>% filter(code2 == "double_check")
  return(df)
}