find_dupe_id <- function(ha_data) {
  initial_dupes <- ha_data %>%
    group_by(year, plant_id) %>%
    tally() %>%
    filter(n > 1) %>%
    pull(plant_id) %>%
    unique()
  initial_dupes <- as_tibble(initial_dupes)


  if (nrow(initial_dupes) == 0) {
    x <- "\n
    ------------------------------------------------------------------
    There are NO duplicate plant_id numbers in your dataset.
    ------------------------------------------------------------------
    \n"

    writeLines(x)
  } else {
    # This just prints them out with each plant separated by a row


    x <- "\n
    ------------------------------------------------------------------
    A csv file of duplicate plant_id numbers in your dataset has been
    saved as 'survey_review/duplicate_IDs.csv'
    ------------------------------------------------------------------
    \n"

    writeLines(x)




    # save the csv file -------------------------------------------------------


    if (!dir.exists("./data/survey_review")) {
      dir.create("./data/survey_review")
    } else {
      # placeholder - does nothing
    }



    write.csv(initial_dupes,
      "./data/survey_review/duplicate_IDs.csv",
      row.names = FALSE
    )
  }
}
