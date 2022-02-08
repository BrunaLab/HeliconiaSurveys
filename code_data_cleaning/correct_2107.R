correct_2107 <- function(ha_data) {
  

# in 2008 data for 275 incorrectly entered as 68   
# add to 275
ha_data$shts[ha_data$plot == 2107 &
               ha_data$tag_number == 275 & 
               ha_data$year == 2008] <- 3
  
ha_data$ht[ha_data$plot == 2107 &
               ha_data$tag_number == 275 & 
               ha_data$year == 2008] <- 36

# remove from 68
ha_data$shts[ha_data$plot == 2107 &
               ha_data$tag_number == 68 &
               ha_data$year == 2008] <- NA

ha_data$ht[ha_data$plot == 2107 &
             ha_data$tag_number == 68 &
             ha_data$year == 2008] <- NA



# in 2008 data for 311 incorrectly entered as 129
# add to 311
ha_data$shts[ha_data$plot == 2107 &
               ha_data$tag_number == 311 & 
               ha_data$year == 2008] <- 2

ha_data$ht[ha_data$plot == 2107 &
             ha_data$tag_number == 311 & 
             ha_data$year == 2008] <- 20

# remove from 129
ha_data$shts[ha_data$plot == 2107 &
               ha_data$tag_number == 129 &
               ha_data$year == 2008] <- NA

ha_data$ht[ha_data$plot == 2107 &
             ha_data$tag_number == 129 &
             ha_data$year == 2008] <- NA







# Plant 237 in D6 is actually 337. The actual 237 is in C8
ha_data$tag_number[ha_data$plot == 2107 &
                       ha_data$row == "D" &
                       ha_data$column == 6 &
                       ha_data$tag_number == 237] <- 337
  
  
# Plant 237 in D6 is actually 337. The actual 237 is in C8
ha_data$tag_number[ha_data$plot == 2107 &
                     ha_data$row == "D" &
                     ha_data$column == 6 &
                     ha_data$tag_number == 237] <- 337

# Updating Codes 
# Plant 228: code say 'dead (2)' in 2006, should be missing (60)
ha_data$code[ha_data$plot == 2107 &
               ha_data$year == 2006 &
               ha_data$tag_number == 228] <- "missing (60)"

# Plant 282: code say 'dead (2)' in 2006, should be missing (60)
ha_data$code[ha_data$plot == 2107 &
               ha_data$year == 2006 &
               ha_data$tag_number == 282] <- "missing (60)"

return(ha_data)
}


