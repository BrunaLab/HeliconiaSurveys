
# load libraries ----------------------------------------------------------

library(tidyverse)

# create a new DF with treefall impact and save it as a csv
treefall_impact <- ha_dryad %>%
  select(plot, plant_id, year, treefall_status) %>%
  drop_na(treefall_status)

write_csv(treefall_impact, "./data_clean/treefall_impacts.csv")