
# STEP 1: Load, correct, and organize the demographic data -----------------

source("./code/survey_cleaning/clean_heliconia_data.R")
ha_data<-clean_heliconia_data()

# csv file of plot descriptors ---------------------------------------------
source("./code/survey_cleaning/create_plot_info_file.R")
create_plot_info_file()

# csv file of treefall records ---------------------------------------------
source("./code/survey_cleaning/create_plant_damage_file.R")
create_plant_damage_file()

# csv file of tag replacements in the field --------------------------------
source("./code/survey_cleaning/create_tag_changes_file.R")
create_tag_changes_file()


# csv file of tag replacements in the field --------------------------------
source("./code/survey_cleaning/create_plot_treefalls_file.R")
create_plot_treefalls_file()


# STEP 2: Review of the 'Clean' Data ----------------------------------------

# must have a `heliconia_survey_clean` in the `data/survey_clean` folder
# Note that these are subset of the validation procedures that are automatically
# conducted by `pointblank`. The only difference is that this automatically
# downloads the .csv files to the 'data/survey_review' folder.

source("./code/survey_review/review_heliconia_data.R")
review_heliconia_data()