create_dryad_file <- function() {

# load libraries ----------------------------------------------------------

library(tidyverse)

# load the complete and clean Heliconia survey dataset ---------------------------
  source("./code/survey_archive/create_version_file.R")
  create_version_file()

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
         # condition,
         census_status,
         tag_number
  ) %>%
  ungroup() 




# load the plot descriptor file -------------------------------------------

plots_dryad<-read_csv("./data/survey_clean/HDP_plots.csv")


# make any changes to plot descriptor file prior to archiving in Dryad



# file with version info --------------------------------------------------


# Save the files  ----------------------------------------------------------

if (!dir.exists("./data/survey_archive")){
  
  dir.create("./data/survey_archive")
  
}else{
  
  # print(" ")
}



write_csv(ha_dryad, "./data/survey_archive/HDP_survey.csv")
write_csv(plots_dryad, "./data/survey_archive/HDP_plots.csv")
print("'HDP_survey.csv' and 'HDP_plots.csv' have been saved to: 'data/survey_archive/'")
}
