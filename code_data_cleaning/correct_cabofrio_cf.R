
correct_cabofrio_cf <- function(ha_data) {
  
  # tag no. 2121
  # create the correct values
  correct_2121 <- ha_data %>%
    filter(plot == "CaboFrio-CF", tag_number == 2121) %>%
    group_by(year) %>%
    slice(1) %>%
    mutate(ht = if_else(year == 2009, 6, ht)) %>%
    mutate(shts = if_else(year == 2009, 1, shts)) %>%
    mutate(code = ifelse(year == 2009, NA, code))
  # remove the duplicates from the original df
  ha_data <- ha_data[!(ha_data$plot == "CaboFrio-CF" & ha_data$tag_number == 2121), ]
  # re-insert them
  str(ha_data$code)
  str(correct_2121$code)
  ha_data <- bind_rows(ha_data, correct_2121)
  rm(correct_2121)
  
  # location
  ha_data$row[ha_data$plot == "CaboFrio-CF" & ha_data$HA_ID_Number == 5211] <- "E"
  ha_data$row[ha_data$plot == "CaboFrio-CF" & ha_data$HA_ID_Number == 5303] <- "E"
  return(ha_data)
  
}