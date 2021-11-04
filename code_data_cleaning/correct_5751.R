
correct_5751 <- function(ha_data) {
  
  # 395 incorrectly entered as 365
  to_delete <- ha_data %>%
    filter(plot == "5751" &
             tag_number == 365 &
             row == "D" &
             column == 5)
  ha_data <- anti_join(ha_data, to_delete)
  rm(to_delete)
  ha_data$ht[ha_data$plot == "5751" & ha_data$year == 2008 & ha_data$tag_number == 395] <- 40
  ha_data$shts[ha_data$plot == "5751" & ha_data$year == 2008 & ha_data$tag_number == 395] <- 3
  
  
  ha_data$code[ha_data$plot == "5751" &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 128] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "5751" &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 128] <- "missing (60)"
  
  # location
  ha_data$column[ha_data$plot == "5751" & ha_data$column == 0] <- 1
  
  return(ha_data)
}