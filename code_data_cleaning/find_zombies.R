
find_zombies <- function(ha_data) {
  
  zombies <-
    ha_data %>%
    group_by(plant_id) %>%
    mutate(
      zombie = if_else(lag(code, 1) == "dead", "delete", NA_character_),
      .before = 'code'
    ) %>%
    fill(zombie, .direction ="down") %>% 
    filter(zombie=="delete") %>% 
    mutate(zombie = if_else((is.na(shts) & is.na(ht)), "delete", "zombie")) %>% 
    filter(zombie=="zombie")
  
  
  
  if (nrow(zombies)==0) {
    print("there are no zombies in your dataset")
  } else {
    # This just prints them out with each plant separated by a row
    zombies_clean <-
      as.data.frame(lapply(zombies, as.character), stringsAsfactors = FALSE)
    zombies_all_yrs_new <-
      head(do.call(
        rbind,
        by(zombies_clean, zombies_clean$tag_number, rbind, "")
      ),-1)
    write.csv(zombies_all_yrs_new,
              "./data_check/heliconia_zombies_formatted.csv",
              row.names = FALSE)
    
    
    zombie_summary <- zombies %>% 
      select(plot,plant_id) %>% 
      group_by(plot,plant_id) %>% 
      slice(1)
    
    
    print("The file of zombie plants in the dataset has been saved as `heliconia_zombies_formatted.csv`.") 
    print("This function returns the summary of how many are in each plot (see below).")
    
    
    
    return(zombie_summary)
  }
  
}
