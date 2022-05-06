correct_2206 <- function(ha_data) {
  
  # 270 
  # was on the edge of 2 plots with branchfalls and hence was recorded in
  # diff locations in diff years. Put in B10
  
  ha_data$shts[ha_data$plot == 2206 & ha_data$year == 2006 & ha_data$tag_number == 270] <- 1
  ha_data$ht[ha_data$plot == 2206 & ha_data$year == 2006 & ha_data$tag_number == 270] <- 15
  ha_data$code[ha_data$plot == 2206 & ha_data$year == 2006 & ha_data$tag_number == 270] <- "under branchfall"
  
  # delete the one in C10
  omit270<-ha_data %>% filter(plot==2206 & 
                                tag_number==270 &
                                row=="C" & 
                                column==10)
  ha_data<-anti_join(ha_data,omit270)
  rm(omit270)
  
  # Correcting NOL code  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==2206 & year==2005 & tag_number==201,NA)) %>% 
    mutate(code=replace(code, plot==2206 & year==2004 & tag_number==201,"sdlg")) %>% 
    mutate(shts=replace(shts, plot==2206 & year==2004 & tag_number==201,1)) %>% 
    mutate(ht=replace(ht, plot==2206 & year==2004 & tag_number==201,19))
  
  
  # 70 is at base of 7, and measurments for 70 and 7 were switcheds in 2003
  ha_data<-ha_data %>%
    mutate(shts=replace(shts, plot==2206 & year==2003 & tag_number==70,3)) %>% 
    mutate(ht=replace(ht, plot==2206 & year==2003 & tag_number==70,36)) %>% 
    mutate(infl=replace(infl, plot==2206 & year==2003 & tag_number==70,NA)) %>% 
    mutate(shts=replace(shts, plot==2206 & year==2003 & tag_number==7,2)) %>% 
    mutate(ht=replace(ht, plot==2206 & year==2003 & tag_number==7,58)) %>% 
    mutate(infl=replace(infl, plot==2206 & year==2003 & tag_number==7,1))
  
  
  # 25 was on ground in 2003, so height should be NA
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot==2206 & year==2003 & tag_number==25,NA))
  
  
  # 7, 70, 45, 25: Some survey confusion in 2003
  # in 2002 there a note that Osmaildo dropped tag for 45 so it was marked
  # with new tag no. 25
  # BUT
  # in 2004-2006 45 was measured in c3 (remapped to c2 in 06)
  # AND
  # in 2002 70 was a seedling, measured in 03, and missing after.
  # I think its tag/stake were lost in was yanked from ground and then 
  # during the survey someone found the lost 45 tag next to it. The
  # plant now marked 25 was originally 70.

  # first change 70 to 45
  ha_data<-ha_data %>%
    mutate(tag_number=replace(tag_number, plot==2206 & year==2002 & tag_number==70,45)) %>% 
    mutate(tag_number=replace(tag_number, plot==2206 & year==2003 & tag_number==70,45)) %>% 
    mutate(column=replace(column, plot==2206 & year==2003 & tag_number==45,2))  
    
  # delete 70
  
  omit70<-ha_data %>% filter(plot==2206 & 
                                tag_number==70)
  ha_data<-anti_join(ha_data,omit70)
  rm(omit70)
  
  return(ha_data)
}

