code_condition <- function(ha_data) {
  
    # sometimes the survey team took recorded notes about the physiological 
    # condition of plants  (e.g. resprouting, dried up). this function creates a
    # column indicating the condition of plants.
    
    ha_data <- ha_data %>%
      mutate(condition = case_when(
        code == "dried" ~ "dried",
        code %in% c("under branchfall, resprouting", "resprouting") ~ "resprouting",
        # else
        TRUE ~ NA_character_
      ))
    
    return(ha_data)
  }