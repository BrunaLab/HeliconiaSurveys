correct_5753 <- function(ha_data) {
  
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