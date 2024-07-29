correct_5750 <- function(ha_data) {
  
  
  library(tidyverse)
  
  
  # 5750 is CF-2   
  
  
  suppressMessages({

# row "L" -----------------------------------------------------------------
  # Some of the plants in 5750 were put as Row "L" because he thought they might be
  # just outside the plot. I converted to J.
  ha_data$row[ha_data$plot == "5750" & ha_data$row == "L"] <- "J"
  
  # If you want to convert these to 0 to say they are inside the plot,
  # then uncomment these two lines
  # ha_data$x_09[ha_data$x_09 <] <- 0
  # ha_data$y_09[ha_data$x_09 <] <- 0
  

# 339/339 -----------------------------------------------------------------
  # in 2008 data for 339 incorrectly entered as 338
  # add to339
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$tag_number ==339 & 
                 ha_data$year == 2008] <- 2
  
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$tag_number ==339 & 
               ha_data$year == 2008] <-1
  
  # remove from 338
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$tag_number ==338 &
                 ha_data$year == 2008] <- NA
  
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$tag_number ==338 &
               ha_data$year == 2008] <- NA
  
  # 339 in 2007 marked as dead but wasn't
  ha_data$code[ha_data$plot == 5750 &
               ha_data$tag_number ==339 & 
               ha_data$year == 2007] <- NA
  
  

# 83/988/866 -----------------------------------------------------------------
  # The mess of 988,886...resolved!  886 is in D10
  # 988 is in C8 (it must have been read upside down as 886)
  
  # 83 in c8 was retagged as 988 in 2004 BUT the tag number was accidentally
  # entered as 886 (read upside down). there IS an 886 in D10

  # delete the 988 in D10
  delete988 <- ha_data %>%
    filter(plot == 5750 &
             tag_number == 988 &
             row == "D" &
             column ==10)
  
    ha_data <- anti_join(ha_data, delete988)
    
    rm(delete988)
  
  # Correct the data for 988
  ha_data<-ha_data %>%
    mutate(shts=replace(shts, plot==5750 & year==1998 & tag_number==988, 3)) %>% 
    mutate(ht=replace(ht, plot==5750 & year==1998 & tag_number==988, 64)) %>% 
    mutate(shts=replace(shts, plot==5750 & year==1999 & tag_number==988, 4)) %>% 
    mutate(ht=replace(ht, plot==5750 & year==1999 & tag_number==988, 65)) %>% 
    mutate(shts=replace(shts, plot==5750 & year==2000 & tag_number==988, 4)) %>% 
    mutate(ht=replace(ht, plot==5750 & year==2000 & tag_number==988, 72)) %>% 
    mutate(shts=replace(shts, plot==5750 & year==2001 & tag_number==988, 4)) %>% 
    mutate(ht=replace(ht, plot==5750 & year==2001 & tag_number==988, 87)) %>% 
    mutate(shts=replace(shts, plot==5750 & year==2002 & tag_number==988, 4)) %>% 
    mutate(ht=replace(ht, plot==5750 & year==2002 & tag_number==988, 83)) %>% 
    mutate(shts=replace(shts, plot==5750 & year==2003 & tag_number==988, 3)) %>% 
    mutate(ht=replace(ht, plot==5750 & year==2003 & tag_number==988, 72)) %>% 
    mutate(shts=replace(shts, plot==5750 & year==2004 & tag_number==988, 3)) %>% 
    mutate(ht=replace(ht, plot==5750 & year==2004 & tag_number==988, 68)) %>% 
    mutate(shts=replace(shts, plot==5750 & year==2005 & tag_number==988, 4)) %>% 
    mutate(ht=replace(ht, plot==5750 & year==2005 & tag_number==988, 63)) %>% 
    mutate(shts=replace(shts, plot==5750 & year==2006 & tag_number==988, 3)) %>% 
    mutate(ht=replace(ht, plot==5750 & year==2006 & tag_number==988, 50)) %>% 
    mutate(infl=replace(infl, plot==5750 & year==2001 & tag_number==988, NA)) %>% 
    mutate(code=replace(code, plot==5750 & year==2008 & tag_number==988, NA)) 
    
  # Now fix 886
  ha_data<-ha_data %>%
    mutate(x_09=replace(x_09, plot==5750 & tag_number==886, 2.6)) %>% 
    mutate(y_09=replace(y_09, plot==5750 & tag_number==886, 8.3)) 
  
  # delete pre-2005 measurements
  ha_data<-ha_data %>% mutate(ht = ifelse((plot == 5750 & tag_number ==886 &
                                    (year!=2006 &
                                    year!=2007 &
                                    year!=2008 &
                                    year!=2009)),NA, ht)) %>%
    mutate(shts = ifelse((plot == 5750 & tag_number ==886 &
                          (year!=2006 &
                             year!=2007 &
                             year!=2008 &
                             year!=2009)), NA, shts)) %>%
    mutate(infl = ifelse((plot == 5750 & tag_number ==886 &
                          (year!=2006 &
                             year!=2007 &
                             year!=2008 &
                             year!=2009)), NA, infl))

  # add the 2004 measurements
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 886] <- "sdlg"
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 886] <-1
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2004 &
               ha_data$tag_number == 886] <-10
  
  # add the 2005 measurements
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 886] <- 2
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2005 &
               ha_data$tag_number == 886] <-14
  
  ha_data$code[ha_data$plot == 5750 &
               ha_data$year == 2007 &
               ha_data$tag_number == 886] <-"dried"
  
  # 2002 (J8) was incorrectly typed in as 2022 in 2007. Need to add the 2007 
  # measurements to 2002, then delete the incorrect 2022 in J8
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 2002] <- "sdlg"
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 2002] <-
  ha_data$ht[ha_data$plot == 5750 &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 2002] <- 8
  
  # delete the duplicate
  delete2022 <- ha_data %>%
    filter(plot == 5750 &
             tag_number == 2022 &
             row == "J" &
             column == 8)
  
    ha_data <- anti_join(ha_data, delete2022)
    
    rm(delete2022)

# 1409 --------------------------------------------------------------------
  # 1409 Not entered in seedling year (2006)
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot==5750 &
                        tag_number==1409 & 
                        year==2006, 8)) %>%
    mutate(shts=replace(shts, plot==5750 & 
                          tag_number==1409 & 
                          year==2006, 1)) %>% 
    mutate(code=replace(code, plot==5750 & 
                          tag_number==1409 & 
                          year==2006, "sdlg")) %>% 
    mutate(code=replace(code, plot==5750 & 
                          tag_number==1409 &
                          year==2007, NA))

# 2107 --------------------------------------------------------------------
  # plant 2107 shts entered incorrectly in 2007 
  ha_data<-ha_data %>%
    mutate(shts=replace(shts, plot==5750 & tag_number==2002 & year==2007, 1)) 

# 236 ---------------------------------------------------------------------
  # Plant 236 - add code for year its missing, delete the plot
  # it duplicate numbers, delete incorrect plot
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 236] <- "missing"
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2008 &
                 ha_data$tag_number == 236] <- "missing"
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2009 &
                 ha_data$tag_number == 236] <- "missing"
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 236] <-
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2007 &
               ha_data$tag_number == 236] <-0
  # delete the duplicate
  to_delete <- ha_data %>%
    filter(plot == 5750 &
             tag_number == 236 &
             row == "G" &
             column == 9)
  
    ha_data <- anti_join(ha_data, to_delete)
    
    rm(to_delete)


# Updating Codes ----------------------------------------------------------

# 864 ---------------------------------------------------------------------
  ha_data$code[ha_data$plot == "5750" & 
                 ha_data$year == 2005 & 
                 ha_data$tag_number == 864] <- "missing"
# 001 ---------------------------------------------------------------------
  ha_data$code[ha_data$plot == 5750 &
                 (ha_data$year == 2005 | 
                    ha_data$year == 2006 | 
                    ha_data$year == 2007) & 
                 ha_data$tag_number ==01] <- NA
    
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2004 & 
               ha_data$tag_number ==01] <- NA
  
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2004 & 
                 ha_data$tag_number ==01] <- NA
  
  ha_data$infl[ha_data$plot == 5750 &
                 ha_data$year == 2004 & 
                 ha_data$tag_number ==01] <- NA

# 2341 --------------------------------------------------------------------
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2009 & 
                 ha_data$tag_number == 2341] <- "ULY"

# 2061 --------------------------------------------------------------------
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 2061] <- "ULY"

# correcting Location -----------------------------------------------------

# 79 ----------------------------------------------------------------------
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 79] <- 6
# 06 ----------------------------------------------------------------------
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number ==06] <-0
# 272 ---------------------------------------------------------------------
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 272] <- "G"
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 272] <- 6
# 274 ---------------------------------------------------------------------
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 274] <- "G"
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 274] <- 6
# 422 ---------------------------------------------------------------------
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 422] <- "J"
# 426 ---------------------------------------------------------------------
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 426] <- "J"
# 722 ---------------------------------------------------------------------
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 722] <- 6
# 927 ---------------------------------------------------------------------
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 927] <-0
# 939 ---------------------------------------------------------------------
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 939] <-0
# 986 ---------------------------------------------------------------------
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 986] <- "J"
# 2360 --------------------------------------------------------------------
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 2360] <- 6
# 747 ---------------------------------------------------------------------
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 747] <- "J"



# remove decimal from the ht measurement -----------------------------------
# 469/509/563/584/620/745/819/856/888/1341/1344 ---------------------------
  ha_data<-ha_data %>% mutate(ht = if_else(plot == 5750 & 
                                             year==2008 &
                                             (tag_number ==469	|
                                             tag_number ==509	|
                                             tag_number ==563	|
                                             tag_number ==584	|
                                             tag_number ==620	|
                                             tag_number ==745	|
                                             tag_number ==819	|
                                             tag_number ==856	|
                                             tag_number ==888	|
                                             tag_number ==1341|
                                             tag_number ==1344),
                              (ht*10), ht))
  
  

# 688 ---------------------------------------------------------------------
  # Correcting 688 height
  ha_data<-ha_data %>%
    mutate(ht=replace(ht, plot==5750 & year==2004 & tag_number==688, 130))
  
  # Correcting NOL code
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5750 & year==2004 & tag_number==668, NA))

# 286 ---------------------------------------------------------------------
  # 286 was repro in 2002
  ha_data$infl[ha_data$plot == 5750 &
                 ha_data$year == 2002 & 
                 ha_data$tag_number == 286] <- 1

# 106 ---------------------------------------------------------------------
  # 106 correct column
  ha_data<-ha_data %>%
    mutate(column=replace(column, plot==5750 & tag_number==106, 10))
  
# 939 ---------------------------------------------------------------------
    # 939 correct column
    ha_data<-ha_data %>%
      mutate(column=replace(column, plot==5750 & tag_number==939, 10))

# 927 ---------------------------------------------------------------------    
    # 927 correct column
    ha_data<-ha_data %>%
      mutate(column=replace(column, plot==5750 & tag_number==927, 10))

# 101 ---------------------------------------------------------------------
# correct code on 101
    ha_data<-ha_data %>%
      mutate(code=replace(code, plot==5750 & 
                            year==2004 & 
                            tag_number==101, "dead")) %>% 
      mutate(ht=replace(ht, plot==5750 & 
                          year==2004 & 
                          tag_number==101, 0)) 
        
# 202 ---------------------------------------------------------------------
# correct code on 202
    ha_data<-ha_data %>%
      mutate(shts=replace(shts, plot==5750 & year==2002 & tag_number==202, 2)) %>% 
      mutate(ht=replace(ht, plot==5750 & year==2002 & tag_number==202, 15)) 

# 101 ----------------------------------------------------------------------
# delete 101
    to_delete <- ha_data %>%
      filter(plot == 5750 &
               tag_number == 101)
    ha_data <- anti_join(ha_data, to_delete)
    rm(to_delete)


# 1398/1338 ---------------------------------------------------------------
# 1398 incorrectly entered as 1338 in 2008-2009
# add correct measurments to 1338
  ha_data<-ha_data %>%
    mutate(shts=replace(shts, plot==5750 & 
                          year==2008 & 
                          tag_number==1398, 2)) %>% 
    mutate(ht=replace(ht, plot==5750 & 
                        year==2008 & 
                        tag_number==1398, 11)) 
    
    delete1338 <- ha_data %>%
    
      filter(plot == 5750 &
             tag_number == 1338 &
             (year == 2008 |
             year == 2009))
      
    ha_data <- anti_join(ha_data, delete1338)
    
    rm(delete1338)
  
    

# tag changes 2024 Manaus visit -------------------------------------------
    


    ha_data<-ha_data %>%
      mutate(tag_number=replace(tag_number, plot==5750 & tag_number==153, 13902)) %>% 
      mutate(tag_number=replace(tag_number, plot==5750 & tag_number==2361,13908)) %>% 
      mutate(tag_number=replace(tag_number, plot==5750 & tag_number==1340,13907)) %>% 
      mutate(tag_number=replace(tag_number, plot==5750 & tag_number==2365,13909)) %>% 
      mutate(tag_number=replace(tag_number, plot==5750 & tag_number==2390,13560)) %>% 
      mutate(tag_number=replace(tag_number, plot==5750 & tag_number==767,13910)) %>% 
      mutate(tag_number=replace(tag_number, plot==5750 & tag_number==147,13901)) %>% 
      mutate(tag_number=replace(tag_number, plot==5750 & tag_number==460,13905)) %>% 
      mutate(tag_number=replace(tag_number, plot==5750 & tag_number==461,13904)) 
  })
  
  return(ha_data)
}

