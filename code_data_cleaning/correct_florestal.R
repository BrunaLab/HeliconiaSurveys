
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
                 ha_data$tag_number == 1] <- "missing"
  
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 1508] <- "missing"
  
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 1508] <- "missing"
  
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 1508] <- "missing"
  
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 799] <- "missing"
  
  ha_data$code[ha_data$plot == 'Florestal-CF' &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 799] <- "missing"
  
  # correcting location
  ha_data$column[ha_data$plot == "Florestal-CF" & ha_data$column == 0] <- 1
  
  
  # plant size entered incorrectly (entered as 449, should be 49)
  ha_data$ht[ha_data$plot == "Florestal-CF" & 
               ha_data$year == 2003 &
               ha_data$tag_number == 590] <- 49
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 1916] <- "ULY"
  
  # incorrectly recorded the ht as 73 (it is 7.3). Rounded down.
  ha_data$ht[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2001 & 
               ha_data$tag_number == 967] <- 7
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 378] <- "ULY"
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 378] <- "ULY"
  
  # incorrectly recorded as seedling ("nova com cara de velha")
  ha_data$code[ha_data$plot == "Florestal-CF" &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 1578] <- "ULY"
  
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
  
  
  # correcting 576
  ha_data<-ha_data %>%
    mutate(row=replace(row,(plot=="Florestal-CF" & tag_number==576), "E")) %>% 
    mutate(shts=replace(shts,(plot=="Florestal-CF" & tag_number==576 & year==2008), 4)) %>% 
    mutate(ht=replace(ht,(plot=="Florestal-CF" & tag_number==576 & year==2008), 66)) %>% 
    filter(!(plot=="Florestal-CF" & tag_number==576 & column==1))
    
  
  # Correcting NOL code  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & year==2004 & tag_number==335,NA)) %>% 
    mutate(code=replace(code, plot=="Florestal-CF" & year==2002 & tag_number==727,NA)) %>% 
    mutate(code=replace(code, plot=="Florestal-CF" & year==2002 & tag_number==941,NA)) %>% 
    mutate(code=replace(code, plot=="Florestal-CF" & year==2002 & tag_number==1053,NA))
  
  
  # 738: can tell from numbering on 00 survbey sheet it was a seedling marked in 
  # 2000 but measuremtns weren't recorded, then not measured in 2001
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & year==2000 & tag_number==738,"sdlg")) %>% 
    mutate(code=replace(code, plot=="Florestal-CF" & year==2001 & tag_number==738,"missing"))
  
  
  
  return(ha_data)
}