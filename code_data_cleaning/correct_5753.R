correct_5753 <- function(ha_data) {
  
  
  # The person that entered the data for 2003 
  # for this plot made a major error when merging into excel
  # plants 205 through 319 are offset by 1: e.g.,
  # the value for 242 was entered into 241, 
  # with the addition of new plants this became an occasional offset
  # by 2 numbers.
  # to fix this:
  # 
  # 1. remove 2003 values for all plants tag no 205 to 319 from ha_data_original
  # 2. fix them as needed
  # 2. reinsert them
  # 
  # Also fix 205/329 tag switch
  
  # remove the 2003 values for the offset plants
  fixes_2003<- ha_data %>% 
    filter(year==2003 & 
             plot==5753 & 
             (tag_number > 204 & tag_number < 320)) 
  # delete them from ha_data
  ha_data<-anti_join(ha_data, fixes_2003)
  
  #correct the 2003 data
  new_tag<-fixes_2003$tag_number
  new_row<-fixes_2003$row
  new_col<-fixes_2003$column
  new_x<-fixes_2003$x_09
  new_y<-fixes_2003$y_09
  new_plant_id<-fixes_2003$plant_id
  
  fixes_2003$new_tag<-lead(new_tag,n=1) 
  fixes_2003$new_row<-lead(new_row,n=1) 
  fixes_2003$new_col<-lead(new_col,n=1) 
  fixes_2003$new_x<-lead(new_x,n=1) 
  fixes_2003$new_y<-lead(new_y,n=1) 
  fixes_2003$new_plant_id<-lead(new_plant_id,n=1) 
  rm(new_tag, new_col, new_row, new_x,new_y,new_plant_id)
  
  # most were offset, but because some are seedlings in subsequent years you 
  # can't just assign to the shiften number - a few of them need to be corrected
  # mannually after review. The first two rows add the value to now correct 
  # tag number, the next delete the value from the original one
  # here is the file for review: 
  # write_csv(fixes_2003,"./fixes_2003.csv")
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==210, 2)) %>% 
    mutate(ht=replace(ht, new_tag==210, 27)) %>% 
    mutate(shts=replace(shts, new_tag==209, NA)) %>% 
    mutate(ht=replace(ht, new_tag==209, NA)) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==212, 5)) %>% 
    mutate(ht=replace(ht, new_tag==212, 38)) %>% 
    mutate(shts=replace(shts, new_tag==211, NA)) %>% 
    mutate(ht=replace(ht, new_tag==211, NA)) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(ht=replace(ht, new_tag==217, NA))
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==212, 5)) %>% 
    mutate(ht=replace(ht, new_tag==212, 38)) %>% 
    mutate(shts=replace(shts, new_tag==211, NA)) %>% 
    mutate(ht=replace(ht, new_tag==211, NA)) 
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==223, NA)) %>% 
    mutate(ht=replace(ht, new_tag==223, NA)) %>% 
    mutate(shts=replace(shts, new_tag==224, 3)) %>% 
    mutate(ht=replace(ht, new_tag==224, 60)) 
  
  names(ha_data)
  fixes_2003<-fixes_2003 %>%
    mutate(code=replace(code, new_tag==229, "dead"))
  ha_data <- ha_data %>% 
  mutate(code=replace(code, plot==5753 & tag_number==229 & year>2003, NA)) %>% 
    mutate(code=replace(code, plot==5753 & tag_number==248 &
                          (year==2003 | year==2009), "missing")) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==233, NA)) %>% 
    mutate(ht=replace(ht, new_tag==233, NA)) %>% 
    mutate(shts=replace(shts, new_tag==234, 4)) %>% 
    mutate(ht=replace(ht, new_tag==234, 27)) 
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==235, NA)) %>% 
    mutate(ht=replace(ht, new_tag==235, NA)) %>% 
    mutate(shts=replace(shts, new_tag==236, 1)) %>% 
    mutate(ht=replace(ht, new_tag==236, 9)) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==223, NA)) %>% 
    mutate(ht=replace(ht, new_tag==223, NA)) %>% 
    mutate(shts=replace(shts, new_tag==224, 3)) %>% 
    mutate(ht=replace(ht, new_tag==224, 60)) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==239, NA)) %>% 
    mutate(ht=replace(ht, new_tag==239, NA)) %>% 
    mutate(shts=replace(shts, new_tag==240, 1)) %>% 
    mutate(ht=replace(ht, new_tag==240, 25)) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==242, NA)) %>% 
    mutate(ht=replace(ht, new_tag==242, NA)) %>% 
    mutate(shts=replace(shts, new_tag==243, 2)) %>% 
    mutate(ht=replace(ht, new_tag==243, 28)) %>% 
    mutate(code=replace(code, new_tag==243, "under litter")) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(code=replace(code, new_tag==248, NA)) %>% 
    mutate(code=replace(code, new_tag==249, NA))  
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==251, NA)) %>% 
    mutate(ht=replace(ht, new_tag==251, NA)) %>% 
    mutate(shts=replace(shts, new_tag==253, 2)) %>% 
    mutate(ht=replace(ht, new_tag==253, 30)) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==271, NA)) %>% 
    mutate(ht=replace(ht, new_tag==271, NA)) %>% 
    mutate(shts=replace(shts, new_tag==272, 1)) %>% 
    mutate(ht=replace(ht, new_tag==272, 32)) 
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==279, NA)) %>% 
    mutate(ht=replace(ht, new_tag==279, NA)) %>% 
    mutate(shts=replace(shts, new_tag==281, 2)) %>% 
    mutate(ht=replace(ht, new_tag==281, 24)) 
  
  fixes_2003<-fixes_2003 %>%
    mutate(code=replace(code, new_tag==282, NA)) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==286, NA)) %>% 
    mutate(ht=replace(ht, new_tag==286, NA)) %>% 
    mutate(shts=replace(shts, new_tag==288, 1)) %>% 
    mutate(ht=replace(ht, new_tag==288, 14)) 
  
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==294, 3)) %>% 
    mutate(ht=replace(ht, new_tag==294, 80)) %>% 
    mutate(infl=replace(infl, new_tag==294, 1))
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==286, NA)) %>% 
    mutate(ht=replace(ht, new_tag==286, NA)) %>% 
    mutate(shts=replace(shts, new_tag==288, 1)) %>% 
    mutate(ht=replace(ht, new_tag==288, 14)) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(code=replace(code, new_tag==296, NA)) %>% 
    mutate(code=replace(code, new_tag==297, "missing")) 
  
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==309, NA)) %>% 
    mutate(ht=replace(ht, new_tag==309, NA)) %>% 
    mutate(shts=replace(shts, new_tag==310, 1)) %>% 
    mutate(ht=replace(ht, new_tag==310, 10)) 
  
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==312, 1)) %>% 
    mutate(ht=replace(ht, new_tag==312, 21)) %>% 
    mutate(code=replace(code, new_tag==312, NA)) 
  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==316, NA)) %>% 
    mutate(ht=replace(ht, new_tag==316, NA)) %>% 
    mutate(code=replace(code, new_tag==316, "missing")) %>% 
    mutate(shts=replace(shts, new_tag==315, 5)) %>% 
    mutate(ht=replace(ht, new_tag==315, 69)) 
  

  
  fixes_2003<-fixes_2003 %>%
    mutate(shts=replace(shts, new_tag==319 & new_row=="D", NA)) %>% 
    mutate(ht=replace(ht, new_tag==319 & new_row=="D", NA)) %>% 
    mutate(shts=replace(shts, new_tag==319 & new_row=="E", 1)) %>% 
    mutate(ht=replace(ht, new_tag==319 & new_row=="E", 10)) 
  
  #delete duplicate 319 in D7
  delete319<-fixes_2003 %>%
    filter((new_tag==319 & new_row=="D") | (tag_number==319 & row=="E"))
  fixes_2003<-anti_join(fixes_2003, delete319)
  delete319<-ha_data %>%
    filter(plot==5753 & tag_number==319 & row=="D")
  ha_data<-anti_join(ha_data,delete319)
  rm(delete319)
  
  #add the data for 319 in E10 that was missing
  ha_data <- ha_data %>% 
    mutate(shts=replace(shts, plot==5753 & tag_number==319 & year==1999, NA)) %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==319 & year==1999, NA)) %>% 
    mutate(shts=replace(shts, plot==5753 & tag_number==319 & year==2000, 1)) %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==319 & year==2000, 11)) %>% 
    mutate(code=replace(code, plot==5753 & tag_number==319 & year==2000, "sdlg")) %>%  
    mutate(shts=replace(shts, plot==5753 & tag_number==319 & year==2001, 1)) %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==319 & year==2001, 14)) %>% 
    mutate(shts=replace(shts, plot==5753 & tag_number==319 & year==2002, 2)) %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==319 & year==2002, 12)) %>% 
    mutate(shts=replace(shts, plot==5753 & tag_number==319 & year==2004, 1)) %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==319 & year==2004, 8)) %>%
    mutate(shts=replace(shts, plot==5753 & tag_number==319 & year==2005, 1)) %>%
    mutate(ht=replace(ht, plot==5753 & tag_number==319 & year==2005, 7)) %>% 
    mutate(code=replace(code, plot==5753 & tag_number==319 & year==2006, NA))
      
  
  # Make sure to record, seedling, dead, missing, etc. correctly
  
  fixes_2003<-fixes_2003 %>%
    mutate(code=replace(code, new_tag==279, "dead")) %>% 
    mutate(code=replace(code, new_tag==273, "dead")) %>% 
    mutate(code=replace(code, new_tag==250, "missing")) %>% 
    mutate(code=replace(code, new_tag==251, "missing")) %>% 
    mutate(infl=replace(infl, new_tag==273, 1)) %>% 
    mutate(code=replace(code, new_tag==273, "ULY")) %>% 
    mutate(infl=replace(infl, new_tag==274, 1)) %>% 
    mutate(new_row=replace(new_row, new_tag==293, "D")) 
  
  # 293 was in wrong location in databse, so correcting both 2003 and other years here
  fixes_2003<-fixes_2003 %>%
    mutate(new_row=replace(new_row, new_tag==293, "D")) 
  ha_data <- ha_data %>% 
    mutate(row=replace(row, plot==5753 & tag_number==293, "D")) %>% 
    mutate(y_09=replace(y_09, plot==5753 & tag_number==293, NA)) %>% 
    mutate(x_09=replace(x_09, plot==5753 & tag_number==293, NA)) %>% 
    mutate(shts=replace(shts, plot==5753 & tag_number==293 & year==1999, 2)) %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==293 & year==1999, 10)) %>% 
    mutate(shts=replace(shts, plot==5753 & tag_number==293 & year==2000, 1)) %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==293 & year==2000, 8)) %>% 
    mutate(shts=replace(shts, plot==5753 & tag_number==293 & year==2001, 1)) %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==293 & year==2001, 7)) %>% 
    mutate(shts=replace(shts, plot==5753 & tag_number==293 & year==2002, 1)) %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==293 & year==2002, 10)) %>% 
    mutate(shts=replace(shts, plot==5753 & tag_number==293 & year==2004, NA)) %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==293 & year==2004, NA)) %>% 
    mutate(code=replace(code, plot==5753 & tag_number==293 & year==2004, "dead")) 
    
  
  # add the corrected 2003 data back
  
  
  # first delete the old tag, row, column, then rename, then bind
  fixes_2003<-fixes_2003 %>%
    ungroup() %>% 
    select(-tag_number,-row,-column,-x_09,-y_09,-plant_id) %>% 
    rename("tag_number"="new_tag",
           "row"="new_row",
           "column"="new_col",
           "x_09"="new_x",
           "y_09"="new_y",
           "plant_id"="new_plant_id") 
  
   
    ha_data <-bind_rows(ha_data,fixes_2003) %>% 
      arrange(plot,plant_id,year)
    
    rm(fixes_2003)
    
  # 90 in 2002 should be 19
  ha_data <- ha_data %>% 
    mutate(ht=replace(ht, plot==5753 & tag_number==90 & year==2002, 19)) 
  
  
  # looks like 269 was retagged as 311 in 2003
  # 2003 data for 311
  ha_data<-ha_data %>%
    mutate(shts=replace(shts, plot==5753 & year==2003 & tag_number==311,3)) %>% 
    mutate(ht=replace(ht, plot==5753 & year==2003 & tag_number==311,27)) %>% 
    mutate(code=replace(code, plot==5753 & year==2003 & tag_number==311,NA)) %>% 
    mutate(infl=replace(infl, plot==5753 & year==2003 & tag_number==311,NA)) %>% 
    mutate(shts=replace(shts, plot==5753 & year==2000 & tag_number==311,1)) %>% 
    mutate(ht=replace(ht, plot==5753 & year==2000 & tag_number==311,14)) %>% 
    mutate(shts=replace(shts, plot==5753 & year==2001 & tag_number==311,2)) %>% 
    mutate(ht=replace(ht, plot==5753 & year==2001 & tag_number==311,16)) %>% 
    mutate(shts=replace(shts, plot==5753 & year==2002 & tag_number==311,2)) %>% 
    mutate(ht=replace(ht, plot==5753 & year==2002 & tag_number==311,18)) %>% 
    mutate(code=replace(code, plot==5753 & year==2000 & tag_number==311,"sdlg"))
  
  # delete the original 269
  
  
  delete269 <- ha_data %>% filter(plot == 5753 & tag_number == 269)
  ha_data <- anti_join(ha_data, delete269)
  rm(delete269)
  
  
  
  
  
  # in 2008 data for 176 incorrectly entered as 199
  # add 
  ha_data$shts[ha_data$plot == 5753 &
                 ha_data$tag_number == 176 & 
                 ha_data$year == 2008] <- 1
  
  ha_data$ht[ha_data$plot == 5753 &
               ha_data$tag_number == 176 & 
               ha_data$year == 2008] <- 17
  
  # remove 
  ha_data$shts[ha_data$plot == 5753 &
                 ha_data$tag_number == 199 &
                 ha_data$year == 2008] <- NA
  
  ha_data$ht[ha_data$plot == 5753 &
               ha_data$tag_number == 199 &
               ha_data$year == 2008] <- NA
  
  
  
  # in 2008 data for 176 incorrectly entered as 199
  # add 
  ha_data$shts[ha_data$plot == 5753 &
                 ha_data$tag_number == 176 & 
                 ha_data$year == 2008] <- 1
  
  ha_data$ht[ha_data$plot == 5753 &
               ha_data$tag_number == 176 & 
               ha_data$year == 2008] <- 17
  
  # remove 
  ha_data$shts[ha_data$plot == 5753 &
                 ha_data$tag_number == 199 &
                 ha_data$year == 2008] <- NA
  
  ha_data$ht[ha_data$plot == 5753 &
               ha_data$tag_number == 199 &
               ha_data$year == 2008] <- NA
  
  
  
  # in 2008 data for 176 incorrectly entered as 199
  # add 
  ha_data$shts[ha_data$plot == 5753 &
                 ha_data$tag_number == 218 & 
                 ha_data$year == 2008] <- 1
  
  ha_data$ht[ha_data$plot == 5753 &
               ha_data$tag_number == 218 & 
               ha_data$year == 2008] <- 16
  
  # remove 
  ha_data$shts[ha_data$plot == 5753 &
                 ha_data$tag_number == 298 &
                 ha_data$year == 2008] <- NA
  
  ha_data$ht[ha_data$plot == 5753 &
               ha_data$tag_number == 298 &
               ha_data$year == 2008] <- NA
  
  
  
  #363 recorded to wrong location one year, created duplicate. it is in E10
  # add the measurments for 2009 to all, then delete dupe
  ha_data$shts[ha_data$plot == "5753" & 
                 ha_data$tag_number == 363 &
                 ha_data$year == 2009] <- 1
  
  ha_data$ht[ha_data$plot == "5753" & 
                 ha_data$tag_number == 363 &
                 ha_data$year == 2009] <- 34
  
  ha_data$x_09[ha_data$plot == "5753" & 
                 ha_data$tag_number == 363 &
                 ha_data$row == "E" &
                 ha_data$column == 10] <- 4.7
  
  ha_data$y_09[ha_data$plot == "5753" & 
                 ha_data$tag_number == 363 &
                 ha_data$row == "E" &
                 ha_data$column == 10] <- 8.7
  
  
  delete363 <- ha_data %>%
    filter(plot == "5753" &
             tag_number == 363 &
             row == "B" &
             column == 1)
  ha_data <- anti_join(ha_data, delete363)
  rm(delete363)
  
  
  # 320: E10 is correct add the 05 record, then delete the one in A5
  ha_data$shts[ha_data$plot == "5753" & 
                 ha_data$tag_number == 320 &
                 ha_data$year == 2005] <- 1
  
  ha_data$ht[ha_data$plot == "5753" & 
               ha_data$tag_number == 320 &
               ha_data$year == 2005] <- 12
  
  ha_data$code[ha_data$plot == "5753" & 
               ha_data$tag_number == 320 &
               ha_data$year == 2005] <- NA
  
  delete320 <- ha_data %>%
    filter(plot == "5753" &
             tag_number == 320 &
             row == "A" & 
             column == 5)
  ha_data <- anti_join(ha_data, delete320)
  rm(delete320)
  
  
  # Tag no. 108
  ha_data$code[ha_data$plot == 5753 & ha_data$tag_number == 108 & ha_data$year == 2005] <- NA
  
  # tag_no 841
  ha_data <- ha_data[!(ha_data$plot == 5753 & ha_data$tag_number == 319 & ha_data$row == "D"), ]
  
  # Status plant 412 in 2005
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 412] <- "missing"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 268] <- "missing"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 276] <- "missing"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 292] <- "missing"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 34] <- "missing"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 52] <- "missing"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 34] <- "missing"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2008 &
                 ha_data$tag_number == 345] <- "missing"
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2009 &
                 ha_data$tag_number == 345] <- NA
  
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2008 &
                 ha_data$tag_number == 412] <- "missing"
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5753 &
                 ha_data$year == 2006 & 
                 ha_data$tag_number == 404] <- "under branchfall"
  
  
  
  
  
  
  
  # # Incorrect Not On List codes
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==28, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==32, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==39, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==76, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==97, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==194, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==222, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==227, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==245, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==260, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==267, NA))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==325, NA))
  
  
  
  # Correcting NOL code
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==28, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==32, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==39, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==76, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==97, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==194, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==222, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==227, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==245, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==260, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==267, NA)) %>% 
    mutate(code=replace(code, plot==5753 & year==2008 & tag_number==325, NA))

  
  # Correcting NOL code  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==1999 & tag_number==95,NA)) %>% 
    mutate(shts=replace(shts, plot==5753 & year==1998 & tag_number==95,1)) %>% 
    mutate(ht=replace(ht, plot==5753 & year==1998 & tag_number==95,17))
  
  
  # Correcting 232 dead  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2001 & tag_number==232,"dead"))
  
  
  
  # Correcting 250 dead  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==1999 & tag_number==322,"ULY")) %>% 
    mutate(code=replace(code, plot==5753 & year==2001 & tag_number==322,"missing")) %>% 
    mutate(code=replace(code, plot==5753 & year==2002 & tag_number==322,"missing")) %>% 
    mutate(code=replace(code, plot==5753 & year==2003 & tag_number==322,NA)) %>% 
    mutate(infl=replace(infl, plot==5753 & year==2003 & tag_number==322,1)) %>% 
    mutate(shts=replace(shts, plot==5753 & year==1999 & tag_number==322,3)) %>% 
    mutate(ht=replace(ht, plot==5753 & year==1999 & tag_number==322,42)) %>% 
    mutate(shts=replace(shts, plot==5753 & year==2000 & tag_number==322,3)) %>% 
    mutate(ht=replace(ht, plot==5753 & year==2000 & tag_number==322,40)) 
  
  
  
  delete250 <- ha_data %>%
    filter(plot == "5753" &
             tag_number == 250)
  ha_data <- anti_join(ha_data, delete250)
  rm(delete250)
  
  
  
  #  321 retagged as 315 in 2003
  # add values from 315 to 321, then delete 321 
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5753 & year==2002 & tag_number==315,"ULY")) %>% 
    mutate(shts=replace(shts, plot==5753 & year==2002 & tag_number==315,4)) %>% 
    mutate(ht=replace(ht, plot==5753 & year==2002 & tag_number==315,69)) 
  
  
  
  delete321 <- ha_data %>%
    filter(plot == "5753" &
             tag_number == 321)
  ha_data <- anti_join(ha_data, delete321)
  rm(delete321)
  
  
  
  
  return(ha_data)
  
}