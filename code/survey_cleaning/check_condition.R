check_condition <- function(ha_data) {
  
  
  library(tidyverse)
  
  # This function creates / edits columns with plant status as follows:
  #   (1) categorizing status of plants as seedlings (`recorded_sdlg` =TRUE/FALSE)
  #   (2) noting if plants were impacted by treefalls/branchfalls (`treefall_status`)
  #   (3) noting any observations of the plant physiological condition (`condition`)
  #   (4) confirms that any plants that didn't flower have `infl = NA` 
   
# seedling status column --------------------------------------------------

  ha_data <-
    ha_data %>%
    mutate(recorded_sdlg = if_else(code == "sdlg", TRUE, FALSE)) %>%
    mutate(recorded_sdlg = if_else(is.na(recorded_sdlg), FALSE, recorded_sdlg))
  
  
# treefall status column --------------------------------------------------

  # This codes the options in the branchfall / treefall column
  
  ha_data <- ha_data %>%
    mutate(treefall_status = if_else(
      code %in% c(
        "under branchfall",
        "under treefall",
        "under branchfall, resprouting",
        "under litter"
      ),
      code,
      NA_character_
    )) %>%
    mutate(treefall_status = replace(
      treefall_status,
      treefall_status == "under branchfall,
      resprouting",
      "under branchfall"
    ))
  

# physiological observations column ---------------------------------------

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
  
# coding non-flowering plants ---------------------------------------------

  # Any with infloresence number as `0` need to be changed to `NA`
  
  ha_data <- ha_data %>%
    mutate(infl = replace(infl, infl == 0, NA))
  
  return(ha_data)
}