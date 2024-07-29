correct_5751 <- function(ha_data) {
  
  # 5751 is FF-3   
  
  library(tidyverse)
  
  suppressMessages({


# 390/154 -----------------------------------------------------------------
  # in 2008 data for 390 incorrectly entered as 154
  # add to 390
  ha_data$shts[ha_data$plot == 5751 &
                 ha_data$tag_number == 390 & 
                 ha_data$year == 2008] <- 3
  
  ha_data$ht[ha_data$plot == 5751 &
               ha_data$tag_number == 390 & 
               ha_data$year == 2008] <- 37
  
  # remove from 154
  ha_data$shts[ha_data$plot == 5751 &
                 ha_data$tag_number == 154 &
                 ha_data$year == 2008] <- NA
  
  ha_data$ht[ha_data$plot == 5751 &
               ha_data$tag_number == 154 &
               ha_data$year == 2008] <- NA


# 337/264 -----------------------------------------------------------------
  # in 2008 data for 337 incorrectly entered as 264
  # add 
  ha_data$shts[ha_data$plot == 5751 &
                 ha_data$tag_number == 337 & 
                 ha_data$year == 2008] <- 7
  
  ha_data$ht[ha_data$plot == 5751 &
               ha_data$tag_number == 337 & 
               ha_data$year == 2008] <- 82
  
  # remove 
  ha_data$shts[ha_data$plot == 5751 &
                 ha_data$tag_number == 264 &
                 ha_data$year == 2008] <- NA
  
  ha_data$ht[ha_data$plot == 5751 &
               ha_data$tag_number == 264 &
               ha_data$year == 2008] <- NA
  

# 401 ---------------------------------------------------------------------
  # 401 is in A8; move 2007 record over to A8 and then delete record in E7
  # Move 2007 measurement to A7, delete E7
  ha_data$shts[ha_data$plot == "5751" & 
                 ha_data$tag_number == 401 &
                 ha_data$year == 2007] <- 1
  
  ha_data$ht[ha_data$plot == "5751" & 
               ha_data$tag_number == 401 &
               ha_data$year == 2007] <- 7
  
  ha_data$code[ha_data$plot == "5751" & 
               ha_data$tag_number == 401 &
               ha_data$year == 2007] <- "sdlg"
  
  #delete the not on list code in 2006
  ha_data$code[ha_data$plot == "5751" & 
                 ha_data$tag_number == 401 &
                 ha_data$year == 2008] <- NA
  
    delete401 <- ha_data %>%
    filter(plot == "5751" &
             tag_number == 401 &
             row == "E" &
             column == 7)
  
  ha_data <- anti_join(ha_data, delete401)
  
  rm(delete401)
  

# 358 ---------------------------------------------------------------------
  # 358: location accidentally entered as E7 in 2007. 
  # Move 2007 measurment to A7, delete E7
  ha_data$shts[ha_data$plot == "5751" & 
                 ha_data$tag_number == 358 &
                 ha_data$year == 2007] <- 1
  
  ha_data$ht[ha_data$plot == "5751" & 
               ha_data$tag_number == 358 &
               ha_data$year == 2007] <- 11
  
  delete358 <- ha_data %>%
    filter(plot == "5751" &
             tag_number == 358 &
             row == "E" &
             column == 7)
  
  ha_data <- anti_join(ha_data, delete358)
  
  rm(delete358)

# 395 ---------------------------------------------------------------------
  # 395 incorrectly entered as 365
  to_delete <- ha_data %>%
    filter(plot == "5751" &
             tag_number == 365 &
             row == "D" &
             column == 5)
  
  ha_data <- anti_join(ha_data, to_delete)
  
  rm(to_delete)
  
  ha_data$ht[ha_data$plot == "5751" & 
               ha_data$year == 2008 & 
               ha_data$tag_number == 395] <- 40
  
  ha_data$shts[ha_data$plot == "5751" & 
                 ha_data$year == 2008 & 
                 ha_data$tag_number == 395] <- 3
  
  ha_data$code[ha_data$plot == "5751" &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 128] <- "missing"
  
  ha_data$code[ha_data$plot == "5751" &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 128] <- "missing"
  
  # location
  ha_data$column[ha_data$plot == "5751" & 
                   ha_data$column == 0] <- 1
  
  # Correcting duplicate "dead"
  ha_data$code[ha_data$plot == "5751" &
                 ha_data$year == 2008 &
                 ha_data$tag_number == 310] <-  NA

  # Correcting NOL code
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5751 & 
                          year==2004 &
                          tag_number==71, "missing"))
  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5751 & 
                          year==2005 & 
                          tag_number==398,NA)) %>% 
    mutate(shts=replace(shts, plot==5751 & 
                          year==2004 & 
                          tag_number==398,3)) %>% 
    mutate(ht=replace(ht, plot==5751 & 
                        year==2004 & 
                        tag_number==398,37))
  

# 71/400 ------------------------------------------------------------------
  # tag switch - 71 became 400 in 2004

  # remove "sdlg" note on 400
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5751 & 
                          year==2004 & 
                          tag_number==400, NA))
  
  delete71 <- ha_data %>%
    filter(plot == "5751" &
             tag_number == 71 &
             (year > 2003 & year < 2010))
  
  ha_data <- anti_join(ha_data, delete71)
  
  rm(delete71)
  
  delete400 <- ha_data %>%
    filter(plot == "5751" &
             tag_number == 400 &
             (year < 2004))
  
  ha_data <- anti_join(ha_data, delete400)
  
  rm(delete400)
  
  ha_data<-ha_data %>%
    mutate(x_09=replace(x_09,(plot==5751 & 
                                tag_number==71), 5.2)) %>% 
    mutate(y_09=replace(y_09,(plot==5751 & 
                                tag_number==71), 2.4)) %>% 
    mutate(tag_number=replace(tag_number,(plot==5751 & tag_number==71), 400))
  
  }) 
  return(ha_data)
}