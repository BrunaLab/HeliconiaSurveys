
# STEP 2: Review of the 'Clean' Data ----------------------------------------

# must have a `heliconia_survey_clean` in the `data/survey_clean` folder
# Note that these are subset of the validation procedures that are automatically
# conducted by `pointblank`. The only difference is that this automatically
# downloads the .csv files to the 'data/survey_review' folder.

source("./code/survey_review/review_heliconia_data.R")
review_heliconia_data()