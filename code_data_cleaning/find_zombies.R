
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
    zombies <-
      as.data.frame(lapply(zombies, as.character), stringsAsfactors = FALSE)
    zombies_all_yrs_new <-
      head(do.call(
        rbind,
        by(zombies, zombies$tag_number, rbind, "")
      ),-1)
    write.csv(zombies_all_yrs_new,
              "./data_check/zombies_formatted.csv",
              row.names = FALSE)
  }
  
  
  
  return(zombies)
}
