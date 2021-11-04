correct_5754 <- function(ha_data) {
  # plant size entered incorrectly (entered as 997, should be 97)
  ha_data$ht[ha_data$plot == "5754" & ha_data$year == 2006 & ha_data$tag_number == 445] <- 97
  
  # removing the code that was resulting in zombie
  ha_data$code[ha_data$plot == 5754 &
                 ha_data$row == "B" &
                 ha_data$column == "7" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 823.7] <- NA
  
  # 823 and 824 were marked dead, but I think that was because they were on the B7/C7
  # border and not found when surveying B7. For not the "Dead" is being removed, and 
  # and both are being placed in C7, with numbers corrected
  ha_data$code[ha_data$plot == 5754 &
                 ha_data$row == "B" &
                 ha_data$column == "7" &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 823.7] <- NA
  
  ha_data$code[ha_data$plot == 5754 &
                 ha_data$row == "B" &
                 ha_data$column == "7" &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 824.7] <- NA
  
  # removing the ULY codes
  ha_data$code[ha_data$plot == 5754 &
                 ha_data$row == "C" &
                 ha_data$column == "7" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 824.7] <- NA
  
  ha_data$code[ha_data$plot == 5754 &
                 ha_data$row == "C" &
                 ha_data$column == "7" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 823.7] <- NA
  
  # replace the values for the 1st year 
  ha_data$shts[ha_data$plot == 5754 &
                 (ha_data$row == "C" & ha_data$column == "7") &
                 ha_data$year == 2003 &
                 (ha_data$tag_number == 823.7|ha_data$tag_number == 824.7)] <- 1
  ha_data$ht[ha_data$plot == 5754 &
               (ha_data$row == "C" & ha_data$column == "7") &
               ha_data$year == 2003 &
               (ha_data$tag_number == 823.7|ha_data$tag_number == 824.7)] <- 1
  ha_data$code[ha_data$plot == 5754 &
                 (ha_data$row == "C" & ha_data$column == "7") &
                 ha_data$year == 2003 &
                 (ha_data$tag_number == 823.7|ha_data$tag_number == 824.7)] <- "sdlg (1)"
  
  # delete the duplicates
  ha_data<-ha_data[!(ha_data$plot==5754 & 
                       ha_data$row=="B" & 
                       ha_data$column==7 &
                       ha_data$tag_number == 823.7),]
  
  ha_data<-ha_data[!(ha_data$plot==5754 & 
                       ha_data$row=="B" & 
                       ha_data$column==7 &
                       ha_data$tag_number == 824.7),]
  # correct the number
  # str(ha_data$tag_number)
  ha_data<-ha_data %>% 
    mutate(tag_number = ifelse(plot==5754 & tag_number == 824.7, 824, tag_number))
  
  ha_data<-ha_data %>% 
    mutate(tag_number = ifelse(plot==5754 & tag_number == 823.7,823, tag_number))
  
  return(ha_data)
}