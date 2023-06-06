
# STEP 1: Load, correct, and organize the demographic data -----------------

source("./code/survey_cleaning/clean_heliconia_data.R")
ha_data<-clean_heliconia_data()

# csv file of plot descriptors ---------------------------------------------
source("./code/survey_cleaning/create_plot_info_file.R")
create_plot_info_file()

# csv file of treefall records ---------------------------------------------
source("./code/survey_cleaning/create_treefall_records_file.R")
create_treefall_records_file()

# csv file of tag replacements in the field --------------------------------
source("./code/survey_cleaning/create_tag_changes_file.R")
create_tag_changes_file()