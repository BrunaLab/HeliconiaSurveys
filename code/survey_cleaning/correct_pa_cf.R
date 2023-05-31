correct_pa_cf <- function(ha_data) {


# 354/356 -----------------------------------------------------------------
  # the 356 in B4 is actually 354
  ha_data$tag_number[ha_data$plot == "PortoAlegre-CF" & 
                       ha_data$tag_number == 356 &
                       ha_data$row == "B" & 
                       ha_data$column == 6] <- 354
  

# Missing status ----------------------------------------------------------
# 196 ---------------------------------------------------------------------
  ha_data$code[ha_data$plot == "PortoAlegre-CF" & 
                 ha_data$year == 2004 & 
                 ha_data$tag_number == 196] <- "missing"
  ha_data$code[ha_data$plot == "PortoAlegre-CF" & 
                 ha_data$year == 2005 & 
                 ha_data$tag_number == 196] <- "missing"
# 238 ---------------------------------------------------------------------
  ha_data$code[ha_data$plot == "PortoAlegre-CF" & 
                 ha_data$year == 2006 & 
                 ha_data$tag_number == 238] <- "missing"
# 139 ---------------------------------------------------------------------
  ha_data$code[ha_data$plot == "PortoAlegre-CF" & 
                 ha_data$year == 2005 & 
                 ha_data$tag_number == 139] <- "missing"
  ha_data$code[ha_data$plot == "PortoAlegre-CF" & 
                 ha_data$year == 2006 & 
                 ha_data$tag_number == 139] <- "missing"
  
# 264 ---------------------------------------------------------------------
  # Remove duplicated record 
  ha_data<-ha_data[
    (ha_data$plot != "PortoAlegre-CF") | 
      (ha_data$tag_number != "264") |
      (ha_data$row != "C") |
      (ha_data$column != 10)
    , ]
  
# 32 / 53/ 89 / 149 / 195 / 327 -------------------------------------------
  # Correcting NOL code  
  ha_data<-ha_data %>%
    mutate(code=replace(code, plot=="PortoAlegre-CF" & 
                          year==2008 & 
                          tag_number==32,NA)) %>% 
    mutate(code=replace(code, plot=="PortoAlegre-CF" & 
                          year==2002 & 
                          tag_number==53,NA)) %>% 
    mutate(code=replace(code, plot=="PortoAlegre-CF" & 
                          year==2002 & 
                          tag_number==89,NA)) %>% 
    mutate(code=replace(code, plot=="PortoAlegre-CF" & 
                          year==2008 & 
                          tag_number==149,NA)) %>% 
    mutate(code=replace(code, plot=="PortoAlegre-CF" & 
                          year==2008 & 
                          tag_number==195,NA)) %>% 
    mutate(code=replace(code, plot=="PortoAlegre-CF" & 
                          year==2008 & 
                          tag_number==327,NA)) 
  
    
  
  return(ha_data)
}