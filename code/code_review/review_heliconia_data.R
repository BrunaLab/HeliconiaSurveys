review_heliconia_data <- function() {
  
  
  library(tidyverse)
  
  # load the complete and clean Heliconia dataset ---------------------------
  
  
  ha_data<-read_csv("./data/data_clean/heliconia_data_clean.csv")
  # check for zombie plants  ------------------------------------------------
  
  # Zombie Plants are plants that were marked dead in year t but with 
  # a measurement of shts or ht in a subsequent year, indicating they had 
  # lost above-ground parts but were still alive. This function identifies
  # them, corrects those that are simple to correct, and then saves a csv
  # file with those that should be reviewed in the original records and corrected
  # in the correction file.
  
  # A message will inform if there are NO zombies in the dataset
  
  source("./code/code_review/find_zombies.R")
  find_zombies(ha_data)
  
  
  # check for duplicate plant_id numbers -----------------------------
  
  # This will check for duplicated plant_id numbers.
  # Any found will be saved for review in a csv file
  
  # A message will inform if there are NO duplicate plant_id numbers
  
  source("./code/code_review/find_dupe_id.R")
  find_dupe_id(ha_data)
  
  
  # Save CSV of plants that were not on the survey list ---------------------
  
  # Sometimes the team conducting the survey will find a plant that is not on the 
  # list of plants to be recorded. This is usually because it was marked dead 
  # in a previous year but re-sprouted. (This is why we leave plants with their 
  # numbered stake until they have been recorded "dead" >1 time).
  # 
  # This function will find any any that were not on the survey list and save
  # them in a csv file to allow going back through surveys to figure out what 
  # happened
  
  # A message will inform if there are NO plants in the dataset that weren't
  # on the survey list taken to the field.
  
  source("./code/code_review/find_not_listed.R")
  find_not_listed(ha_data)
  
  
  # Find duplicate tag numbers ----------------------------------------------
  
  
  
  
  # occasionally a member of the survey team will write down or read out a 
  # tag number incorrectly.  The function `detect_duplicate_plants.R` will
  # identify them and save as a csv file, which will allow for 
  # reviewing the original records to sort the duplicates out
  # records. It will also return the demographic data file 
  # with the duplicate tag numbers labeled in a new column
  
  source("./code/code_review/find_dupe_tags.R")
  find_dupe_tags(ha_data)
  
  # This will give you a list of the individual plants with duplicated tag 
  # numbers and the plot in which they are located
  
  
  # find "adult plants" without a tag ---------------------------------------------
  
  
  source("./code/code_review/find_no_tags.R")
  find_no_tags(ha_data)
  
  
  # return(ha_data)
}