correct_pa_cf <- function(ha_data) {
  
  # the 356 in B4 is actually 354
  ha_data$tag_number[ha_data$plot == "PortoAlegre-CF" & 
                       ha_data$tag_number == 356 &
                       ha_data$row == "B" & 
                       ha_data$column == 6] <- 354
  
  
  # Missing status
  ha_data$code[ha_data$plot == "PortoAlegre-CF" & ha_data$year == 2004 & ha_data$tag_number == 196] <- "missing (60)"
  ha_data$code[ha_data$plot == "PortoAlegre-CF" & ha_data$year == 2005 & ha_data$tag_number == 196] <- "missing (60)"
  ha_data$code[ha_data$plot == "PortoAlegre-CF" & ha_data$year == 2006 & ha_data$tag_number == 238] <- "missing (60)"
  ha_data$code[ha_data$plot == "PortoAlegre-CF" & ha_data$year == 2005 & ha_data$tag_number == 139] <- "missing (60)"
  ha_data$code[ha_data$plot == "PortoAlegre-CF" & ha_data$year == 2006 & ha_data$tag_number == 139] <- "missing (60)"
  
  # Remove duplicated record 
  ha_data<-ha_data[
    (ha_data$plot != "PortoAlegre-CF") | 
      (ha_data$tag_number != "264") |
      (ha_data$row != "C") |
      (ha_data$column != 10)
    , ]
  return(ha_data)
}