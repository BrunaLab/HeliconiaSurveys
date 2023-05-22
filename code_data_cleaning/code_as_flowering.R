code_as_flowering <- function(ha_data) {
  
  
  
  # Any that are 0 need to be changed to NA
  
  ha_data <- ha_data %>%
    mutate(infl = replace(infl, infl == 0, NA))
  
  return(ha_data)
  
  
}
