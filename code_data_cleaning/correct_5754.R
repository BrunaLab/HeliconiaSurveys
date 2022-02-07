correct_5754 <- function(ha_data) {
  
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
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770.3 & ha_data$column==3 & ha_data$row=="A" & ha_data$year==2005] <- "sdlg (1)"
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==770.5 & row=="A" & column==5))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770.3 & ha_data$column==3] <- 770
  
  
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==308 & ha_data$column==5 & ha_data$row=="D" & ha_data$year==2006] <- 2
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==308 & ha_data$column==5 & ha_data$row=="D" & ha_data$year==2006] <- 24
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==308 & ha_data$column==5 & ha_data$row=="D" & ha_data$year==2006] <- NA
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==318.5))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==318.6] <- 318
  
  
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==780 & ha_data$column==7 & ha_data$row=="C" & ha_data$year==2006] <- NA
  ha_data$column[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==780 & ha_data$column==7 & ha_data$row=="C"] <- 8
  
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816.3 & ha_data$column==3 & ha_data$row=="C" & ha_data$year==2005] <- 2
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816.3 & ha_data$column==3 & ha_data$row=="C" & ha_data$year==2006] <- NA
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816.8 & ha_data$column==8 & ha_data$row=="A" & ha_data$year==2006] <- "sdlg (1)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==845 & ha_data$year==2006 & ha_data$row=="B"] <- NA
  
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==820.7 & ha_data$column==7 & ha_data$row=="B" & ha_data$year==2006] <- 3
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==820.7 & ha_data$column==7 & ha_data$row=="B" & ha_data$year==2006] <- 70
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==820.7 & ha_data$column==7 & ha_data$row=="B" & ha_data$year==2006] <- NA
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==820.8))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==820.7] <- 820
  
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==821.8))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==821.6] <- 821
  
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==835.4 & ha_data$column==4 & ha_data$row=="E" & ha_data$year==2006] <- "sdlg (1)"
  
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==832.4 & ha_data$column==4 & ha_data$row=="A" & ha_data$year==2006] <- "sdlg (1)"
  
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
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==1376 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==748 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==303 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==855 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==198 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==121 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==911 & ha_data$year==2005] <- "missing (60)"
  
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
  ha_data$code[ha_data$plot == 5754 & (ha_data$row == "C" & ha_data$column == "7") & ha_data$year == 2003 & (ha_data$tag_number == 823.7|ha_data$tag_number == 824.7)] <- "sdlg (1)" 
  # delete the duplicates
  ha_data<-ha_data[!(ha_data$plot==5754 & ha_data$row=="B" & ha_data$column==7 & ha_data$tag_number == 823.7),]
  
  ha_data<-ha_data[!(ha_data$plot==5754 & ha_data$row=="B" & ha_data$column==7 & ha_data$tag_number == 824.7),]
  # correct the number
  # str(ha_data$tag_number)
  ha_data<-ha_data %>% 
    mutate(tag_number = ifelse(plot==5754 & tag_number == 824.7, 824, tag_number))
  
  ha_data<-ha_data %>% 
    mutate(tag_number = ifelse(plot==5754 & tag_number == 823.7,823, tag_number))
  
  # Correcting 1305
  # Need to add the 2006 measurements to 1305 in B6, then delete the incorrect 1401 in B7
  ha_data$shts[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 1305.6] <- 2
  ha_data$ht[ha_data$plot == 5754 & ha_data$year == 2006 & ha_data$tag_number == 1305.6] <- 70
  ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 1305.6] <- 1305
  # delete the duplicate
  delete1305 <- ha_data %>% filter(plot == 5754 & tag_number == 1305.7)
  ha_data <- anti_join(ha_data, delete1305)
  rm(delete1305)
  
  
  
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
    mutate(shts = ifelse((shts == 0 & ht == 0 & code== "dead (2)"), NA, shts)) %>% 
    mutate(ht = ifelse((shts == 0 & ht == 0 & code== "dead (2)"), NA, ht)) %>% 
    mutate(infl = ifelse((shts == 0 & ht == 0 & code== "dead (2)"), NA, infl))
  

# # adding note for duplicate tags  -----------------------------------------

#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   318.5
#   318.6
#   46.4
#   46.6
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   810.1
#   810.5
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   811.5
#   811.9
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   812.4
#   812.9
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   813.5
#   813.9
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   814.5
#   814.8
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   816.3
#   816.8
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   817.7
#   817.9
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   819.7
#   819.8
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   820.7
#   820.8
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   821.6
#   821.8
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   822.6
#   822.7
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   826.5
#   826.7
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   827.5
#   827.9
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   828.1
#   828.5
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   829.5
#   829.7
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   830.5
#   830.6
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   831.5
#   831.9
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   832.4
#   832.8
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   833.4
#   833.7
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   834.4
#   834.7
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   835.4
#   835.6
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   836.1
#   836.5
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   858.8
#   858.9
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   859.8
#   859.9
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   860.8
#   860.9
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
#   ha_data$tag_number[ha_data$plot == 5754 & ha_data$tag_number == 0000] <- 0000
# 
#   ha_data <- 
#     ha_data %>%
#     mutate(dupe_tag = ifelse(plot == 5754 & str_detect(tag_number, "[.]"), "duplicate", NA))
#      
#   
  # filter(duplicate_tag, grepl("[.]", tag_number, ignore.case = TRUE))
  #    summary(as.factor(foo$code))
  #    
     
  #    
  # ha_data %>% 
  #   mutate(code = str_detect(tag_number, "[.]"),"duplicate","code")
  # TODO:
  # what happened to the data for 120? did it get lost in a tag switch?
  # 5754	10-ha	120	1998	NA	NA	NA	
  # 5754	10-ha	120	1999	NA	NA	NA	
  # 5754	10-ha	120	2000	NA	NA	NA	
  # 5754	10-ha	120	2001	NA	NA	NA	
  # 5754	10-ha	120	2002	NA	NA	NA	
  # 5754	10-ha	120	2003	0	0	dead (2)	
  
  # Need to add 2006 seedling notations
  # plant 46 in B4 is actually 6. (2,112 in 1999) can track down what appened to it?
  # try to sort out ULYs
  # find 879
  # ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==879 & ha_data$year==2005] <- "missing (60)"
  
  
  return(ha_data)
}