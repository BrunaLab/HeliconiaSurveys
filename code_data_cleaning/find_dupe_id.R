find_dupe_id <- function(ha_data) {
  initial_dupes <- ha_data %>%
    group_by(year, plant_id) %>%
    count() %>%
    filter(n > 1) %>%
    pull(plant_id) %>%
    unique()
  initial_dupes<-as_tibble(initial_dupes)
  
  
  if (nrow(initial_dupes)==0) {
    print("there are no duplicate ID numbers in your dataset")
  } else {
    # This just prints them out with each plant separated by a row
    print("the list of duplicate ID numbers has been saved as 'duplicate_IDs.csv' ")
    
    write.csv(initial_dupes,
              "./data_check/duplicate_IDs.csv",
              row.names = FALSE)
  }
  
  
}