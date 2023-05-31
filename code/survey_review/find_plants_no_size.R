find_plants_no_size <- function(ha_data) {
  
  

# Plants with census_status == "measured" but is.na(shts & ht) ---------

  review_records <- ha_data %>% 
    filter(is.na(ht) & is.na(shts) & is.na(infl)) %>%
    filter(census_status == "measured")
  

  if (nrow(review_records) == 0) {
    x <- "\n
    ------------------------------------------------------------------
    Your dataset has NO records for which a plant is recorded as 
    'MEASURED' but for which there is no recorded value for height, 
    shoot number, or number of infloresences.
    ------------------------------------------------------------------
    \n"

    writeLines(x)
  } else {
    
    review_records_summary <- review_records %>%
      group_by(habitat, plot) %>%
      tally() %>%
      arrange(desc(n))
    
    x <- "\n
    ------------------------------------------------------------------
    There were plants whose census status was == 'MEASURED' 
    but for which no value of height, shoot number, or 
    number of infloresences was recorded. Some of these may be resprouting or 
    have lost above-ground parts, but it is worth reviewing the records to 
    confirm why this is the case. 
    
    A csv file of these plants has been saved to:
    `data/survey_review/no_size_heliconia.csv`
    
    A summary of how many of these plants were in each plot is:"

    writeLines(x)

    print(review_records_summary)
    
    y <- "\n
    ------------------------------------------------------------------"
    writeLines(y)
    
    # Save the files ----------------------------------------------------------

    if (!dir.exists("./data/survey_review")) {
      dir.create("./data/survey_review")
    } else {
      # print(" ")
      # placeholder - does nothing
    }
    write_csv(review_records, "./data/survey_review/no_size_heliconia.csv")
  
  }
}

