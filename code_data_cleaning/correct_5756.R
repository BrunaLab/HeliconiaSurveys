
correct_5756 <- function(ha_data) {
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
                 ha_data$tag_number == 793] <- "missing (60)"
  
  # Tag 372
  ha_data$ht[ha_data$plot == "5756" & ha_data$year == 2005 & ha_data$tag_number == 372] <- 26
  # TODO: did this one change tag numbers? 2x
  
  # Tag 1616
  ha_data$ht[ha_data$plot == "5756" & ha_data$year == 2004 & ha_data$tag_number == 1616] <- 77
  ha_data$shts[ha_data$plot == "5756" & ha_data$year == 2004 & ha_data$tag_number == 1616] <- 4
  ha_data$code[ha_data$plot == 5756 &
                 (ha_data$year == 2005 | ha_data$year == 2006) &
                 ha_data$tag_number == 1616] <- "missing (60)"
  # TODO: figure out which of the plants in the plot this is - tags lost in tfall
  # in the first yr this showed up
  
  # Plant 933
  ha_data$HA_ID_Number <- as.character(ha_data$HA_ID_Number)
  ha_data <- ha_data %>%
    mutate(HA_ID_Number = if_else((plot == 5756 & tag_number == 933 & year < 2006), "4733.1", HA_ID_Number)) %>%
    mutate(HA_ID_Number = if_else((plot == 5756 & tag_number == 933 & year > 2005), "4733.2", HA_ID_Number))
  
  
  # %>%
  # mutate(tag_number = if_else((plot==5756 & tag_number==933 & year < 2006),
  # 933.1,tag_number)) %>%
  # mutate(tag_number = if_else((plot==5756 & tag_number==933 & year > 2005),
  # 933.2,tag_number))
  
  # Plant 929
  # 929 in C8 is a renumber after tag was lost, I think it was written down
  # incorrectly and needs to be 2x in field
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2007 &
                 ha_data$row == "C" &
                 ha_data$column == 8 &
                 ha_data$tag_number == 929] <- "ULY (3)"
  
  # Plant 816
  # 816 in D9 is a renumber after tag was lost, I think it was written down
  # incorrectly and needs to be 2x in field
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2009 &
                 ha_data$row == "D" &
                 ha_data$column == 9 &
                 ha_data$tag_number == 816] <- "ULY (3)"
  
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
  
  # tag_no 1602
  ha_data <- ha_data[!(ha_data$plot == "5756" &
                         ha_data$tag_number == 1602 &
                         ha_data$row == "A" &
                         ha_data$column == 9), ]
  
  # Updating Codes 
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 1261] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 1292] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 1294] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 141] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 690] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 707] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 707] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 707] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "5756" &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 50] <- "under treefall (80)"
  
  # incorrectly recorded 10 infl in 2007, should be NA
  ha_data$infl[ha_data$plot == "5756" &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 403] <- NA
  
  # incorrectly recorded as seedling
  # upon 2x of data sheet found it also had infl
  ha_data$code[ha_data$plot == 5756 &
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 1789] <- "ULY (3)"
  
  ha_data$infl[ha_data$plot == 5756 &
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 1789] <- 1
  
  # something happened in 2005 with 332 and 933 in A7.  332 was reported missing,
  # 933 was reported dead. Subsequent years have plant 933 (which should be dead) 
  # with size measurements that are clearly 332. I think someone changed the tag 
  # without noting it, otherwise the subsequent years would have discovered the 
  # issue I am changing 993->933.1 and 332->933.2 until a field 2x can be conducted.
  ha_data$tag_number[ha_data$plot == 5756 &
                       ha_data$row == "A" & 
                       ha_data$column == "7" & 
                       ha_data$tag_number == 332] <- 933.2
  
  ha_data$tag_number[ha_data$plot == 5756 &
                       ha_data$row == "A" & 
                       ha_data$column == "7" & 
                       ha_data$tag_number == 933] <- 933.1
  
  ha_data$tag_number[ha_data$plot == 5756 &
                       ha_data$row == "A" & 
                       ha_data$column == "7" & 
                       (ha_data$year == 2006 |ha_data$year == 2007 |
                          ha_data$year == 2008 |ha_data$year == 2009 ) & 
                       ha_data$tag_number == 933.1] <- 933.2
  
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
  # 
  return(ha_data)
}