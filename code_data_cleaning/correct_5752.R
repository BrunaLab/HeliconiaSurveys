correct_5752 <- function(ha_data) {
  
  # 841 in c1 is actually 849
  ha_data$tag_number[ha_data$plot == "5752" & 
                       ha_data$tag_number == 841 &
                       ha_data$row == "C" &
                       ha_data$column == 1] <- 849
  
  
  # 566 mistakenly marked as a seedling in 2007, which created duplicate record
  # correct and merge
  ha_data$code[ha_data$plot == "5752" & 
                       ha_data$tag_number == 566 &
                       ha_data$year == 2006] <- NA
  
  ha_data$ht[ha_data$plot == "5752" & 
                 ha_data$tag_number == 566 &
                 ha_data$year == 2006] <- 16
  
  ha_data$shts[ha_data$plot == "5752" & 
               ha_data$tag_number == 566 &
               ha_data$year == 2006] <- 1
  
  delete566 <- ha_data %>%
    filter(plot == "5752" &
             tag_number == 566 &
             HA_ID_Number == 3127)
  ha_data <- anti_join(ha_data, delete566)
  rm(delete566)
  
  
  
  # tag no. 181
  # create the correct values
  correct_181 <- ha_data %>%
    filter(plot == "5752", tag_number == 181) %>%
    group_by(year) %>%
    slice(1) %>%
    mutate(ht = if_else(year == 2006, 110, ht)) %>%
    mutate(shts = if_else(year == 2006, 3, shts)) %>%
    mutate(code = ifelse(year == 2006, NA, code))
  # remove the duplicates from the original df
  ha_data <- ha_data[!(ha_data$plot == "5752" & ha_data$tag_number == 181), ]
  # re-insert them
  ha_data <- bind_rows(ha_data, correct_181)
  rm(correct_181)
  
  # tag no. 526
  # create the correct values
  correct_526 <- ha_data %>%
    filter(plot == "5752", tag_number == 526) %>%
    group_by(year) %>%
    slice(1) %>%
    mutate(ht = if_else(year == 2006, 14, ht)) %>%
    mutate(shts = if_else(year == 2006, 3, shts)) %>%
    mutate(code = ifelse(year == 2006, NA, code))
  # remove the duplicates from the original df
  ha_data <- ha_data[!(ha_data$plot == "5752" & ha_data$tag_number == 526), ]
  # re-insert them
  ha_data <- bind_rows(ha_data, correct_526)
  rm(correct_526)
  
  ha_data <- ha_data %>% 
    mutate(code = ifelse(
      plot == 5752 & year == 2005 &
        tag_number %in% c(149, 499, 272, 736),
      "missing (60)",
      code
    ))
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5752 &
                 ha_data$year == 1999 & 
                 ha_data$tag_number == 378] <- "ULY (3)"
 
  return(ha_data) 
}