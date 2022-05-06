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
  
  ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 149] <- "missing"
  ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 499] <- "missing"
  ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 272] <- "missing"
  ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 736] <- "missing"
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5752 &
                 ha_data$year == 1999 & 
                 ha_data$tag_number == 378] <- "ULY"
 
  
  
  # Correcting NOL code
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5752 & year==2001 & tag_number==464, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5752 & year==1999 & tag_number==95,NA)) %>% 
    mutate(shts=replace(shts, plot==5752 & year==1998 & tag_number==95,1)) %>% 
    mutate(ht=replace(ht, plot==5752 & year==1998 & tag_number==95,17))
  
  
  # 464: didn't record measurements in 2000 when initially tagged 
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5752 & year==2000 & tag_number==464,"sdlg")) 

  # 456, 485, 504, 560: Incorrect code in 1999
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5752 & year==1999 & tag_number==456,NA)) %>% 
    mutate(code=replace(code, plot==5752 & year==1999 & tag_number==485,NA)) %>% 
    mutate(code=replace(code, plot==5752 & year==1999 & tag_number==560,NA)) %>% 
    mutate(code=replace(code, plot==5752 & year==1999 & tag_number==504,NA))
  
  # 481 was retagged as 681 in 2003
  ha_data<-ha_data %>%
    mutate(shts=replace(shts, plot==5752 & year==2000 & tag_number==681,1)) %>% 
    mutate(ht=replace(ht, plot==5752 & year==2000 & tag_number==681,10)) %>% 
    mutate(shts=replace(shts, plot==5752 & year==2001 & tag_number==681,1)) %>% 
    mutate(ht=replace(ht, plot==5752 & year==2001 & tag_number==681,8)) %>% 
    mutate(code=replace(code, plot==5752 & year==2000 & tag_number==681,"sdlg")) 
  
  # delete 481
  
  # delete the duplicate
  delete481 <- ha_data %>% filter(plot == 5752 & tag_number == 481)
  ha_data <- anti_join(ha_data, delete481)
  rm(delete481)
  
  
  
  
    return(ha_data) 
}