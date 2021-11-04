
correct_5750 <- function(ha_data) {
  
  # Some of the plants in 5750 were put as Row "L" because he thought they might be
  # just outside the plot. I converted to J.
  ha_data$row[ha_data$plot == "5750" & ha_data$row == "L"] <- "J"
  
  # If you want to convert these to 0 to say they are inside the plot,
  # then uncomment these two lines
  # ha_data$x_09[ha_data$x_09 < 1] <- 0
  # ha_data$y_09[ha_data$x_09 < 1] <- 0
  
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
  ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 962] <- 6
  ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 977] <- 10
  ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1133] <- "G"
  ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1133] <- 6
  ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1135] <- "G"
  ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1135] <- 6
  ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1280] <- "J"
  ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1284] <- "J"
  ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1577] <- 6
  ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1778] <- 10
  ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1790] <- 10
  ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1836] <- "J"
  ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 2149] <- 6
  ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1602] <- "J"
  
  
  # 5750
  # tag_no 988
  # ha_data$ht[ha_data$plot=="5750" & ha_data$year==2007 & ha_data$tag_number==988] <-38
  # ha_data$shts[ha_data$plot=="5750" & ha_data$year==2007 & ha_data$tag_number==988] <-3
  # ha_data$code[ha_data$plot=="5750" & ha_data$year==2007 & ha_data$tag_number==988] <- NA
  # ha_data$ht[ha_data$plot=="5750" & ha_data$year==2008 & ha_data$tag_number==988] <-60
  # ha_data$shts[ha_data$plot=="5750" & ha_data$year==2008 & ha_data$tag_number==988] <-2
  # ha_data$ht[ha_data$plot=="5750" & ha_data$year==2009 & ha_data$tag_number==988] <-66
  # ha_data$shts[ha_data$plot=="5750" & ha_data$year==2009 & ha_data$tag_number==988] <-3
  
  return(ha_data)
}

