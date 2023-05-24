correct_florestal <- function(ha_data) {

  suppressMessages({
    
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
  
  
  # correcting 682 height in 2003 (entered as 266 instead of 26)
  ha_data<-ha_data %>%
    mutate(ht=replace(ht,(plot=="Florestal-CF" & tag_number==682 & year==2003), 26))
  
  
  # correcting 576
  ha_data<-ha_data %>%
    mutate(row=replace(row,(plot=="Florestal-CF" & tag_number==576), "E")) %>% 
    mutate(shts=replace(shts,(plot=="Florestal-CF" & tag_number==576 & year==2008), 4)) %>% 
    mutate(ht=replace(ht,(plot=="Florestal-CF" & tag_number==576 & year==2008), 66)) %>% 
    filter(!(plot=="Florestal-CF" & tag_number==576 & column==1))

  
  # 285 incorrect height in 1998
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot=="Florestal-CF" & year==1998 & tag_number==285,NA))
  # 201 incorrect height in 2002
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot=="Florestal-CF" & year==2001 & tag_number==201,NA))
  
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
  
  
  # in 2002 578 inder treefall
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & year==2002 & tag_number==578,"under treefall"))
  
  # height correction in 374 in 1999
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot=="Florestal-CF" & year==1999 & tag_number==374,101)) 
  
  # 28: infl in 2003 (from 2004 record) and correcting ht/shts in 2005 
  #  the numbers are written over each other, so it looks like 1, 10 but is 
  # actually 4, 110
  ha_data<-ha_data %>%
    mutate(infl=replace(infl, plot=="Florestal-CF" & year==2003 & tag_number==28,1)) %>% 
    mutate(shts=replace(shts, plot=="Florestal-CF" & year==2005 & tag_number==28,4)) %>% 
    mutate(ht=replace(ht, plot=="Florestal-CF" & year==2005 & tag_number==28,110))
    
  
  # 1079: 
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & year==2004 & tag_number==1079,"dead")) 
  
  # 1163: 
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & year==2004 & tag_number==1163,"dead")) 
  
  
  # 96
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & year==2000 & tag_number==96,"under treefall")) 
 
  
  # 1004 dead in 2007. also need to delete 277 
  # (277 tag changed to 1004 but 1 row not deleted )
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & year==2007 & tag_number==1004,"dead")) 
  to_delete <- ha_data %>%
    filter(plot == "Florestal-CF" &
             tag_number == 277)
    ha_data <- anti_join(ha_data, to_delete)
  
  rm(to_delete)
  
  # 1002 dead in 2009 
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="Florestal-CF" & year==2009 & tag_number==1002,"dead")) 
  
  
  
  
  
  
  
  # delete the 187: couldn't find any info on it
  to_delete <- ha_data %>%
    filter(plot == "Florestal-CF" &
             tag_number == 187)
  
    ha_data <- anti_join(ha_data, to_delete)
  
  rm(to_delete)
  
  # delete the 187: couldn't find any info on it
  to_delete <- ha_data %>%
    filter(plot == "Florestal-CF" &
             tag_number == 106)
    ha_data <- anti_join(ha_data, to_delete)
  rm(to_delete)
  
  
  })
  
   
  return(ha_data)
}