

# load libraries ----------------------------------------------------------

library(tidyverse)

# load the complete and clean Heliconia dataset ---------------------------


ha_data<-read_csv("./data_clean/heliconia_data_clean.csv")

# organize it for Dryad format --------------------------------------------

# names(ha_data)
# head(ha_data)

ha_dryad <- ha_data %>%
  arrange(row, as.numeric(column)) %>%
  mutate(subplot = paste(row, column, sep = "")) %>%
  select(plot_id,
         subplot,
         plant_id,
         year,
         shts,
         ht,
         infl,
         recorded_sdlg,
         adult_no_tag,
         treefall_status,
         condition,
         census_status,
         tag_number
  ) %>%
  ungroup() 

# TODO: checking, cleanup

# no measurements for some plots in 2000, 2003
ha_dryad %>%
  group_by(plot_id, year) %>%
  summarize(non_na = sum(!is.na(shts))) %>%
  filter(non_na < 5)


# TODO: clarify what this is for
test <- ha_dryad %>%
  # select(plant_id,notes,ht,shts,infl,census_status) %>%
  filter(is.na(ht) & is.na(shts) & is.na(infl)) %>%
  filter(census_status == "measured")
# view(test)

# 
# # create a new DF for treefall impact
# treefall_impact <- ha_dryad %>%
#   select(plot, plant_id, year, treefall_status) %>%
#   drop_na(treefall_status)
# 
# write_csv(treefall_impact, "./data_clean/treefall_impacts.csv")
# ha_dryad

# 
# # DELETE CODE COLUMN
# unique(ha_dryad$code)
# ha_dryad <- ha_dryad %>% select(-code)
# 
# head(ha_dryad)
# glimpse(ha_dryad)
# summary(ha_dryad$infl)
# summary(ha_dryad$recorded_sdlg)
# 
# names(ha_data)


# Save the file  ----------------------------------------------------------

if (!dir.exists("./data_for_dryad")){
  dir.create("./data_for_dryad")
}else{
  print("./data_for_dryad")
}


write_csv(ha_dryad, "./data_for_dryad/HDP_1998_2009.csv")

