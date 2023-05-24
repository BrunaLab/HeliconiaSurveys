find_not_listed <- function(ha_data) {
  # TODO: Move this over to the in-progress corrections
  not_listed <-
    ha_data %>%
    filter(notes == "not on list" |
      notes == "dead and not on list") %>%
    # filter(code == "not on list" |
    #          code == "dead and not on list") %>%
    arrange(plot, tag_number)

  # unique(not_listed$code)
  # unique(not_listed$notes)




  # This just prints them out with each plant separated by a row
  if (nrow(not_listed) == 0) {
    x <- "\n
    ------------------------------------------------------------------
    There are NO plants in the dataset that were not on the list of
    plants to survey that was taken to the field.
    ------------------------------------------------------------------
    \n"

    writeLines(x)
  } else {
    x <- "\n
    ------------------------------------------------------------------
    A csv file of the plants in the dataset that were not on the
    survey list taken to the field in any given year has been saved
    as `data_review/heliconia_not_on_survey_list.csv`.

    A summary is below.
    ------------------------------------------------------------------
    \n"

    writeLines(x)

    nol_summary <- not_listed %>%
      group_by(habitat, plot, year) %>%
      tally() %>%
      arrange(n)

    print(nol_summary)

    # summary(as.factor(ULY$code == ULY$notes))


    # save the csv file -------------------------------------------------------


    if (!dir.exists("./data/data_review")) {
      dir.create("./data/data_review")
    } else {
      print("./data/data_review")
    }

    write_csv(not_listed, "./data/data_review/heliconia_not_on_survey_list.csv")
  }


  # return()
}
