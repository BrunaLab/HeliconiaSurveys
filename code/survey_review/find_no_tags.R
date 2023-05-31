find_no_tags <- function(ha_data) {
  
  
  
  # 1999 was still setting up plots, so those "uly" need to be converted to new plants
  
  
  ha_data <- ha_data %>%
    mutate(adult_no_tag = case_when(
      (adult_no_tag == TRUE & year == 1999) ~ FALSE,
      TRUE ~ adult_no_tag
    ))
  
  
  
  tagless_plants <-
    ha_data %>%
    filter(adult_no_tag == TRUE) %>%
    arrange(notes, plot, year, tag_number) %>%
    select(-ht, -shts, -infl, -x_09, -y_09, -notes)




  # tagless_plants_yr <- tagless_plants_raw %>%
  #   group_by(year) %>%
  #   tally() %>%
  #   arrange((year))

  if (nrow(tagless_plants) == 0) {
    x <- "\n
    ------------------------------------------------------------------
    Your dataset has NO 'adult' (i.e., established) plants that were
    found in the plots without a tag.
    ------------------------------------------------------------------
    \n"

    writeLines(x)
  } else {
    
    tagless_summary <- tagless_plants %>%
      group_by(habitat, plot) %>%
      tally() %>%
      arrange(desc(n))
    
    x <- "\n
    ------------------------------------------------------------------
    There were 'adult' plants (i.e., larger, established individuals) 
    found without a tag during during one or more field surveys. 
    A csv file of these plants has been saved to:
    `data/survey_review/adult_heliconia_no_tag.csv`
    
    A summary of how many of these plants were in each plot is:"

    writeLines(x)

    print(tagless_summary)
    
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



    write_csv(tagless_plants, "./data/survey_review/adult_heliconia_no_tag.csv")
  }
}


