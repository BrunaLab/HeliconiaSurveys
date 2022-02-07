
correct_5750 <- function(ha_data) {
  
  # Some of the plants in 5750 were put as Row "L" because he thought they might be
  # just outside the plot. I converted to J.
  ha_data$row[ha_data$plot == "5750" & ha_data$row == "L"] <- "J"
  
  # If you want to convert these to 0 to say they are inside the plot,
  # then uncomment these two lines
  # ha_data$x_09[ha_data$x_09 < 1] <- 0
  # ha_data$y_09[ha_data$x_09 < 1] <- 0
  

  
  # The mess of 988,886...resolved! 
  # delete the 988 in D10
  delete988 <- ha_data %>%
    filter(plot == 5750 &
             tag_number == 988 &
             row == "D" &
             column == 10)
  ha_data <- anti_join(ha_data, delete988)
  rm(delete988)
  
  data988<-ha_data %>% 
    filter(plot==5750) %>% 
    filter(tag_number==886) %>%
    filter(year!=2006 & 
             year!=2007 &
             year!=2008 &
             year!=2009) %>% 
    select(year:notes)
  
  # delete pre 2005 measurements
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
                 ha_data$tag_number == 886] <- "sdlg (1)"
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 886] <- 1
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2004 &
               ha_data$tag_number == 886] <- 10
  
  # add the 2005 measurements
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 886] <- 2
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2005 &
               ha_data$tag_number == 886] <- 14
  
  
  
  ha_data<-ha_data %>% mutate(ht = ifelse((plot == 5750 & tag_number ==988 & 
                                             (year!=2006 & 
                                                year!=2007 &
                                                year!=2008 &
                                                year!=2009)),data988$ht, ht)) %>% 
    mutate(shts = ifelse((plot == 5750 & tag_number ==988 & 
                          (year!=2006 & 
                             year!=2007 &
                             year!=2008 &
                             year!=2009)),data988$shts, shts)) %>% 
    mutate(infl = ifelse((plot == 5750 & tag_number ==988 & 
                          (year!=2006 & 
                             year!=2007 &
                             year!=2008 &
                             year!=2009)),data988$infl, infl)) 
  
  
  # 2002 (J8) was incorrectly typed in as 2022 in 2007. Need to add the 2007 
  # measurements to 2002, then delete the incorrect 2022 in J8
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 2002] <- "sdlg (1)"
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 2002] <- 1
  ha_data$ht[ha_data$plot == 5750 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 2002] <- 8
  
  # delete the duplicate
  delete2022 <- ha_data %>%
    filter(plot == 5750 &
             tag_number == 2022 &
             row == "J" &
             column == 8)
  ha_data <- anti_join(ha_data, delete2022)
  rm(delete2022)
  
  
  # 1409 (H10) was incorrectly typed in as 1401 in 2006. Need to add the 2006 
  # measurements to 1409, then delete the incorrect 1401 in H10
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 1409] <- "sdlg (1)"
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 1409] <- 1
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2006 &
               ha_data$tag_number == 1409] <- 8
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 1409] <-NA
  # delete the duplicate
  delete1401 <- ha_data %>%
    filter(plot == 5750 &
             tag_number == 1401 &
             row == "H" &
             column == 10)
  ha_data <- anti_join(ha_data, delete1401)
  rm(delete1401)
  
  
  
  # Plant 236 - add code for year it's missing, delete the plot
  # it duplicate numbers, delete incorrect plot
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2006 &
                 ha_data$tag_number == 236] <- "missing (60)"
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2008 &
                 ha_data$tag_number == 236] <- "missing (60)"
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2009 &
                 ha_data$tag_number == 236] <- "missing (60)"
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2007 &
                 ha_data$tag_number == 236] <- 1
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2007 &
               ha_data$tag_number == 236] <- 10
  # delete the duplicate
  to_delete <- ha_data %>%
    filter(plot == 5750 &
             tag_number == 236 &
             row == "G" &
             column == 9)
  ha_data <- anti_join(ha_data, to_delete)
  rm(to_delete)
  
  # Updating Codes 
  ha_data$code[ha_data$plot == "5750" & ha_data$year == 2005 & ha_data$tag_number == 864] <- "missing (60)"
  
  ha_data$code[ha_data$plot == 5750 &
                 (ha_data$year == 2005 | ha_data$year == 2006 | ha_data$year == 2007) & 
                 ha_data$tag_number == 101] <- NA
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2004 & 
               ha_data$tag_number == 101] <- NA
  
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2004 & 
                 ha_data$tag_number == 101] <- NA
  
  ha_data$infl[ha_data$plot == 5750 &
                 ha_data$year == 2004 & 
                 ha_data$tag_number == 101] <- NA
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2009 & 
                 ha_data$tag_number == 2341] <- "ULY (3)"
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 2061] <- "ULY (3)"
  
  # location
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 79] <- 6
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 106] <- 10
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 272] <- "G"
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 272] <- 6
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 274] <- "G"
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 274] <- 6
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 422] <- "J"
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 426] <- "J"
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 722] <- 6
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 927] <- 10
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 939] <- 10
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 986] <- "J"
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 2360] <- 6
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 747] <- "J"
  

  return(ha_data)
}

