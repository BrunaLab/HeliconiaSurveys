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
  
  # ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==318 & ha_data$column==5 & ha_data$row=="D"] <- "318X"
  # ha_data <- ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==318 & row=="D"))
  
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==371 & ha_data$year==2006 & ha_data$row=="A"] <- 1
  ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==371 & ha_data$year==2006 & ha_data$row=="A"] <- NA
  
  # ha_data$column[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==382 & ha_data$column==5.875 & ha_data$row=="C"] <- 5
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==382.5 & ha_data$column==5 & ha_data$year==2006] <- 70
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==382.5 & ha_data$column==5 & ha_data$year==2006] <- 6
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==382.6 & row=="C" & column==6))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==382.5 & ha_data$column==5] <- 382
  
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770.3 & ha_data$column==3 & ha_data$row=="A" & ha_data$year==2005] <- 1
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770.3 & ha_data$column==3 & ha_data$row=="A" & ha_data$year==2005] <- 8
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770.3 & ha_data$column==3 & ha_data$row=="A" & ha_data$year==2005] <- "sdlg (1)"
  ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==770.5 & row=="A" & column==5))
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770.3 & ha_data$column==3] <- 770
  
    ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==780 & ha_data$column==7 & ha_data$row=="C" & ha_data$year==2006] <- NA
  # ha_data$column[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==780 & ha_data$column==7 & ha_data$row=="C" & ha_data$year==2006] <- 8
  # ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==780 & row=="C" & column==7))
  ha_data$column[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==780 & ha_data$column==7 & ha_data$row=="C"] <- 8
  
  # ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==812 & ha_data$column==9 & ha_data$row=="D" & ha_data$year==2006] <- NA
  # ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==812 & ha_data$column==9 & ha_data$row=="D"] <- "812X"
  
  # ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==813 & ha_data$column==9 & ha_data$row=="A"] <- "813X"
  # ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==813 & ha_data$column==5 & ha_data$row=="A" & ha_data$year==2006] <- NA
  
  ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816.3 & ha_data$column==3 & ha_data$row=="C" & ha_data$year==2005] <- 2
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816.3 & ha_data$column==3 & ha_data$row=="C" & ha_data$year==2006] <- NA
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816.8 & ha_data$column==8 & ha_data$row=="A" & ha_data$year==2006] <- NA
  # ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816 & ha_data$column==8 & ha_data$row=="A"] <- "816X"
  
  # ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==832.4 & ha_data$column==4 & ha_data$row=="A" & ha_data$year==2006] <- NA
  # ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==832 & ha_data$column==4 & ha_data$row=="A"] <- "832X"
  
  # ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==835 & ha_data$column==4 & ha_data$row=="E" & ha_data$year==2006] <- NA
  # ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==835 & ha_data$column==4 & ha_data$row=="E"] <- "835X"
  
  # ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==836 & ha_data$column==1 & ha_data$row=="D" & ha_data$year==2006] <- NA
  # ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==836 & ha_data$column==1 & ha_data$row=="D"] <- "836X"
  
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==845 & ha_data$year==2006 & ha_data$row=="B"] <- NA
  
  # These need to the code changed from "dead "to "missing"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==1376 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==748 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==303 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==855 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==198 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==121 & ha_data$year==2005] <- "missing (60)"
  # TODO: find 879
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==879 & ha_data$year==2005] <- "missing (60)"
  ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==911 & ha_data$year==2005] <- "missing (60)"
  
  # zombie_rows_to_del <- data.frame(
  #   tag_number = c(39,39,39,39,110,110,110,180,180,180,180,184,184,184,185,185,
  #                  192,192,209,209,209,209,221,221,221,223,223,238,238,238,238,
  #                  250,250,250,250,250,250,280,280,280,280,280,283,283,283,283,
  #                  283,336,336,336,336,354,354,354,354,354,354,354,362,362,366,
  #                  366,366,386,386,386,386,386,386,419,419,419,419,419,419,420,
  #                  420,420,420,420,422,422,422,422,422,422,430,430,431,431,431,
  #                  431,431,431,436,436,449,449,449,449,449,459,459,459,459,459,
  #                  459,460,460,460,460,468,468,468,468,468,469,469,469,474,474,
  #                  474,474,474,478,478,478,478,478,480,480,481,481,481,482,482,
  #                  482,482,482,488,488,488,488,488,489,489,489,492,492,492,492,
  #                  496,496,496,496,496,496,499,499,499,515,515,515,515,515,515,
  #                  540,540,540,540,540,554,554,554,554,554,554,633,633,633,634,
  #                  634,645,645,649,649,649,664,664,669,669,669,670,670,680,680,
  #                  683,683,683,683,683,684,684,684,684,684,704,704,704,716,716,
  #                  716,776,776,785,785,785,795,795,797,797,894,894,902,902,902,
  #                  918,918,918,924,924,924,927,931,931,931,945,945,945,946,946,
  #                  946,947,947,947,949,949,949,949,949,954,954,956,963,963,963,
  #                  971,971,978,978,978,982,982,982,988,988,991,991,991,991,997,
  #                  997,997,1306,1306,1306,1317,1317,1317,1337,1337,1352,1352,1352,
  #                  1353,1353,1364,1364,1364,1364,1384,1384,1388,1400,1400,1400,
  #                  1400,823,823,823,823,824,824,824,824,120,120,120  ),
  #   year = c(2003,2004,2005,2006,2004,2005,2006,2003,2004,2005,2006,2004,2005,
  #            2006,2005,2006,2005,2006,2003,2004,2005,2006,2004,2005,2006,2005,
  #            2006,2003,2004,2005,2006,2001,2002,2003,2004,2005,2006,2002,2003,
  #            2004,2005,2006,2002,2003,2004,2005,2006,2003,2004,2005,2006,2000,
  #            2001,2002,2003,2004,2005,2006,2005,2006,2004,2005,2006,2001,2002,
  #            2003,2004,2005,2006,2001,2002,2003,2004,2005,2006,2002,2003,2004,
  #            2005,2006,2001,2002,2003,2004,2005,2006,2005,2006,2001,2002,2003,
  #            2004,2005,2006,2005,2006,2002,2003,2004,2005,2006,2001,2002,2003,
  #            2004,2005,2006,2003,2004,2005,2006,2002,2003,2004,2005,2006,2004,
  #            2005,2006,2002,2003,2004,2005,2006,2002,2003,2004,2005,2006,2005,
  #            2006,2004,2005,2006,2002,2003,2004,2005,2006,2002,2003,2004,2005,
  #            2006,2004,2005,2006,2003,2004,2005,2006,2001,2002,2003,2004,2005,
  #            2006,2004,2005,2006,2001,2002,2003,2004,2005,2006,2002,2003,2004,
  #            2005,2006,2001,2002,2003,2004,2005,2006,2004,2005,2006,2005,2006,
  #            2005,2006,2004,2005,2006,2005,2006,2004,2005,2006,2005,2006,2005,
  #            2006,2002,2003,2004,2005,2006,2002,2003,2004,2005,2006,2004,2005,
  #            2006,2004,2005,2006,2005,2006,2004,2005,2006,2005,2006,2005,2006,
  #            2005,2006,2004,2005,2006,2004,2005,2006,2004,2005,2006,2006,2004,
  #            2005,2006,2004,2005,2006,2004,2005,2006,2004,2005,2006,2002,2003,
  #            2004,2005,2006,2005,2006,2006,2004,2005,2006,2005,2006,2004,2005,
  #            2006,2004,2005,2006,2005,2006,2003,2004,2005,2006,2004,2005,2006,
  #            2004,2005,2006,2004,2005,2006,2005,2006,2004,2005,2006,2005,2006,
  #            2003,2004,2005,2006,2005,2006,2006,2003,2004,2005,2006,2004,2005,
  #            2005,2006,2004,2005,2005,2006,2004,2005,2006  )
  # )
  # zombie_rows_to_del$bdffp_reserve_no<-3209
  # zombie_rows_to_del$bdffp_reserve_no<-as.factor(zombie_rows_to_del$bdffp_reserve_no)
  # zombie_rows_to_del$tag_number<-as.character(zombie_rows_to_del$tag_number)
  # zombie_rows_to_del$year<-as.character(zombie_rows_to_del$year)
  # ha_data <- anti_join(ha_data,zombie_rows_to_del)
  # 
  # rm(zombie_rows_to_del)
  
  # # Need to change all the ones where a plant is dead but size was recorded as "0"
  ha_data <- ha_data %>% mutate(shts = ifelse((shts == 0 & ht == 0 & code== "dead (2)"), 
                                              NA, shts)) %>% 
    mutate(ht = ifelse((shts == 0 & ht == 0 & code== "dead (2)"), 
                       NA, ht)) %>% 
    mutate(infl = ifelse((shts == 0 & ht == 0 & code== "dead (2)"), 
                         NA, infl))
  
  
  # Correcting duplicate records
  
  # 906 in on the edge of D7/E7 and wa recorded in wrong plot in one year
  ha_data$shts[ha_data$bdffp_reserve_no=="3209" & 
                 ha_data$tag_number==906.7 & ha_data$year==2006] <- 4
  ha_data$ht[ha_data$bdffp_reserve_no=="3209" & 
               ha_data$tag_number==906.7 & ha_data$year==2006] <- 81
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & 
                       ha_data$tag_number==906.7] <- 906
  # delete the duplicates
  delete_906<-ha_data %>% filter(bdffp_reserve_no=="3209" &
                                   tag_number==906 &
                                   row=="E")
  ha_data <- anti_join(ha_data,delete_906)
  
  # 746 in on the edge of D5/C5 and was recorded in wrong plot in one year
  # delete the duplicates
  delete_746<-ha_data %>% filter(bdffp_reserve_no=="3209" &
                                   tag_number==746.5 &
                                   row=="C")
  ha_data <- anti_join(ha_data,delete_746)
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & 
                       ha_data$tag_number==746.5] <- 746
  
  
  # 1387 recorded in an odd location in one year. Suggests it is a misread tag in D7
  # delete the duplicates
  delete_1387<-ha_data %>% filter(bdffp_reserve_no=="3209" &
                                    tag_number==1387.7 &
                                    row=="D")
  ha_data <- anti_join(ha_data,delete_1387)
  ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & 
                       ha_data$tag_number==1387.7] <- 1387
  
  
  
  # HA_ID_Number 8612 not a plant, its a treefall record
  delete_8612<-ha_data %>% filter(bdffp_reserve_no=="3209" &
                                    HA_ID_Number==8612)
  ha_data <- anti_join(ha_data,delete_8612)
  
  
  
  
  
# TODO:
  # what happened to the data for 120? did it get lost in a tag switch?
  # 5754	10-ha	120	1998	NA	NA	NA	
  # 5754	10-ha	120	1999	NA	NA	NA	
  # 5754	10-ha	120	2000	NA	NA	NA	
  # 5754	10-ha	120	2001	NA	NA	NA	
  # 5754	10-ha	120	2002	NA	NA	NA	
  # 5754	10-ha	120	2003	0	0	dead (2)	
  
# TODO:
  # Need to add 2006 seedling notations
  # Figure out plant 46
  # Need to add 1997 data
  # Remove all the ones with NA tag numbers in ha_data
  
  
  
  # ORIGINAL CORRECT 5754
  
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
  
  
  
  
  
  
  
  
  
  # Correcting 1305
  # Need to add the 2006 measurements to 1305 in B6, then delete the incorrect 1401 in B7
  ha_data$shts[ha_data$plot == 5754 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 1305.6] <- 2
  
  ha_data$ht[ha_data$plot == 5754 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 1305.6] <- 70
  
  ha_data$tag_number[ha_data$plot == 5754 &
                 ha_data$tag_number == 1305.6] <- 1305
  
  # delete the duplicate
  delete1305 <- ha_data %>%
    filter(plot == 5754 &
             tag_number == 1305.7)
  ha_data <- anti_join(ha_data, delete1305)
  rm(delete1305)
  
  
  
  # Correcting 1329
  # Need to add the 2006 measurements to 1329 in C8, then delete the incorrect one in C9
  ha_data$shts[ha_data$plot == 5754 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 1329.8] <- 6
  
  ha_data$ht[ha_data$plot == 5754 &
               ha_data$year == 2006 &
               ha_data$tag_number == 1329.8] <- 70
  
  ha_data$tag_number[ha_data$plot == 5754 &
                       ha_data$tag_number == 1329.8] <- 1329
  
  # delete the duplicate
  delete1329 <- ha_data %>%
    filter(plot == 5754 &
             tag_number == 1329.9)
  ha_data <- anti_join(ha_data, delete1329)
  rm(delete1329)
  
  
  
  # Correcting 1366
  # Need to add the 2006 measurements to 1366 in B10, then delete the incorrect one in B8
  ha_data$shts[ha_data$plot == 5754 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 1366.1] <- 2
  
  ha_data$ht[ha_data$plot == 5754 &
               ha_data$year == 2006 &
               ha_data$tag_number == 1366.1] <- 22
  
  
  ha_data$code[ha_data$plot == 5754 &
               ha_data$year == 2006 &
               ha_data$tag_number == 1366.1] <- NA
  
  ha_data$tag_number[ha_data$plot == 5754 &
                       ha_data$tag_number == 1366.1] <- 1366
  
  # delete the duplicate
  delete1366 <- ha_data %>%
    filter(plot == 5754 &
             tag_number == 1366.8)
  ha_data <- anti_join(ha_data, delete1366)
  rm(delete1366)
  
  
  
  
  # 
  # # Correcting 382
  # # Need to add the 2006 measurements to 382 in 5, then delete the incorrect one in 6
  # ha_data$shts[ha_data$plot == 5754 &
  #                ha_data$year == 2006 &
  #                ha_data$tag_number == 382.5] <- 3
  # 
  # ha_data$ht[ha_data$plot == 5754 &
  #              ha_data$year == 2006 &
  #              ha_data$tag_number == 382.5] <- 70
  # 
  # 
  # ha_data$code[ha_data$plot == 5754 &
  #                ha_data$year == 2006 &
  #                ha_data$tag_number == 382.5] <- NA
  # 
  # ha_data$tag_number[ha_data$plot == 5754 &
  #                      ha_data$tag_number == 382.5] <- 382
  
  # delete the duplicate
  delete382 <- ha_data %>%
    filter(plot == 5754 &
             tag_number == 382.6)
  ha_data <- anti_join(ha_data, delete382)
  rm(delete382)
  
  
  # 
  # # Correcting 770
  # # Need to add the 2006 measurements to 382 in 5, then delete the incorrect one in 6
  # ha_data$shts[ha_data$plot == 5754 &
  #                ha_data$year == 2005 &
  #                ha_data$tag_number == 770.3] <- 1
  # 
  # ha_data$ht[ha_data$plot == 5754 &
  #              ha_data$year == 2005 &
  #              ha_data$tag_number == 770.3] <- 8
  # 
  # 
  # ha_data$code[ha_data$plot == 5754 &
  #                ha_data$year == 2005 &
  #                ha_data$tag_number == 770.3] <- 'sdlg (1)'
  # 
  # ha_data$tag_number[ha_data$plot == 5754 &
  #                      ha_data$tag_number == 770.3] <- 770
  # 
  # # delete the duplicate
  # delete770 <- ha_data %>%
  #   filter(plot == 5754 &
  #            tag_number == 770.5)
  # ha_data <- anti_join(ha_data, delete770)
  # rm(delete770)
  
  
  return(ha_data)
}