create_treefall_records_file <- function() {
# load libraries ----------------------------------------------------------

library(tidyverse)


# load the complete and clean Heliconia dataset ---------------------------

ha_data<-read_csv("./data/data_clean/heliconia_data_clean.csv")

# create a new DF with treefall impact information
treefall_impact <- ha_data %>%
  select(plot_id, plant_id, year, treefall_status) %>%
  drop_na(treefall_status)


# save to data_clean folder -----------------------------------------------

if (!dir.exists("./data/data_archive")){
  dir.create("./data/data_archive")
}else{
  print(" ")
}

print("The file has been saved to: 'data/data_archive/treefall_impacts.csv' ")


write_csv(treefall_impact, "./data/data_archive/treefall_impacts.csv")

}