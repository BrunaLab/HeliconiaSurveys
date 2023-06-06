
# STEP 3: Create Files for the Dryad. ---------------------------------------

# csv file of demog dataset for Dryad ---------------------------------------


plot_version <- "0.9.0"
survey_version <- "0.9.0"

source("./code/survey_archive/create_dryad_file.R")
create_dryad_file(plot_version,survey_version)










