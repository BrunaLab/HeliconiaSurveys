
correct_5750 <- function(ha_data) {
  
  # Some of the plants in 5750 were put as Row "L" because he thought they might be
  # just outside the plot. I converted to J.
  ha_data$row[ha_data$plot == "5750" & ha_data$row == "L"] <- "J"
  
  # If you want to convert these to 0 to say they are inside the plot,
  # then uncomment these two lines
  # ha_data$x_09[ha_data$x_09 <] <- 0
  # ha_data$y_09[ha_data$x_09 <] <- 0
  

  
  # in 2008 data for339 incorrectly entered as338
  # add to339
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$tag_number ==339 & 
                 ha_data$year == 2008] <- 2
  
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$tag_number ==339 & 
               ha_data$year == 2008] <-1
  
  # remove from338
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$tag_number ==338 &
                 ha_data$year == 2008] <- NA
  
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$tag_number ==338 &
               ha_data$year == 2008] <- NA
  
  #339 in 2007 marked as dead but wasn't
  
  ha_data$code[ha_data$plot == 5750 &
               ha_data$tag_number ==339 & 
               ha_data$year == 2007] <- NA
  
  
  
  
  
  # The mess of 988,886...resolved! 
  # delete the 988 in D10
  delete988 <- ha_data %>%
    filter(plot == 5750 &
             tag_number == 988 &
             row == "D" &
             column ==0)
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
                 ha_data$tag_number == 886] <- "sdlg"
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2004 &
                 ha_data$tag_number == 886] <-
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2004 &
               ha_data$tag_number == 886] <-0
  
  # add the 2005 measurements
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2005 &
                 ha_data$tag_number == 886] <- 2
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2005 &
               ha_data$tag_number == 886] <-4
  
  
  
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
  
  
  #409 (H10) was incorrectly typed in as401 in 2006. Need to add the 2006 
  # measurements to409, then delete the incorrect401 in H10
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2006 &
                 ha_data$tag_number ==409] <- "sdlg"
  ha_data$shts[ha_data$plot == 5750 &
                 ha_data$year == 2006 &
                 ha_data$tag_number ==409] <-
  ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2006 &
               ha_data$tag_number ==409] <- 8
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2007 &
                 ha_data$tag_number ==409] <-NA
  # delete the duplicate
  delete1401 <- ha_data %>%
    filter(plot == 5750 &
             tag_number ==401 &
             row == "H" &
             column ==0)
  ha_data <- anti_join(ha_data, delete1401)
  rm(delete1401)
  
  
  
  # Plant 236 - add code for year it's missing, delete the plot
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
  
  # Updating Codes 
  ha_data$code[ha_data$plot == "5750" & ha_data$year == 2005 & ha_data$tag_number == 864] <- "missing"
  
  ha_data$code[ha_data$plot == 5750 &
                 (ha_data$year == 2005 | ha_data$year == 2006 | ha_data$year == 2007) & 
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
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2009 & 
                 ha_data$tag_number == 2341] <- "ULY"
  
  # incorrectly recorded as seedling
  ha_data$code[ha_data$plot == 5750 &
                 ha_data$year == 2007 & 
                 ha_data$tag_number == 2061] <- "ULY"
  
  # location
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 79] <- 6
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number ==06] <-0
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 272] <- "G"
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 272] <- 6
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 274] <- "G"
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 274] <- 6
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 422] <- "J"
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 426] <- "J"
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 722] <- 6
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 927] <-0
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 939] <-0
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 986] <- "J"
  ha_data$column[ha_data$plot == "5750" & ha_data$tag_number == 2360] <- 6
  ha_data$row[ha_data$plot == "5750" & ha_data$tag_number == 747] <- "J"
  
  
  # these were incorrectly ntered with a decimal in the ht
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
  
  
  # Correcting NOL code
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot==5750 & year==2004 & tag_number==668, NA))
  
  
  return(ha_data)
}

