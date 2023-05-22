code_treefalls <- function(ha_data) {
  
  
  # This codes the options in the branchfall / treefall column
  
  ha_data <- ha_data %>%
    mutate(treefall_status = if_else(
      code %in% c("under branchfall", "under treefall", "under branchfall, resprouting", "under litter"),
      code,
      NA_character_
    )) %>%
    mutate(treefall_status = replace(treefall_status, 
                                     treefall_status == "under branchfall, 
                                     resprouting", 
                                     "under branchfall"))
  
  
  
  return(ha_data)
  
}
