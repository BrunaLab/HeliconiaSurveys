find_dupe_tags <- function(ha_data) {
  dupe_simplified <- ha_data %>%
    filter(duplicate_tag == "duplicate tag number") %>%
    select(habitat, plot_id, plot, tag_number, plant_id, row, column) %>%
    group_by(plot, tag_number, row, column) %>%
    slice(1)

  # This just prints them out with each plant separated by a row
  if (nrow(dupe_simplified) == 0) {
    x <- "\n
    ------------------------------------------------------------------
    There are NO duplicate tag numbers in your dataset.
    ------------------------------------------------------------------
    \n"

    writeLines(x)
  } else {
    dupes_count <- dupe_simplified %>%
      group_by(habitat, plot) %>%
      summarize(n_plants = n_distinct(plant_id)) %>%
      arrange(habitat, desc(n_plants)) %>%
      filter(habitat != "") %>%
      ungroup()


    x <- "\n
    ------------------------------------------------------------------
    There are plants in the same plot with identical tag numbers. These plants 
    have been labeled in the dataset as having `duplicate_tags` A csv file of 
    these plants has been saved here: `survey_review/dupe_heliconia_tags.csv`.

    Note that plants with identical tag numbers can still be distinguished by 
    their unique 'plant_id' numbers.
    
    Here is a summary of how many plants with duplicate tags are in each plot:"

    writeLines(x)

    print(dupes_count)
    
    
    y <- "\n
    ------------------------------------------------------------------"
    
    writeLines(y)
    
  }


  # save the csv file -------------------------------------------------------


  if (!dir.exists("./data/survey_review")) {
    dir.create("./data/survey_review")
  } else {
    
  }

  write.csv(dupe_simplified, "./data/survey_review/dupe_heliconia_tags.csv", row.names = FALSE)

  # return(ha_data)
}
