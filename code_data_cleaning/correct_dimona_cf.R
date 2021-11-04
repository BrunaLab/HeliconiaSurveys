# Corrections Dimona-CF ---------------------------------------------------

correct_dimona_cf <- function(ha_data) {
  
  ha_data$column[ha_data$plot == "Dimona-CF" & ha_data$column == 11] <- 10
  
  # plant 81 was not dead in 06
  ha_data$code[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 81 &
                 ha_data$year == 2006] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 81 &
                 ha_data$year == 2008] <- "missing (60)"
  
  ha_data$code[ha_data$plot == "Dimona-CF" &
                 ha_data$tag_number == 81 &
                 ha_data$year == 2009] <- "missing (60)"
  
  # location
  ha_data$row[ha_data$plot == "Dimona-CF" & ha_data$HA_ID_Number == 5662] <- "E"
  ha_data$column[ha_data$plot == "Dimona-CF" & ha_data$HA_ID_Number == 5739] <- 10
  ha_data$column[ha_data$plot == "Dimona-CF" & ha_data$HA_ID_Number == 5762] <- 10
  
  return(ha_data)
}
