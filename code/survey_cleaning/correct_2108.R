correct_2108 <- function(ha_data) {
  
  # 2108 is FF-2   
  
  library(tidyverse)
  
  suppressMessages({
  

# 22/227/249/240 ----------------------------------------------------------

  # 33 was missing in a treefall in 2003 
  # in 2004 a plant was found under treefall and recorded as 227
  # in 2005 the 227 tag was replaced and recorded as 240 BUT it was actually 249
  # That's because 240 was a seedling marked in e8 in 2004
  # in all subsequent years 240 in this plot is missing and 249 is correct in this plot,
  # 240 should be in e8
  
  move33<-ha_data %>% filter(plot == 2108 & 
                               tag_number == 33) %>%
    filter(is.na(shts)==FALSE) %>% 
    mutate(tag_number=249) %>% 
    select(plot,tag_number, year,shts,ht)
  
  
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 1998 & 
                 ha_data$tag_number == 249] <- 2
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 1999 & 
                 ha_data$tag_number == 249] <- 2
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 2000 & 
                 ha_data$tag_number == 249] <- 3
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 2001 & 
                 ha_data$tag_number == 249] <- 4
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 2002 & 
                 ha_data$tag_number == 249] <- 5
  
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 1998 & 
               ha_data$tag_number == 249] <- 50
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 1999 & 
               ha_data$tag_number == 249] <- 52
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2000 & 
               ha_data$tag_number == 249] <- 57
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2001 & 
               ha_data$tag_number == 249] <- 83
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2002 & 
               ha_data$tag_number == 249] <- 120
  
  
  omit33<-ha_data %>% filter(plot==2108 & tag_number==33)
  
  ha_data<-anti_join(ha_data,omit33)
  
  rm(move33,omit33)
  
  ha_data$code[ha_data$plot == 2108 & 
                 ha_data$year == 2006 & 
                 ha_data$tag_number == 249] <- NA
  ha_data$code[ha_data$plot == 2108 & 
                 ha_data$year == 2004 & 
                 ha_data$tag_number == 249] <- NA
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 2004 & 
                 ha_data$tag_number == 249] <- 5
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2004 & 
               ha_data$tag_number == 249] <- 128
  ha_data$code[ha_data$plot == 2108 & 
                 ha_data$year == 2004 & 
                 ha_data$tag_number == 249] <- "under treefall"
  
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 2005 & 
                 ha_data$tag_number == 249] <- 7
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2005 & 
               ha_data$tag_number == 249] <- 140
  ha_data$code[ha_data$plot == 2108 & 
                 ha_data$year == 2005 & 
                 ha_data$tag_number == 249] <- NA
  
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 249] <- 1
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2008 & 
               ha_data$tag_number == 249] <- 35
  ha_data$code[ha_data$plot == 2108 & 
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 249] <- NA
  
  # Adding the year that was missing for 240
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2005 & 
               ha_data$tag_number == 240] <- 22
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 2005 & 
                 ha_data$tag_number == 240] <- 2
  ha_data$code[ha_data$plot == 2108 & 
                 ha_data$year == 2005 & 
                 ha_data$tag_number == 240] <- NA
  
  # now delete 227 record (33 became 227, which became 249)
  omit227<-ha_data %>% filter(plot==2108 & tag_number==227)
  ha_data<-anti_join(ha_data,omit227)
  rm(omit227)

# 17 ----------------------------------------------------------------------

  # 17 plot corrected but failed to correct on datasheet
  ha_data$code[ha_data$plot == 2108 & ha_data$year == 2006 &
                 ha_data$tag_number == 17] <- NA
  
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2006 & 
               ha_data$tag_number == 17] <- 0
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 2006 & 
                 ha_data$tag_number == 17] <- 0
  
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2007 & 
               ha_data$tag_number == 17] <- 16
  ha_data$shts[ha_data$plot == 2108 & 
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 17] <- 1
  
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2008 &
               ha_data$tag_number == 17] <- 11
  ha_data$shts[ha_data$plot == 2108 &
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 17] <- 1
  
  ha_data$ht[ha_data$plot == 2108 & 
               ha_data$year == 2009 & 
               ha_data$tag_number == 17] <- 13
  ha_data$shts[ha_data$plot == 2108 &
                 ha_data$year == 2009 & 
                 ha_data$tag_number == 17] <- 1
  
  ha_data$x_09[ha_data$plot == 2108 & 
                 ha_data$column == 7 & 
                 ha_data$tag_number == 17] <- 0.1
  ha_data$y_09[ha_data$plot == 2108 & 
                 ha_data$column == 7 &
                 ha_data$tag_number == 17] <- 2.60
  
  # delete the duplicate
  to_delete <- ha_data %>%
    filter(plot == 2108 &
             tag_number == 17 &
             row == "A" &
             column == 4)
  ha_data <- anti_join(ha_data, to_delete)
  rm(to_delete)
  # correct the plot
  ha_data$column[ha_data$plot == 2108 & 
                   ha_data$column == 7 & 
                   ha_data$tag_number == 17] <- 6
  

# 66/69 -------------------------------------------------------------------
  # tag_no 66 and 69 are different plants but 69 was incorerctly enterred as 66
  ha_data<-ha_data %>%
    mutate(tag_number=replace(tag_number, plot==2108 & 
                                row=="C" & 
                                tag_number==66, 69))
  
  # correct the value for D10 (66)
  ha_data$ht[ha_data$plot == "2108" & 
               ha_data$year == 1999 & 
               ha_data$tag_number == 66] <- 13
  ha_data$shts[ha_data$plot == "2108" & 
                 ha_data$year == 1999 & 
                 ha_data$tag_number == 66] <- 1
  ha_data$code[ha_data$plot == "2108" & 
                 ha_data$year == 1999 & 
                 ha_data$tag_number == 66] <- NA
  
  # correct the values for 69 (in c9)
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot==2108 & 
                        year==2000 & 
                        tag_number==69, 31)) %>% 
    mutate(ht=replace(ht, plot==2108 & 
                        year==1999 & 
                        tag_number==69, NA)) %>% 
    mutate(shts=replace(shts, plot==2108 & 
                          year==1999 & 
                          tag_number==69, NA)) %>% 
    mutate(code=replace(code, plot==2108 & 
                          year==1999 & 
                          tag_number==69, "missing")) %>% 
    mutate(ht=replace(ht, plot==2108 & 
                        year==2004 &
                        tag_number==69, NA)) %>% 
    mutate(shts=replace(shts, plot==2108 & 
                          year==2004 & 
                          tag_number==69, NA)) %>% 
    mutate(code=replace(code, plot==2108 & 
                          year==2004 & 
                          tag_number==69, "missing")) %>% 
    mutate(code=replace(code, plot==2108 & 
                          year==2006 &
                          tag_number==69, NA)) %>% 
    mutate(code=replace(code, plot==2108 & 
                          year==2007 & 
                          tag_number==69, NA)) 
  
  # location
  ha_data$row[ha_data$plot == "2108" & ha_data$tag_number == 212] <- "E"
  

# updating Codes ----------------------------------------------------------

  # 293 -------------------------------------------------------------------
  # Plant 293: code say 'ULY (3)' in 2008, it's not. replace this with NA
  ha_data$code[ha_data$plot == "2108" & 
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 293] <- NA
  # Plant 293: code say 'dead (2)' in 2009, it's not. replace this with NA
  ha_data$code[ha_data$plot == "2108" & 
                 ha_data$year == 2009 & 
                 ha_data$tag_number == 293] <- NA
  
  # 332 -------------------------------------------------------------------
  # Incorrect Not On List codes
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==2108 & year==2008 & tag_number==332, NA))
  # 333 -------------------------------------------------------------------
  ha_data<-ha_data %>%
    # filter(ht=replace(ht, plot==2107 & year==2008 & tag_number==333, 15))
  filter(!(plot%in% 2108 & tag_number%in% 333))


# 365/369 -----------------------------------------------------------------
  # number for 365 was incorrectly read in as 369 when initially marked in 2008
  # correct the tag and measurement 
  ha_data<-ha_data %>%
    mutate(tag_number=if_else(plot==2108 & 
                                year==2008 & 
                                tag_number==369, 365, tag_number)) %>% 
    mutate(shts=if_else(plot==2108 & 
                          year==2008 & 
                          tag_number==365, 1, shts)) %>%
    mutate(ht=if_else(plot==2108 & 
                        year==2008 & 
                        tag_number==365, 11, ht)) %>%
    mutate(code=if_else(plot==2108 & 
                          year==2008 & 
                          tag_number==365, "sdlg", code))  
    
  # delete the duplicate year
  ha_data<-ha_data %>% 
    filter(!(plot==2108 & year==2008 & tag_number==365 & x_09==1.37))    
  # delete the 369
  ha_data<-ha_data %>% 
    filter(!(plot==2108 & tag_number==369))
  
  # # correcxt the xy coordinates
  ha_data<-ha_data %>%
  mutate(x_09=replace(x_09, plot==2108 & 
                        tag_number==365, 1.37)) %>% 
   mutate(y_09=replace(y_09, plot==2108 & 
                         tag_number==365, 5.55)) 

# 332 ---------------------------------------------------------------------
  # 332 is a seedling in 2007
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==2108 & 
                          year==2007 & 
                          tag_number==332,"sdlg")) %>% 
    mutate(ht=replace(ht, plot==2108 & 
                        year==2007 & 
                        tag_number==332,10)) %>% 
    mutate(shts=replace(shts, plot==2108 & 
                          year==2007 & 
                          tag_number==332,1))  
  
  

  })  
  return(ha_data)
  
}

