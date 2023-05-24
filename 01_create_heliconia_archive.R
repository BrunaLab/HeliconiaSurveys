


# STEP 1: Load, correct, and organize the demographic data -----------------

source("./code/code_cleaning/clean_heliconia_data.R")
ha_data<-clean_heliconia_data()




# Step 2: Review of the 'Clean' Data ----------------------------------------

# must have a `heliconia_data_clean` in the `data/data_clean` folder

source("./code/code_review/review_heliconia_data.R")
review_heliconia_data()



# Step 3: Create Files for the Data Archive ---------------------------------

# csv file of demog dataset for Dryad ---------------------------------------
source("./code/code_archive/create_dryad_file.R")
create_dryad_file()

# csv file of plot descriptors ---------------------------------------------
source("./code/code_archive/create_plot_info_file.R")
create_plot_info_file()

# csv file of treefall records ---------------------------------------------
source("./code/code_archive/create_treefall_records_file.R")
create_treefall_records_file()

# csv file of tag replacements in the field --------------------------------
source("./code/code_archive/create_tag_changes_file.R")
create_tag_changes_file()







