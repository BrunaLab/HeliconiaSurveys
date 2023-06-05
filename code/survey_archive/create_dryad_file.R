create_dryad_file <- function() {

# load libraries ----------------------------------------------------------

library(tidyverse)

# load the complete and clean Heliconia survey dataset ---------------------------


ha_data<-read_csv("./data/survey_clean/heliconia_survey_clean.csv")

# organize it for Dryad format --------------------------------------------

# names(ha_data)
# head(ha_data)

ha_dryad <- ha_data %>%
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



# load the plot descriptor file -------------------------------------------

plots_dryad<-read_csv("./data/survey_clean/HDP_plots.csv")

# make any changes to plot descriptor file prior to archiging in Dryad
# v1.0: no changes

# Save the files  ----------------------------------------------------------

if (!dir.exists("./data/survey_archive")){
  dir.create("./data/survey_archive")
}else{
  print(" ")
}

print("The files have been saved to: 'data/survey_archive/' as 'HDP_survey.csv' and 'HDP_plots.csv' ")

write_csv(ha_dryad, "./data/survey_archive/HDP_survey.csv")
write_csv(plots_dryad, "./data/survey_archive/HDP_plots.csv")

}

