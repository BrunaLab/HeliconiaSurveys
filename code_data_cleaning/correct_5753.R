correct_5753 <- function(ha_data) {
  #363 recorded to wrong location one year, created duplicate. it is in E10
  # add the measurments for 2009 to all, then delete dupe
  ha_data$shts[ha_data$plot == "5753" & 
                 ha_data$tag_number == 363 &
                 ha_data$year == 2009] <- 1
  
  ha_data$ht[ha_data$plot == "5753" & 
                 ha_data$tag_number == 363 &
                 ha_data$year == 2009] <- 34
  
  ha_data$x_09[ha_data$plot == "5753" & 
                 ha_data$tag_number == 363 &
                 ha_data$row == "E" &
                 ha_data$column == 10] <- 4.7
  
  ha_data$y_09[ha_data$plot == "5753" & 
                 ha_data$tag_number == 363 &
                 ha_data$row == "E" &
                 ha_data$column == 10] <- 8.7
  
  
  delete363 <- ha_data %>%
    filter(plot == "5753" &
             tag_number == 363 &
             row == "B" &
             column == 1)
  ha_data <- anti_join(ha_data, delete363)
  rm(delete363)
  
  
  # 320: E10 is correct add the 05 record, then delete the one in A5
  ha_data$shts[ha_data$plot == "5753" & 
                 ha_data$tag_number == 320 &
                 ha_data$year == 2005] <- 1
  
  ha_data$ht[ha_data$plot == "5753" & 
               ha_data$tag_number == 320 &
               ha_data$year == 2005] <- 12
  
  ha_data$code[ha_data$plot == "5753" & 
               ha_data$tag_number == 320 &
               ha_data$year == 2005] <- NA
  
  delete320 <- ha_data %>%
    filter(plot == "5753" &
             tag_number == 320 &
             row == "A" & 
             column == 5)
  ha_data <- anti_join(ha_data, delete320)
  rm(delete320)
  
  
  # Tag no. 108
  ha_data$code[ha_data$plot == 5753 & ha_data$tag_number == 108 & ha_data$year == 2005] <- NA
  
  # tag_no 841
  ha_data <- ha_data[!(ha_data$plot == 5753 & ha_data$tag_number == 319 & ha_data$row == "D"), ]
  
  # Status plant 412 in 2005
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 412] <- "missing (60)"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 268] <- "missing (60)"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 276] <- "missing (60)"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 292] <- "missing (60)"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 34] <- "missing (60)"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 52] <- "missing (60)"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 34] <- "missing (60)"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2008 &
                 ha_data$tag_number == 345] <- "missing (60)"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2008 &
                 ha_data$tag_number == 412] <- "missing (60)"
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2006 & 
                 ha_data$tag_number == 404] <- "under branchfall (90)"
  
  return(ha_data)
  
}