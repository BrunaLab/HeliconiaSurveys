create_treefall_records_file <- function() {
# load libraries ----------------------------------------------------------

library(tidyverse)

  
  
  # create version file -----------------------------------------------------
  
  source("./code/create_version_file.R")
  dataset<-"treefall_impacts"
  create_version_file(dataset)  

# load the complete and clean Heliconia dataset ---------------------------

ha_data<-read_csv("./data/survey_clean/heliconia_survey_clean.csv",
                  show_col_types = FALSE)

# create a new DF with treefall impact information
treefall_impact <- ha_data %>%
  select(plot_id, plant_id, year, treefall_status) %>%
  drop_na(treefall_status)


# save to data_clean folder -----------------------------------------------

if (!dir.exists("./data/survey_clean")){
  dir.create("./data/survey_clean")
}else{
  # print(" ")
}

print("The file has been saved to: 'data/survey_clean/treefall_impacts.csv' ")

write_csv(treefall_impact, "./data/survey_clean/treefall_impacts.csv")

}