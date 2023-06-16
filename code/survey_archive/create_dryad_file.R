create_dryad_file <- function() {
  # load libraries ----------------------------------------------------------

  library(tidyverse)


  # # create version files ----------------------------------------------------
  # source("./code/create_version_file.R")
  # dataset<-"HDP_plots"
  # create_version_file(dataset)
  # dataset<-"HDP_survey"
  # create_version_file(dataset)
  # 
  #   rm(dataset)
  
  # load the complete and clean Heliconia survey dataset ---------------------------

  ha_data <- read_csv("./data/survey_clean/heliconia_survey_clean.csv",
                      show_col_types = FALSE)

  # organize it for Dryad format --------------------------------------------

  # names(ha_data)
  # head(ha_data)

  ha_dryad <- ha_data %>%
    select(
      plot_id,
      subplot,
      plant_id,
      year,
      shts,
      ht,
      infl,
      recorded_sdlg,
      adult_no_tag,
      treefall_status,
      # condition,
      census_status,
      tag_number
    ) %>%
    ungroup()




  # load the plot descriptor file -------------------------------------------

  plots_dryad <- read_csv("./data/survey_clean/HDP_plots.csv",
                          show_col_types = FALSE)


  # make any changes to plot descriptor file prior to archiving in Dryad



  # file with version info --------------------------------------------------


  # Save the files  ----------------------------------------------------------

  if (!dir.exists("./data/survey_archive")) {
    dir.create("./data/survey_archive")
  } else {
    # print(" ")
  }



  write_csv(ha_dryad, "./data/survey_archive/HDP_survey.csv")
  write_csv(plots_dryad, "./data/survey_archive/HDP_plots.csv")
  print("'HDP_survey.csv' and 'HDP_plots.csv' have been saved to: 'data/survey_archive/'")
}
