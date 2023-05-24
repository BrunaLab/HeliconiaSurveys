check_tags <- function(ha_data) {
  
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
    group_by(habitat, plot, tag_number, year) %>%
    filter(n() > 1) %>%
    ungroup() %>%
    select(plot, tag_number) %>%
    unique() %>%
    ungroup()
  
  
  duplicates$tag_number <- as.numeric(duplicates$tag_number)
  duplicates$duplicate_tag <- "duplicate tag number"
  
  
  #
  #   duplicates <-
  #     semi_join(ha_data, duplicates, by = c("plot", "tag_number")) %>%
  #     select(plot_id,plot, habitat,  plant_id,   tag_number, year, row,column, shts, ht, code) %>%
  #     arrange(plot, habitat, tag_number,  row,column,year) %>% # detect all the ones with decimals
  #     bind_rows(ha_data %>% filter(str_detect(tag_number, "\\."))) %>%
  #     ungroup()
  
  
  #  now label the duplicates in the ha_data df
  #
  # duplicate_tags <- duplicates %>%
  #   select(tag_number, plot) %>%
  #   group_by(tag_number, plot) %>%
  #   slice(1) %>%
  #   filter(tag_number > 0) %>%
  #   arrange(plot)
  
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
      .default = FALSE
    ))
  
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
