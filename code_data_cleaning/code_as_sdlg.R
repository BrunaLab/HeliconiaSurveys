code_as_sdlg <- function(ha_data) {
  
  
  ha_data <-
    ha_data %>%
    mutate(recorded_sdlg = if_else(code == "sdlg", TRUE, FALSE)) %>%
    mutate(recorded_sdlg = if_else(is.na(recorded_sdlg), FALSE, recorded_sdlg))
  

  return(ha_data)
}
