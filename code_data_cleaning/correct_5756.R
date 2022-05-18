
correct_5756 <- function(ha_data) {
  
  
  # in 2008 data for 176 incorrectly entered as 199
  # add 
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$tag_number == 480 & 
                 ha_data$year == 2008] <- 3
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$tag_number == 480 & 
               ha_data$year == 2008] <-50
  
  # remove 
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$tag_number == 431 &
                 ha_data$year == 2008] <- NA
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$tag_number == 431 &
               ha_data$year == 2008] <- NA
  
  
  
  # in 2008 data for 1678 incorrectly entered as 551
  # add 
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$tag_number == 1678 & 
                 ha_data$year == 2008] <- 1
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$tag_number == 1678 & 
               ha_data$year == 2008] <- 9
  
  # remove 
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$tag_number == 551 &
                 ha_data$year == 2008] <- NA
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$tag_number == 551 &
               ha_data$year == 2008] <- NA
  
  # in 2008 data for 1714 incorrectly entered as 1231
  # add 
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$tag_number == 1714 & 
                 ha_data$year == 2008] <- 3
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$tag_number == 1714 & 
               ha_data$year == 2008] <- 20
  
  # remove 
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$tag_number == 1231 &
                 ha_data$year == 2008] <- NA
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$tag_number == 1231 &
               ha_data$year == 2008] <- NA
  
  
  
  # delete incorrect 2008 notes
  ha_data$notes[ha_data$plot == 5756 &
                 ha_data$tag_number == 1609 & 
                 ha_data$year == 2008] <- NA
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$tag_number == 1629 & 
               ha_data$year == 2008] <- NA
  
  # in 2008 data for 1684 incorrectly entered as 1864. There is no 1864
  # add 
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$tag_number == 1684 & 
                 ha_data$year == 2008] <- 1
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$tag_number == 1684 & 
               ha_data$year == 2008] <- 11
  
  # add the 2007 data incorrectly recorded as 1864
  ha_data<-ha_data %>%
    mutate(shts=if_else((plot == 5756 & tag_number == 1684 & year==2007),1,shts)) %>% 
    mutate(ht=if_else((plot == 5756 & tag_number == 1684 & year == 2007),14,ht)) %>% 
    mutate(code=if_else((plot == 5756 & tag_number == 1684 & year == 2007),"sdlg",code))
    
  
  # remove 1864
  delete1864 <- ha_data %>%
    filter(plot == 5756 &
             tag_number == 1864)
  ha_data <- anti_join(ha_data, delete1864)
  rm(delete1864)
   
  
  
  
  
  ha_data$code[ha_data$plot == '5756' &
                 (ha_data$year == 2005 |ha_data$year == 2006|ha_data$year == 2007) &
                 ha_data$tag_number == 983] <- NA
  ha_data$shts[ha_data$plot == '5756' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 983] <- NA
  ha_data$ht[ha_data$plot == '5756' &
               ha_data$year == 2004 &
               ha_data$tag_number == 983] <- NA
  ha_data$infl[ha_data$plot == '5756' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 983] <- NA
  
  ha_data$code[ha_data$plot == '5756' &
                 (ha_data$year == 2005 |ha_data$year == 2006) &
                 ha_data$tag_number == 7] <- NA
  ha_data$shts[ha_data$plot == '5756' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 7] <- NA
  ha_data$ht[ha_data$plot == '5756' &
               ha_data$year == 2004 &
               ha_data$tag_number == 7] <- NA
  ha_data$infl[ha_data$plot == '5756' &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 7] <- NA
  
  # tag no. 793
  ha_data$code[ha_data$plot == 5756 &
                 (ha_data$year == 2005 |
                    ha_data$year == 2006) &
                 ha_data$tag_number == 793] <- "missing"
  
  # Tag 372
  ha_data$ht[ha_data$plot == "5756" & ha_data$year == 2005 & ha_data$tag_number == 372] <- 26
  
  
  # Tag 1616
  ha_data$ht[ha_data$plot == "5756" & ha_data$year == 2004 & ha_data$tag_number == 1616] <- 77
  ha_data$shts[ha_data$plot == "5756" & ha_data$year == 2004 & ha_data$tag_number == 1616] <- 4
  ha_data$code[ha_data$plot == 5756 &
                 (ha_data$year == 2005 | ha_data$year == 2006) &
                 ha_data$tag_number == 1616] <- "missing"
  
  

  
  

  # Plant 929
  # 929 in C8 is a renumber after tag was lost, I think it was written down
  # incorrectly and needs to be 2x in field
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2007 &
                 ha_data$row == "C" &
                 ha_data$column == 8 &
                 ha_data$tag_number == 929] <- "ULY"
  
  # Plant 816
  # 816 in D9 is a renumber after tag was lost, I think it was written down
  # incorrectly and needs to be 2x in field
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2009 &
                 ha_data$row == "D" &
                 ha_data$column == 9 &
                 ha_data$tag_number == 816] <- "ULY"
  
  # tag no 29
  # 29 in 5756 was actually in E3, and was retagged as 1663 in 07
  ha_data <- ha_data %>%
    mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 1998), 54, ht)) %>%
    mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 1999), 56, ht)) %>%
    mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2000), 96, ht)) %>%
    mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2001), 79, ht)) %>%
    mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2002), 67, ht)) %>%
    mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2003), 55, ht)) %>%
    mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2004), 52, ht)) %>%
    mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2005), 15, ht)) %>%
    mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 1998), 2, shts)) %>%
    mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 1999), 4, shts)) %>%
    mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2000), 5, shts)) %>%
    mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2001), 9, shts)) %>%
    mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2002), 5, shts)) %>%
    mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2003), 3, shts)) %>%
    mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2004), 3, shts)) %>%
    mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2005), 2, shts))
  ha_data$code[ha_data$plot == "5756" &
                 (ha_data$year == 2005 |
                    ha_data$year == 2006) &
                 ha_data$tag_number == 1663] <- NA
  to_delete <- ha_data %>%
    filter(plot == "5756" &
             tag_number == 29 &
             row == "E" &
             column == 3)
  ha_data <- anti_join(ha_data, to_delete)
  rm(to_delete)
  
  # tag_no 1602 delete the incorrect duplicate in A5
  ha_data <- ha_data[!(ha_data$plot == "5756" &
                         ha_data$tag_number == 1602 &
                         ha_data$row == "A" &
                         ha_data$column == 5), ]
  
  # Updating Codes 
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 1261] <- "missing"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 1292] <- "missing"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 1294] <- "missing"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 141] <- "missing"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 690] <- "missing"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 707] <- "missing"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 707] <- "missing"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 707] <- "missing"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 50] <- "under treefall"
  
  ha_data$code[ha_data$plot == "5756" &
                 (ha_data$year == 2008 | ha_data$year == 2009) &
                 ha_data$tag_number == 1662] <- "missing"
  
  # incorrectly recorded 10 infl in 2007, should be NA
  ha_data$infl[ha_data$plot == "5756" &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 403] <- NA
  
  # incorrectly recorded as seedling
  # upon 2x of data sheet found it also had infl
  ha_data$code[ha_data$plot == 5756 &
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 1789] <- "ULY"
  
  ha_data$infl[ha_data$plot == 5756 &
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 1789] <- 1
  
  # something happened in 2007 with 332 and 933 in A7.  
  # Subsequent years have plant 933 (which should be dead)with size measurements
  # that are clearly 332. I think someone maybe changed the tag 
  # without noting it, otherwise the subsequent years would have discovered the 
  # issue I am correcting the data (data for 332 going to 332) 
  # and noting a field 2x to be conducted.
  
  
  
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "A" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 933 &
                (ha_data$year == 2006 |
                    ha_data$year == 2007 |
                    ha_data$year == 2008 |
                    ha_data$year == 2009) ] <- NA
  
  ha_data$ht[ha_data$plot == 5756 &
                 ha_data$row == "A" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 933 &
                 (ha_data$year == 2006 |
                    ha_data$year == 2007 |
                    ha_data$year == 2008 |
                    ha_data$year == 2009) ] <- NA
  
  
  # add correct data to  332
  
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "A" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 332 &
                 (ha_data$year == 2006 |
                    ha_data$year == 2008) ] <- 7
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "A" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 332 &
                 (ha_data$year == 2007) ] <- 10
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "A" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 332 &
                 (ha_data$year == 2009) ] <- 4
  
  ha_data$ht[ha_data$plot == 5756 &
                 ha_data$row == "A" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 332 &
                 (ha_data$year == 2006) ] <- 70
  
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$row == "A" &
               ha_data$column == "7" &
               ha_data$tag_number == 332 &
               (ha_data$year == 2007) ] <- 72
  
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$row == "A" &
               ha_data$column == "7" &
               ha_data$tag_number == 332 &
               (ha_data$year == 2008) ] <- 74
  
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$row == "A" &
               ha_data$column == "7" &
               ha_data$tag_number == 332 &
               (ha_data$year == 2009) ] <- 74
  
  
  ha_data$infl[ha_data$plot == 5756 &
               ha_data$row == "A" &
               ha_data$column == "7" &
               ha_data$tag_number == 332 &
               (ha_data$year == 2000) ] <- 1
  
  ha_data$infl[ha_data$plot == 5756 &
                 ha_data$row == "A" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 332 &
                 (ha_data$year == 2009) ] <- 1
  
  ha_data$code[ha_data$plot == 5756 &
               ha_data$row == "A" &
               ha_data$column == "7" &
               ha_data$tag_number == 332 &
               (ha_data$year == 2007 |ha_data$year == 2006) ] <- NA
  # No idea what 816 in D9 is - big and late to be ULY, no match for missing.
  # Maybe a tage replacement with the old tag? Will mark as 816.2 and 
  # note for field 2x
  ha_data$tag_number[ha_data$plot == 5756 &
                       ha_data$row == "D" & 
                       ha_data$column == "9" & 
                       ha_data$tag_number == 816] <- 816.2
  
  # # 919 to 1760 (with a year incorrectly recorded as 929)
  # delete the years no longer needed
  ha_data<-ha_data[!(ha_data$plot==5756 &
                       (ha_data$year==2008 | ha_data$year==2009) &
                       ha_data$tag_number==919),]
  # Add correct shts, height,code in 2007 (incorrectly recorded as 929)
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "C" &
                 ha_data$column == "8" &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 919] <- 1
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$row == "C" &
               ha_data$column == "8" &
               ha_data$year == 2007 &
               ha_data$tag_number == 919] <- 17
  ha_data$code[ha_data$plot == 5756 &
                 ha_data$row == "C" &
                 ha_data$column == "8" &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 919] <- NA
  # delete the incorrectly noted 929 (should have been 919)
  ha_data<-ha_data[!(ha_data$plot==5756 &
                       (ha_data$column==8 & ha_data$row=="C") &
                       ha_data$tag_number==929),]
  # remove the years form 1760, we will replace with the ones from 919
  ha_data<-ha_data[!(ha_data$plot==5756 &
                       ha_data$column==8 & 
                       ha_data$row=="C" &
                       (ha_data$year == 1998 |ha_data$year == 1999 |
                          ha_data$year == 2000 |ha_data$year == 2001 |
                          ha_data$year == 2002 |ha_data$year == 2003 |
                          ha_data$year == 2004 |ha_data$year == 2005 |
                          ha_data$year == 2006 |ha_data$year == 2007 ) &
                       ha_data$tag_number==1760),]
  #change the code on 1760
  ha_data$code[ha_data$plot == 5756 &
                 ha_data$row == "C" &
                 ha_data$column == "8" &
                 ha_data$year == 2008 &
                 ha_data$tag_number == 1760] <- NA
  # convert the 919 to the new tag nmumber of 1760
  ha_data$tag_number[ha_data$plot == 5756 &
                       ha_data$row == "C" &
                       ha_data$column == "8" &
                       ha_data$tag_number == 919] <- 1760
  # change the y coordinate
  ha_data$y_09[ha_data$plot == 5756 &
                 ha_data$row == "C" &
                 ha_data$column == "8" &
                 ha_data$tag_number == 1760] <- 2.4
  
  
  
  
  # delete the duplicate 1276 in B1 
  delete1276 <- ha_data %>%
    filter(plot == 5756 &
             tag_number == 1276 &
             row == "B" &
             column == 1)
  ha_data <- anti_join(ha_data, delete1276)
  rm(delete1276)
  # 
  
  
  # 1279 is in D3, recorded in D6 in one year (2006) 
  # Add the 06 data to D1 and delete D3
  
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "D" &
                 ha_data$column == "3" &
                 ha_data$tag_number == 1279 & 
                 ha_data$year ==2006] <- 1
  
  
  ha_data$ht[ha_data$plot == 5756 &
                 ha_data$row == "D" &
                 ha_data$column == "3" &
                 ha_data$tag_number == 1279 & 
                 ha_data$year ==2006] <- 14
  
  
  ha_data$code[ha_data$plot == 5756 &
               ha_data$row == "D" &
               ha_data$column == "3" &
               ha_data$tag_number == 1279 & 
               ha_data$year ==2006] <- NA

  
  # delete the duplicate 1279 in D6 
  delete1279 <- ha_data %>%
    filter(plot == 5756 &
             tag_number == 1279 &
             row == "D" &
             column == 6)
  ha_data <- anti_join(ha_data, delete1279)
  rm(delete1279)
  
  
# 1655 
  ha_data$ht[ha_data$plot == 5756 &
                 ha_data$row == "B" &
                 ha_data$column == "8" &
                 ha_data$tag_number == 1655 & 
                 ha_data$year ==2007] <- 33
  
  
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "B" &
                 ha_data$column == "8" &
                 ha_data$tag_number == 1655 & 
               ha_data$year ==2007] <- 2
  
  ha_data$code[ha_data$plot == 5756 &
                 ha_data$row == "B" &
                 ha_data$column == "8" &
                 ha_data$tag_number == 1655 & 
                 ha_data$year ==2007] <- NA
  
  ha_data$code[ha_data$plot == 5756 &
                 ha_data$row == "B" &
                 ha_data$column == "8" &
                 ha_data$tag_number == 1655 & 
                 ha_data$year ==2008] <- "missing"
  
  # delete the duplicate 1655  
  keep1655 <- ha_data %>%
    filter(plot == 5756 &
             tag_number == 1655 &
             row == "B" &
             column == 8 & 
             x_09==7.6)
  # Delete the incorrect one
  ha_data<-ha_data[!(ha_data$plot==5756 &
                       (ha_data$column==8 & ha_data$row=="B") &
                       ha_data$tag_number==1655),]
  
  ha_data <- bind_rows(ha_data, keep1655)
  rm(keep1655)
  
  # 1686 
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$row == "E" &
               ha_data$column == "2" &
               ha_data$tag_number == 1686 & 
               ha_data$year ==2008] <- 16
  
  
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "B" &
                 ha_data$column == "8" &
                 ha_data$tag_number == 1686 & 
                 ha_data$year ==2008] <- 1
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$row == "E" &
               ha_data$column == "2" &
               ha_data$tag_number == 1686 & 
               ha_data$year ==2007] <- 16
  
  
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "E" &
                 ha_data$column == "2" &
                 ha_data$tag_number == 1686 & 
                 ha_data$year ==2007] <- 1
  
  
  ha_data$code[ha_data$plot == 5756 &
                 ha_data$row == "E" &
                 ha_data$column == "2" &
                 ha_data$tag_number == 1686 & 
                 ha_data$year ==2007] <- "no tag"
  
  # delete the duplicate 1686  
  keep1686 <- ha_data %>%
    filter(plot == 5756 &
             tag_number == 1686 &
             row == "E" &
             column == 2 & 
             x_09==2)
  # Delete the incorrect one
  ha_data<-ha_data[!(ha_data$plot==5756 &
                       (ha_data$column==2 & ha_data$row=="E") &
                       ha_data$tag_number==1686),]
  
  ha_data <- bind_rows(ha_data, keep1686)
  rm(keep1686)
  
  
  # 1789 in C2 looks like it was a mistake, recorded number incorrectly 
  # delete it

  delete1789 <- ha_data %>%
    filter(plot == 5756 &
             tag_number == 1789 &
             row == "C" &
             column == 2)
  ha_data <- anti_join(ha_data, delete1789)
  rm(delete1789)
  
  
  # 659 in A3: delete
  
  delete659 <- ha_data %>%
    filter(plot == 5756 &
             tag_number == 659 &
             row == "A" &
             column == 3)
  ha_data <- anti_join(ha_data, delete659)
  rm(delete659)
  
  # 1290 was missing in 07, appears top have been retagged as 1686
    # add the 2007 data incorrectly recorded as 1864
  #  also fixed missings shts in 2008
  
  ha_data<-ha_data %>%
    mutate(shts=if_else((plot == 5756 & tag_number == 1686 & year == 2008),1,shts)) %>% 
    mutate(shts=if_else((plot == 5756 & tag_number == 1686 & year==2006),1,shts)) %>% 
    mutate(ht=if_else((plot == 5756 & tag_number == 1686 & year == 2006),13,ht)) %>% 
  mutate(shts=if_else((plot == 5756 & tag_number == 1686 & year==2005),1,shts)) %>% 
    mutate(ht=if_else((plot == 5756 & tag_number == 1686 & year == 2005),13,ht)) %>% 
  mutate(shts=if_else((plot == 5756 & tag_number == 1686 & year==2004),1,shts)) %>% 
    mutate(ht=if_else((plot == 5756 & tag_number == 1686 & year == 2004),15,ht)) %>% 
    mutate(code=if_else((plot == 5756 & tag_number == 1686 & year == 2004),"ULY",code)) %>% 
        mutate(code=replace(code,(plot == 5756 & tag_number == 1686 & year == 2007),NA))
  
  # Delete 1290
  
  delete1290 <- ha_data %>%
    filter(plot == 5756 &
             tag_number == 1290 &
             row == "E" &
             column == 2)
  ha_data <- anti_join(ha_data, delete1290)
  rm(delete1290)
  
  
  # 976
  # On B7/C7 border, so recorded in C7 in 2 yrs. 
  # add 06 and 07 measuremnts to B7 and delete C7
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$row == "B" &
               ha_data$column == "7" &
               ha_data$tag_number == 976 & 
               ha_data$year ==2006] <- 31
  
  
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "B" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 976 & 
                 ha_data$year ==2006] <- 3
  
  
  ha_data$code[ha_data$plot == 5756 &
                 ha_data$row == "B" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 976 & 
                 ha_data$year ==2006] <- NA
  
  
  ha_data$ht[ha_data$plot == 5756 &
               ha_data$row == "B" &
               ha_data$column == "7" &
               ha_data$tag_number == 976 & 
               ha_data$year ==2007] <- 28
  
  
  ha_data$shts[ha_data$plot == 5756 &
                 ha_data$row == "B" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 976 & 
                 ha_data$year ==2007] <- 3
  
  
  ha_data$code[ha_data$plot == 5756 &
                 ha_data$row == "B" &
                 ha_data$column == "7" &
                 ha_data$tag_number == 976 & 
                 ha_data$year ==2007] <- NA
  
  
  
  # 976 in C7: delete
  
  delete976 <- ha_data %>%
    filter(plot == 5756 &
             tag_number == 976 &
             row == "C" &
             column == 7)
  ha_data <- anti_join(ha_data, delete976)
  rm(delete976)
  
  
  # 1616 is in D9
  ha_data$row[ha_data$plot == 5756 &
                 ha_data$column == "9" &
                 ha_data$tag_number == 1616] <- "D"
  
  
  # tag change: 521 retagged as 1616 in 200
  # shoots and height 1998-2003 from 521 to 1616
  
  
  # data_521<- ha_data %>% 
  #   select(plot,tag_number,year, shts,ht) %>% 
  #   filter(plot==5756) %>% 
  #   filter(tag_number==521) %>% 
  #   filter(year==1998|year==1999|year==2000|year==2001|year==2002|year==2003)
  # 
  # 
  # Correcting NOL code  
  ha_data<-ha_data %>%
    mutate(shts=replace(shts, plot==5756 & year==1998 & tag_number==1616,4)) %>% 
    mutate(shts=replace(shts, plot==5756 & year==1999 & tag_number==1616,2)) %>% 
    mutate(shts=replace(shts, plot==5756 & year==2000 & tag_number==1616,2)) %>% 
    mutate(shts=replace(shts, plot==5756 & year==2001 & tag_number==1616,1)) %>% 
    mutate(shts=replace(shts, plot==5756 & year==2002 & tag_number==1616,2)) %>% 
    mutate(shts=replace(shts, plot==5756 & year==2003 & tag_number==1616,2)) %>% 
    mutate(ht=replace(ht, plot==5756 & year==1998 & tag_number==1616,48)) %>% 
    mutate(ht=replace(ht, plot==5756 & year==1999 & tag_number==1616,52)) %>% 
    mutate(ht=replace(ht, plot==5756 & year==2000 & tag_number==1616,72)) %>% 
    mutate(ht=replace(ht, plot==5756 & year==2001 & tag_number==1616,56)) %>% 
    mutate(ht=replace(ht, plot==5756 & year==2002 & tag_number==1616,54)) %>% 
    mutate(ht=replace(ht, plot==5756 & year==2003 & tag_number==1616,56)) 
  
  
    
  
  # delete 521
  
  delete521 <- ha_data %>%
    filter(plot == 5756 &
             tag_number == 521)
  ha_data <- anti_join(ha_data, delete521)
  rm(delete521)
  # rm(data_521)
  
  
  # Correcting NOL code  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5756 & year==1999 & tag_number==439,NA)) %>% 
    mutate(code=replace(code, plot==5756 & year==2001 & tag_number==842,NA)) %>% 
    mutate(code=replace(code, plot==5756 & year==2008 & tag_number==1231,NA)) %>% 
    mutate(code=replace(code, plot==5756 & year==2005 & tag_number==1285,NA)) %>% 
    mutate(code=replace(code, plot==5756 & year==2004 & tag_number==1285,"ULY")) %>% 
    mutate(shts=replace(shts, plot==5756 & year==2004 & tag_number==1285,3)) %>% 
    mutate(ht=replace(ht, plot==5756 & year==2004 & tag_number==1285,68)) %>% 
    mutate(code=replace(code, plot==5756 & year==2005 & tag_number==1608,NA)) %>% 
    mutate(code=replace(code, plot==5756 & year==2004 & tag_number==1608,"ULY")) %>% 
    mutate(shts=replace(shts, plot==5756 & year==2004 & tag_number==1608,3)) %>% 
    mutate(ht=replace(ht, plot==5756 & year==2004 & tag_number==1608,50)) 
  
  
  # Correct code for 1205 in 2003
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5756 & year==2004 & tag_number==1205,"dead"))
  
    # 1258 ios a seedling in 2003
    
    ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5756 & year==2003 & tag_number==1258,"sdlg"))
  
  return(ha_data)
  }