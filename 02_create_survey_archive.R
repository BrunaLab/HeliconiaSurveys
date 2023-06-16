
# STEP 2: Create Files for the Dryad. ---------------------------------------

# csv file of demog dataset for Dryad ---------------------------------------


source("./code/survey_archive/create_dryad_file.R")
create_dryad_file()

# # create version files ----------------------------------------------------
# source("./code/create_version_file.R")
# dataset<-"HDP_plots"
# create_version_file(dataset)
# dataset<-"HDP_survey"
# create_version_file(dataset)
# 
# rm(dataset)










