find_zombies <- function(ha_data) {
  zombies <-
    ha_data %>%
    group_by(plant_id) %>%
    mutate(
      # zombie = if_else(lag(code, 1) == "dead", "delete", NA_character_),
      zombie = if_else(lag(census_status, 1) == "dead", "delete", NA_character_),
      .before = 1
      # .before = "code"
    ) %>%
    fill(zombie, .direction = "down") %>%
    filter(zombie == "delete") %>%
    mutate(zombie = if_else((is.na(shts) & is.na(ht)), "delete", "zombie")) %>%
    filter(zombie == "zombie")



  if (nrow(zombies) == 0) {
    
    
    x<-"\n
    ------------------------------------------------------------------
    
    There are NO zombie plants in your dataset.
    
    ------------------------------------------------------------------
    \n"
    
    writeLines(x)   
    
  } else {
    # This just prints them out with each plant separated by a row
    zombies_clean <-
      as.data.frame(lapply(zombies, as.character), stringsAsfactors = FALSE)
    zombies_all_yrs_new <-
      head(do.call(
        rbind,
        by(zombies_clean, zombies_clean$tag_number, rbind, "")
      ), -1)
    write.csv(zombies_all_yrs_new,
      "./data_check/heliconia_zombies_formatted.csv",
      row.names = FALSE
    )


    zombie_summary <- zombies %>%
      select(plot, plant_id) %>%
      group_by(plot, plant_id) %>%
      slice(1)

    
    
    x<-"\n
    ------------------------------------------------------------------
    This function returns the summary of how many 'Zombie Plants' are 
    found in each demographic plot (this is also printeed below). 
    
    A csv file of the Zombie Plants remaining in the in the dataset has 
    been saved as `heliconia_zombies_formatted.csv`. 
    ------------------------------------------------------------------
    \n"
    
    writeLines(x)   

    print(zombie_summary)

    # return(ha_data)
  }
}
