check_tags <- function(ha_data) {

  library(dplyr)
  library(tidyr)
    
  # This function does multiple validations related to tag numbers.
  # (1) It standardizes tag numbers
  # (2) It finds any duplicated tag numbers in the same plot and 
  # saves a file of these for review.
  # (3) labels any established plants in plots that were found without a tag,
  # suggesting they were missed by the survey team in a previous year/


# standardize tag numbers -------------------------------------------------

  
  
  # some of the duplicates were identified in the dataset with decimals (e.g.,
  # 224.1 and 224.2 were plants with duplicate tag numbers 224. This function
  # removes those decimals and standardizes tag numbers.

  # round down the duplicate tag numbers that have decimals
  # (note the the plant_ids for these plants are unique)
  ha_data$tag_number <- floor(ha_data$tag_number)
  ha_data$tag_number <- as.integer(ha_data$tag_number)



# find duplicate tag numbers ----------------------------------------------
  
  # occasionally a member of the survey team will write down or read out a
  # tag number incorrectly.  The function `detect_duplicate_plants.R` will
  # identify them and save as a csv file, which will allow for
  # reviewing the original records to sort the duplicates out
  # records. It will also return the demographic data file
  # with the duplicate tag numbers labeled in a new column
  
  
  duplicates <- ha_data %>%
    group_by(habitat,plot,plant_id,tag_number,subplot) %>%
    unique() %>% 
    ungroup %>% 
    group_by(plot,tag_number) %>%
    filter(n() > 1)
  
  
  duplicates$tag_number <- as.numeric(duplicates$tag_number)
  duplicates$duplicate_tag <- "duplicate tag number"
  
  
  # duplicate_tags
  
  ha_data <- left_join(ha_data, duplicates, by = c("plot", "tag_number"))
  # names(ha_data)
  
  
# label plants as "adult_no_tag" ------------------------------------------


  # now create the new column for all plants found without tags.
  # this includes uly, new plant without tag, etc.
  
  
  
  ha_data <- ha_data %>%
    mutate(adult_no_tag = case_when(
      code == "no tag" ~ TRUE,
      code == "plant without tag" ~ TRUE,
      code == "new plant in plot" ~ TRUE,
      code == "ULY" ~ TRUE,
      TRUE ~ FALSE))
  
  # summary(ha_data$adult_no_tag)
  
  # uly_plants_raw <-
  #   ha_data %>%
  #   filter(adult_no_tag == TRUE) %>%
  #   arrange(notes, plot, year, tag_number) %>%
  #   select(-ht, -shts, -infl, -x_09, -y_09, -notes)
  
  
  
  
  # uly_plants_yr <- uly_plants_raw %>%
  #   group_by(year) %>%
  #   tally() %>%
  #   arrange((year))
  
  return(ha_data)
}
