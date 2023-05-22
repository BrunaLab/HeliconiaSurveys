code_as_sdlg <- function(ha_data) {
  
  
  ha_data <-
    ha_data %>%
    mutate(sdlg_status = if_else(code == "sdlg", TRUE, FALSE)) %>%
    mutate(sdlg_status = if_else(is.na(sdlg_status), FALSE, sdlg_status))
  

  return(ha_data)
}
