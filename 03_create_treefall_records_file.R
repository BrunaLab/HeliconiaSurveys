
# load libraries ----------------------------------------------------------

library(tidyverse)


# load the complete and clean Heliconia dataset ---------------------------

ha_data<-read_csv("./data_clean/heliconia_data_clean.csv")

# create a new DF with treefall impact information
treefall_impact <- ha_data %>%
  select(plot_id, plant_id, year, treefall_status) %>%
  drop_na(treefall_status)


# save to data_clean folder -----------------------------------------------

if (!dir.exists("./data_clean")){
  dir.create("./data_clean")
}else{
  print("./data_clean")
}




write_csv(treefall_impact, "./data_clean/treefall_impacts.csv")