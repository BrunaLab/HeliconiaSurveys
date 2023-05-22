find_not_listed <- function(ha_data) {
  
  
  # TODO: Move this over to the in-progress corrections
  not_listed <-
    ha_data %>%
    filter(code == "not on list" |
             code == "dead and not on list") %>%
    arrange(plot, tag_number)
  
  # unique(not_listed$code)
  # unique(not_listed$notes)
  



  # This just prints them out with each plant separated by a row
  if (nrow(not_listed) == 0) {
    print("there are no plants in your dataset that were not on the survey list.")
  } else {
    print("a list of the plants in your dataset that were not on the survey list in any given year has been saved as `heliconia_not_on_survey_list.csv`")
    print("This function also returns a summary of how many of these plants are in each plot and the year that the were missing from the survey list (below).")
    
    write_csv(not_listed, "./data_check/heliconia_not_on_survey_list.csv")
    
    nol_summary <- not_listed %>%
      group_by(habitat, plot, year) %>%
      tally() %>%
      arrange(n)

    print(nol_summary)
    
    # summary(as.factor(ULY$code == ULY$notes))

  }

  # return(dupes)
  return(nol_summary)
}
