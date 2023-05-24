correct_5754 <- function(ha_data) {
  suppressMessages({
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==88 & ha_data$year==2005 & ha_data$row=="A"] <- 2
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==88 & ha_data$year==2006 & ha_data$row=="A"] <- NA
  
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==98 & ha_data$year==2006 & ha_data$row=="E"] <- NA
  
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==134 & ha_data$year==2005 & ha_data$row=="A"] <- 1
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==134 & ha_data$year==2006 & ha_data$row=="A"] <- NA
  
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==171 & ha_data$year==2005 & ha_data$row=="B"] <- 1
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==171 & ha_data$year==2006 & ha_data$row=="B"] <- 1
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==171 & ha_data$year==2006 & ha_data$row=="B"] <- NA
  
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==243 & ha_data$year==2006 & ha_data$row=="E"] <- NA
  
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==245 & ha_data$year==2005 & ha_data$row=="A"] <- 3
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==245 & ha_data$year==2006 & ha_data$row=="A"] <- NA
  
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==272  & ha_data$year==2006 & ha_data$row=="C"] <- NA
  
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==371 & ha_data$year==2006 & ha_data$row=="A"] <- 1
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==371 & ha_data$year==2006 & ha_data$row=="A"] <- NA
  
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==382.5 & ha_data$column==5 & ha_data$year==2006] <- 70
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==382.5 & ha_data$column==5 & ha_data$year==2006] <- 6
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==382.6 & row=="C" & column==6))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==382.5 & ha_data$column==5] <- 382
  
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770.3 & ha_data$column==3 & ha_data$row=="A" & ha_data$year==2005] <- 1
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770.3 & ha_data$column==3 & ha_data$row=="A" & ha_data$year==2005] <- 8
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770.3 & ha_data$column==3 & ha_data$row=="A" & ha_data$year==2005] <- "sdlg"
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==770.5 & row=="A" & column==5))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770.3 & ha_data$column==3] <- 770
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770 & ha_data$year==2006] <- "dead"
  
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==308 & ha_data$column==5 & ha_data$row=="D" & ha_data$year==2006] <- 2
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==308 & ha_data$column==5 & ha_data$row=="D" & ha_data$year==2006] <- 24
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==308 & ha_data$column==5 & ha_data$row=="D" & ha_data$year==2006] <- NA
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==318.5))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==318.6] <- 318
  
  
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==780 & ha_data$column==7 & ha_data$row=="C" & ha_data$year==2006] <- NA
  ha_data$column[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==780 & ha_data$column==7 & ha_data$row=="C"] <- 8
  
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816.3 & ha_data$column==3 & ha_data$row=="C" & ha_data$year==2005] <- 2
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816.3 & ha_data$column==3 & ha_data$row=="C" & ha_data$year==2006] <- NA
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816.8 & ha_data$column==8 & ha_data$row=="A" & ha_data$year==2006] <- "sdlg"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==845 & ha_data$year==2006 & ha_data$row=="B"] <- NA
  
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==820.7 & ha_data$column==7 & ha_data$row=="B" & ha_data$year==2006] <- 3
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==820.7 & ha_data$column==7 & ha_data$row=="B" & ha_data$year==2006] <- 70
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==820.7 & ha_data$column==7 & ha_data$row=="B" & ha_data$year==2006] <- NA
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==820.8))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==820.7] <- 820
  
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==821.8))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==821.6] <- 821
  
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==835.4 & ha_data$column==4 & ha_data$row=="E" & ha_data$year==2006] <- "sdlg"
  
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==832.4 & ha_data$column==4 & ha_data$row=="A" & ha_data$year==2006] <- "sdlg"
  
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==830.6 & ha_data$column==6 & ha_data$row=="C" & ha_data$year==2006] <- NA
  
  
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==46.4))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46.6] <- 46
  
  
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==1998] <- 2
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==1998] <- 45
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==1998] <- 1
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==1999] <- 4
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==1999] <- 62
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2000] <- 3
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2000] <- 70
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2001] <- 5
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2001] <- 32
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2002] <- 5
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2002] <- 38
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2003] <- 3
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2003] <- 37
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2004] <-5
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2004] <- 35
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2005] <- 3
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2005] <- 36
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==46 & ha_data$year==2006] <- NA
  
  
  
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==820.7 & ha_data$column==7 & ha_data$row=="B" & ha_data$year==2006] <- 70
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==820.7 & ha_data$column==7 & ha_data$row=="B" & ha_data$year==2006] <- NA
  
  
  
  
  
  # These need to the code changed from "dead "to "missing"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==1376 & ha_data$year==2005] <- "missing"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==748 & ha_data$year==2005] <- "missing"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==303 & ha_data$year==2005] <- "missing"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==855 & ha_data$year==2005] <- "missing"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==198 & ha_data$year==2005] <- "missing"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==121 & ha_data$year==2005] <- "missing"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==911 & ha_data$year==2005] <- "missing"
  
  # This "missing" code needs to be changed to NA
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==1353 & ha_data$year==2006] <- NA
  
  # 906 in on the edge of D7/E7 and wa recorded in wrong plot in one year
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==906.7 & ha_data$year==2006] <- 4
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==906.7 & ha_data$year==2006] <- 81
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==906.7] <- 906
  # delete the duplicates
  delete_906<-ha_data %>% filter(bdffp_reserve_no=="3209" & tag_number==906 & row=="E")
  ha_data <- anti_join(ha_data,delete_906)
  
  # 746 in on the edge of D5/C5 and was recorded in wrong plot in one year
  # delete the duplicates
  delete_746<-ha_data %>% filter(bdffp_reserve_no=="3209" & tag_number==746.5 & row=="C")
  ha_data <- anti_join(ha_data,delete_746)
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==746.5] <- 746
  
  # 1387 recorded in an odd location in one year. Suggests it is a misread tag in D7
  # delete the duplicates
  delete_1387<-ha_data %>% filter(bdffp_reserve_no=="3209" & tag_number==1387.7 & row=="D")
  ha_data <- anti_join(ha_data,delete_1387)
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==1387.7] <- 1387
  
  
  # plant size entered incorrectly (entered as 997, should be 97)
  ha_data$ht[ha_data$plot == "5754" & ha_data$year == 2006 & ha_data$tag_number == 445] <- 97
  
  # removing the code that was resulting in zombie
  ha_data$code[ha_data$plot == 5754 & ha_data$row == "B" & ha_data$column == "7" & ha_data$year == 2006 & ha_data$tag_number == 823.7] <- NA
  
  # 823 and 824 were marked dead, but I think that was because they were on the B7/C7
  # border and not found when surveying B7. For not the "Dead" is being removed, and 
  # and both are being placed in C7, with numbers corrected
  ha_data$code[ha_data$plot == 5754 & ha_data$row == "B" & ha_data$column == "7" & ha_data$year == 2004 & ha_data$tag_number == 823.7] <- NA
  ha_data$code[ha_data$plot == 5754 & ha_data$row == "B" & ha_data$column == "7" & ha_data$year == 2004 & ha_data$tag_number == 824.7] <- NA
  
  # removing the ULY codes
  ha_data$code[ha_data$plot == 5754 & ha_data$row == "C" & ha_data$column == "7" & ha_data$year == 2006 & ha_data$tag_number == 824.7] <- NA
  
  ha_data$code[ha_data$plot == 5754 & ha_data$row == "C" & ha_data$column == "7" & ha_data$year == 2006 & ha_data$tag_number == 823.7] <- NA
  
  # replace the values for the 1st year 
  ha_data$shts[ha_data$plot == 5754 & (ha_data$row == "C" & ha_data$column == "7") & ha_data$year == 2003 & (ha_data$tag_number == 823.7|ha_data$tag_number == 824.7)] <- 1
  ha_data$ht[ha_data$plot == 5754 & (ha_data$row == "C" & ha_data$column == "7") & ha_data$year == 2003 & (ha_data$tag_number == 823.7|ha_data$tag_number == 824.7)] <- 1
  ha_data$code[ha_data$plot == 5754 & (ha_data$row == "C" & ha_data$column == "7") & ha_data$year == 2003 & (ha_data$tag_number == 823.7|ha_data$tag_number == 824.7)] <- "sdlg" 
  # delete the duplicates
  ha_data<-ha_data[!(ha_data$plot==5754 & ha_data$row=="B" & ha_data$column==7 & ha_data$tag_number == 823.7),]
  
  ha_data<-ha_data[!(ha_data$plot==5754 & ha_data$row=="B" & ha_data$column==7 & ha_data$tag_number == 824.7),]
  # correct the number
  # str(ha_data$tag_number)
  ha_data<-ha_data %>% 
    mutate(tag_number = ifelse(plot==5754 & tag_number == 824.7, 824, tag_number))
  
  ha_data<-ha_data %>% 
    mutate(tag_number = ifelse(plot==5754 & tag_number == 823.7,823, tag_number))
  
  # correcting plot of 341 
  # it is actually in c2 (note in 2006)
  ha_data$notes[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 341] <- NA
  ha_data$column[ha_data$plot == 5754 & ha_data$tag_number == 341] <- 2
  
  # correcting 46 note in 2006 
  ha_data$notes[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 46] <- NA
  
  # correcting 845 location (noted in 2006)
  ha_data$column[ha_data$plot == 5754 & ha_data$tag_number == 845] <- 5
  ha_data$notes[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 845] <- NA
  
  # Correcting 1305
  # Need to add the 2006 measurements to 1305 in B6, then delete the incorrect 1401 in B7
  ha_data$shts[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 1305.6] <- 2
  ha_data$ht[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 1305.6] <- 70
  ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 1305.6] <- 1305
  # delete the duplicate
  delete1305 <- ha_data %>% filter(plot == 5754 & tag_number == 1305.7)
  ha_data <- anti_join(ha_data, delete1305)
  rm(delete1305)
  
  
  # delete  120 (tag replaced with 984 in 2002)
  delete120 <- ha_data %>% filter(plot == 5754 & tag_number == 120)
  ha_data <- anti_join(ha_data, delete120)
  rm(delete120)
  
  
  
  # Correcting 1329
  # Need to add the 2006 measurements to 1329 in C8, then delete the incorrect one in C9
  ha_data$shts[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 1329.8] <- 6
  ha_data$ht[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 1329.8] <- 70
  ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 1329.8] <- 1329
  # delete the duplicate
  delete1329 <- ha_data %>% filter(plot == 5754 & tag_number == 1329.9)
  ha_data <- anti_join(ha_data, delete1329)
  rm(delete1329)
  
    # Correcting 1366
  # Need to add the 2006 measurements to 1366 in B10, then delete the incorrect one in B8
  ha_data$shts[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 1366.1] <- 2
  ha_data$ht[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 1366.1] <- 22
  ha_data$code[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 1366.1] <- NA
  ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 1366.1] <- 1366
  
  # delete the duplicate
  delete1366 <- ha_data %>% filter(plot == 5754 & tag_number == 1366.8)
  ha_data <- anti_join(ha_data, delete1366)
  rm(delete1366)
  
  # delete the duplicate
  delete382 <- ha_data %>% filter(plot == 5754 & tag_number == 382.6)
  ha_data <- anti_join(ha_data, delete382)
  rm(delete382)
  
  
  # Zombie Correction
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==927 & ha_data$year==2005] <- NA
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==956 & ha_data$year==2005] <- NA
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==1388 & ha_data$year==2005] <- NA
  
  # change all the ones where a plant is dead but size was recorded as "0"
  ha_data <- ha_data %>% 
    mutate(shts = ifelse((shts == 0 & ht == 0 & code== "dead"), NA, shts)) %>% 
    mutate(ht = ifelse((shts == 0 & ht == 0 & code== "dead"), NA, ht)) %>% 
    mutate(infl = ifelse((shts == 0 & ht == 0 & code== "dead"), NA, infl))
  
  
  # Correcting NOL code  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="5754" & year==2006 & tag_number==98,NA)) %>% 
    mutate(code=replace(code, plot=="5754" & year==2004 & tag_number==316,NA)) %>% 
    mutate(code=replace(code, plot=="5754" & year==2005 & tag_number==737,NA))
  
  # delete the duplicate
  delete18 <- ha_data %>% filter(plot == 5754 & tag_number == 18)
  ha_data <- anti_join(ha_data, delete18)
  rm(delete18)
  
  # Add infloresence in 2006 to 290 & 357, then remove code
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="5754" & year==2006 & tag_number==290,NA)) %>% 
    mutate(code=replace(code, plot=="5754" & year==2006 & tag_number==357,NA)) %>% 
    mutate(notes=replace(code, plot=="5754" & year==2006 & tag_number==290,NA)) %>% 
    mutate(notes=replace(code, plot=="5754" & year==2006 & tag_number==357,NA)) %>% 
    mutate(infl=replace(infl, plot=="5754" & year==2006 & tag_number==290,1)) %>% 
    mutate(infl=replace(infl, plot=="5754" & year==2006 & tag_number==357,1)) 
  # 
  # ha_data %>% filter(plot==5754 & (tag_number==290)) 
  # ha_data %>% filter(plot==5754 & (tag_number==357)) 
  # 
  
  # added missing measurments for 765
  ha_data<-ha_data %>%
    mutate(shts=replace(shts, plot==5754 & year==2006 & tag_number==765,1)) %>% 
    mutate(ht=replace(ht, plot==5754 & year==2006 & tag_number==765,14)) 
  
  # 770 us in A5, not A3. corrected, and deleted duplicate
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5754 & year==2006 & tag_number==770,"dead")) 
  
  # delete the duplicate
  delete770 <- ha_data %>% filter(plot == 5754 & tag_number == 770 & column==3)
  ha_data <- anti_join(ha_data, delete770)
  rm(delete770)
  
  
  # 303 size in 1999
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot==5754 & year==1999 & tag_number==303,32)) 
  
  
  
  
  # 896 size in 2006 is almost certainly 110
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot==5754 & year==2006 & tag_number==896,110)) 
  
  })
  
  return(ha_data)
}