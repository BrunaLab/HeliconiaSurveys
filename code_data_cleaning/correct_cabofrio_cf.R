
correct_cabofrio_cf <- function(ha_data) {
  
  # 2115 in D9 is actually 2105; move the measurment from 2008 to 2015's record
  ha_data$shts[ha_data$plot == "CaboFrio-CF" & 
                       ha_data$tag_number == 2105 &
                       ha_data$year == 2008] <- 1
  
  ha_data$ht[ha_data$plot == "CaboFrio-CF" & 
                 ha_data$tag_number == 2105 &
                 ha_data$year == 2008] <- 13
  
  ha_data$code[ha_data$plot == "CaboFrio-CF" & 
                 ha_data$tag_number == 2105 &
                 ha_data$year == 2008] <- "sdlg (1)"
  # Then delete the incorrect 2115 in D9
  delete2115 <- ha_data %>%
    filter(plot == "CaboFrio-CF" &
             tag_number == 2115 &
             row == "D" &
             column == 9)
  ha_data <- anti_join(ha_data, delete2115)
  rm(delete2115)
  
  
  
  
  
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