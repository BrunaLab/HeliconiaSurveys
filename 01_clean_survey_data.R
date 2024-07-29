

# Packages Required -------------------------------------------------------

# install.packages("tidyverse")
# install.packages("readxl")
# install.packages("here")
# install.packages("cowplot")
# install.packages("gridExtra")
# install.packages("rfigshare")
# install.packages("semver")
# install.packages("janitor")

library(tidyverse)
library(readxl)
library(here)
library(cowplot)
library(gridExtra)
library(rfigshare)
library(semver)
library(janitor)

# STEP 1: Load, correct, and organize the demographic data -----------------

source("./code/survey_cleaning/clean_heliconia_data.R")
ha_data<-clean_heliconia_data()

# create version file
# source("./code/create_version_file.R")
# dataset<-"heliconia_survey_clean"
# create_version_file(dataset)  


# csv file of plot descriptors ---------------------------------------------
source("./code/survey_cleaning/create_plot_info_file.R")
create_plot_info_file()

# create version file
# source("./code/create_version_file.R")
# dataset<-"plots"
# create_version_file(dataset)
# 


# csv file of treefall records ---------------------------------------------
source("./code/survey_cleaning/create_plant_damage_file.R")
create_plant_damage_file()

# create version file
# source("./code/create_version_file.R")
# dataset<-"plant_damage"
# create_version_file(dataset)  


# csv file of tag replacements in the field --------------------------------
source("./code/survey_cleaning/create_tag_changes_file.R")
create_tag_changes_file()

# create version file 
# source("./code/create_version_file.R")
# dataset<-"tag_changes"
# create_version_file(dataset)  

# csv file of tag replacements in the field --------------------------------
source("./code/survey_cleaning/create_plot_treefalls_file.R")
create_plot_treefalls_file()

# create version file 
# source("./code/create_version_file.R")
# dataset<-"plot_treefalls"
# create_version_file(dataset)  


# STEP 2: Review of the 'Clean' Data ----------------------------------------

# must have a `heliconia_survey_clean` in the `data/survey_clean` folder
# Note that these are subset of the validation procedures that are automatically
# conducted by `pointblank`. The only difference is that this automatically
# downloads the .csv files to the 'data/survey_review' folder.

source("./code/survey_review/review_heliconia_data.R")
review_heliconia_data()