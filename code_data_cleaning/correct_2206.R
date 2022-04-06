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
  
  return(ha_data)
}

