
correct_5752 <- function(ha_data) {
  
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
  
  ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 149] <- "missing (60)"
  ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 499] <- "missing (60)"
  ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 272] <- "missing (60)"
  ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 736] <- "missing (60)"
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5752 &
                 ha_data$year == 1999 & 
                 ha_data$tag_number == 378] <- "ULY (3)"
 
  return(ha_data) 
}