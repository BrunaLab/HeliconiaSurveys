correct_5751 <- function(ha_data) {
# 401 is in A8; move 2007 record over to A8 and then delete record in E7
  # Move 2007 measurment to A7, delete E7
  ha_data$shts[ha_data$plot == "5751" & 
                 ha_data$tag_number == 401 &
                 ha_data$year == 2007] <- 1
  
  ha_data$ht[ha_data$plot == "5751" & 
               ha_data$tag_number == 401 &
               ha_data$year == 2007] <- 7
  
  ha_data$code[ha_data$plot == "5751" & 
               ha_data$tag_number == 401 &
               ha_data$year == 2007] <- "sdlg (1)"
  
  #delete the not on list code in 2006
  ha_data$code[ha_data$plot == "5751" & 
                 ha_data$tag_number == 401 &
                 ha_data$year == 2008] <- NA
  
  
  delete401 <- ha_data %>%
    filter(plot == "5751" &
             tag_number == 401 &
             row == "E" &
             column == 7)
  ha_data <- anti_join(ha_data, delete401)
  rm(delete401)
  
  
  
  # 358: location accidentally entered as E7 in 2007. 
  # Move 2007 measurment to A7, delete E7
  ha_data$shts[ha_data$plot == "5751" & 
                 ha_data$tag_number == 358 &
                 ha_data$year == 2007] <- 1
  
  ha_data$ht[ha_data$plot == "5751" & 
               ha_data$tag_number == 358 &
               ha_data$year == 2007] <- 11
  
  delete358 <- ha_data %>%
    filter(plot == "5751" &
             tag_number == 358 &
             row == "E" &
             column == 7)
  ha_data <- anti_join(ha_data, delete358)
  rm(delete358)
    
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
  
  
  # Correcting duplicate "dead"
  ha_data$code[ha_data$plot == "5751" &
                 ha_data$year == 2008 &
                 ha_data$tag_number == 310] <-  NA


  return(ha_data)
}