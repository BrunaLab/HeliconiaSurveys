
correct_florestal <- function(ha_data) {
  
  # ha_data$code_2005[ha_data$plot == "Florestal-CF" & 
  #                      ha_data$tag_number == "1"] <- 60
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 (ha_data$year == 2005 |ha_data$year == 2006|ha_data$year == 2007) &
                 ha_data$tag_number == 277] <- NA
  ha_data$shts[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 277] <- NA
  ha_data$ht[ha_data$plot == 'Florestal-CF' &
               ha_data$year == 2004 &
               ha_data$tag_number == 277] <- NA
  ha_data$infl[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 277] <- NA
  
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 1] <- "missing (60)"
  
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 1508] <- "missing (60)"
  
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 1508] <- "missing (60)"
  
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 1508] <- "missing (60)"
  
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 799] <- "missing (60)"
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 799] <- "missing (60)"
  
  # correcting location
  ha_data$column[ha_data$plot == "Florestal-CF" & ha_data$column == 0] <- 1
  
  
  # plant size entered incorrectly (entered as 449, should be 49)
  ha_data$ht[ha_data$plot == "Florestal-CF" & 
               ha_data$year == 2003 &
               ha_data$tag_number == 590] <- 49
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 1916] <- "ULY (3)"
  
  # incorrectly recorded the ht as 73 (it is 7.3). Rounded down.
  ha_data$ht[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2001 & 
               ha_data$tag_number == 967] <- 7
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 378] <- "ULY (3)"
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 378] <- "ULY (3)"
  
  # incorrectly recorded as seedling ("nova com cara de velha")
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 1578] <- "ULY (3)"
  
  # correction (found after referring to the datasheet to fix 378 above)
  ha_data$shts[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 1290] <- 2
  ha_data$ht[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2007 & 
               ha_data$tag_number == 1290] <- 16
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 1290] <- NA
  
  return(ha_data)
}