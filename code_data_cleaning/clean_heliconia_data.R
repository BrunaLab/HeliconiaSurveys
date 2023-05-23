clean_heliconia_data <- function() {

# Code Overview -----------------------------------------------------------
# Script created by Emilio M. Bruna, embruna@ufl.edu
# Script created in R version 3.3.1

# Load libraries ----------------------------------------------------------

library(tidyverse)
library(readxl)

# LOAD AND PREP RAW DEMOGRAPHIC DATA ---------------------------------------

source("./code_data_cleaning/prep_raw_ha_data.R")
ha_data<-prep_raw_ha_data()
  

# merge the PA10 data -----------------------------------------------------

# The data from Porto Alegre's 10-ha fragment were in a different CSV file.
# They were cleaned up and merged with the rest of the demographic data 
# with the function `merge_with_PA10.R`  

source("./code_data_cleaning/merge_with_PA10.R")
ha_data <- merge_with_PA10(ha_data)


# clean up codes column ----------------------------------------------------

# The survey team often recorded observations about individual plants or
# the conditions in plots. These were entered as numerical codes. The 
# function `clean_codes.R` converts them to text to simplify clean-up 

source("./code_data_cleaning/codes_to_text.R")
ha_data <- codes_to_text(ha_data)

# Add a unique plant_id index number for each plant -----------------------

# adding the plant id number here means any subsequent edits or correction
# (now or post-publication will *not* change a plant's unique ID number.
ha_data <- ha_data %>%
  group_by(plot, row, column, tag_number) %>%
  mutate(plant_id = cur_group_id(), .before = 1)



# PLOT-LEVEL CORRECTIONS --------------------------------------------------

# corrections for a demographic plot are made using a lot-specific function 

# Continuous Forest 

# corrections CF-1 (aka Florestal) ----------------------------------------
source("./code_data_cleaning/correct_florestal.R")
ha_data <- correct_florestal(ha_data)

# corrections CF-2 (aka Esteio/Camp 41, 5750) -----------------------------
source("./code_data_cleaning/correct_5750.R")
ha_data <- correct_5750(ha_data)

# corrections CF-3 (aka Esteio/Camp 41, 5756) ------------------------------
source("./code_data_cleaning/correct_5756.R")
ha_data <- correct_5756(ha_data)

# Corrections CF-4 (aka Dimona-CF) -----------------------------------------
source("./code_data_cleaning/correct_dimona_cf.R")
ha_data <- correct_dimona_cf(ha_data)

# Corrections - CF-5 (aka Porto Alegre CF) --------------------------------
source("./code_data_cleaning/correct_pa_cf.R")
ha_data <- correct_pa_cf(ha_data)

# Corrections CF-6 (aka CaboFrio-CF) -------------------------------------
source("./code_data_cleaning/correct_cabofrio_cf.R")
ha_data <- correct_cabofrio_cf(ha_data)

# 1-ha Fragments

# Corrections FF-1 (aka Dimona 1-ha 2107) -------------------------------
source("./code_data_cleaning/correct_2107.R")
ha_data <- correct_2107(ha_data)

# Corrections FF-2 (aka Dimona 1-ha 2108) -------------------------------
source("./code_data_cleaning/correct_2108.R")
ha_data <- correct_2108(ha_data)

# Corrections FF-3 (aka Colosso 1-ha, 5751) -----------------------------
source("./code_data_cleaning/correct_5751.R")
ha_data <- correct_5751(ha_data)

# Corrections FF-4 (aka Porto Alegre 1-ha, 5753) ------------------------
source("./code_data_cleaning/correct_5753.R")
ha_data <- correct_5753(ha_data)

# 10-ha fragments

# Corrections FF-5 (aka Dimona 10-ha 2206) ------------------------------
source("./code_data_cleaning/correct_2206.R")
ha_data <- correct_2206(ha_data)

# Corrections FF-6 (aka Colosso 10-ha 5752) -----------------------------
source("./code_data_cleaning/correct_5752.R")
ha_data <- correct_5752(ha_data)

# Corrections FF-7 (aka Porto Alegre 10-ha, 5754) -----------------------
source("./code_data_cleaning/correct_5754.R")
ha_data <- correct_5754(ha_data)


# standardize tag numbers ---------------------------------------

# some of the duplicates were identified in the dataset with decimals (e.g.,
# 224.1 and 224.2 were plants with duplicate tag numbers 224. This function
# removes those decimals and standardizes tag numbers. Note the plants wtill 
# have unique id numbers 

source("./code_data_cleaning/standardize_tag_numbers.R")
ha_data <- standardize_tag_numbers(ha_data)

# check for duplicate tag numbers -----------------------------

# occasionally a member of the survey team will write down or read out a 
# tag number incorrectly.  The function `detect_duplicate_plants.R` will
# identify them and save as a csv file, which will allow for 
# reviewing the original records to sort the duplicates out
# records. It will also return the demographic data file 
# with the duplicate tag numbers labeled in a new column

source("./code_data_cleaning/find_dupe_tags.R")
ha_data <- find_dupe_tags(ha_data)

# This will give you a list of the individual plants with duplicated tag 
# numbers and the plot in which they are located

# count_dupes <- ha_data %>%
#   filter(duplicate_tag == "duplicate tag number") %>%
#   group_by(tag_number, plot) %>%
#   summarize(N_plants = n_distinct(tag_number))

# simplify codes ----------------------------------------------------------
#  
# unique(ha_data$code)
# 
# # This is simply to see how many have these different codes
# ha_data %>% filter(code == "dead and not on list")
# ha_data %>% filter(code == "under branchfall, resprouting")
# ha_data %>% filter(code == "resprouting")
# ha_data %>% filter(code == "new plant in plot")
# ha_data %>% filter(code == "dried")
# ha_data %>% filter(code == "not on list")
# ha_data %>% filter(code == "ULY")
# ha_data %>% filter(code == "under branchfall")
# ha_data %>% filter(code == "under litter")
# ha_data %>% filter(code == "no tag")
# ha_data %>% filter(code == "missing")
# ha_data %>% filter(code == "under treefall")

# Find and label "ULY" plants -------------------------------------

# Sometimes the survey team simply misses established plants ("adults" that are 
# in a plot, perhaps because density is so high or it is difficult to see 
# individuals in treefalls. Sometimes plants that were marked will also lose 
# their tags - a branch could fall on them and knock it off, or it could 
# be lost in a treefall, or someone walking though the plot might have kicked
# it.  All of these plants are given a new tag, with a notation recorded in the 
# survey data sheet that they were an "adult" `plant without tag`, a 
# `new plant in plot`, or `ULY` (i.e., 'unmarked last year').

# This function: 
# (1) identifies all plants flagged as 'established plants found without a tag 
# in a survey', 
# (2) creates a csv file of these plants for follow-up review, 
# (3) identifies & creates a csv file of "ULY" plants flagged in 1999, and
# (4) removes the flag from all plants marked this way in 1999.
# Why 1999? Plots were still being completely surveyed through 99, which is why
# so many ULY were found in that year. 
# (5) Finally, this function creates a new column to 
# indicate if plants were `found_without_tag` using the logical TRUE/FALSE

source("./code_data_cleaning/code_adult_no_tag.R")
ha_data<-code_adult_no_tag(ha_data)


# Formatting columns with reproductive status  -----------

# `Infl` column is conditional: given that a plant is reproductive, 
# how many infloresences does it have?
# This function scans to make sure the entries are properly coded.

source("./code_data_cleaning/code_as_flowering.R")
ha_data<-code_as_flowering(ha_data)
# unique(ha_data$infl)

# Seedling TRUE/FALSE
# this function codes a plant as a new seedling in a given survey year (TRUE/FALSE)
source("./code_data_cleaning/code_as_sdlg.R")
ha_data<-code_as_sdlg(ha_data)

# This will confirm that all plants are correctly coded as seedling TRUE/FALSE
# unique(ha_data$recorded_sdlg)
# This will tell you how many seedlings (TRUE) were counted across all surveys
# summary(ha_data$recorded_sdlg)

# This codes the options in the branchfall / treefall column
source("./code_data_cleaning/code_treefalls.R")
ha_data<-code_treefalls(ha_data)
# This will tell you what the different types of treefall / branchfall data
# that are indicated in the dataset
# unique(ha_data$treefall_status)


# add the repro checks to code, delete notes col -----
#
# unique(ha_data$code)
# unique(ha_data$notes)
# #
# ha_data <- ha_data %>%
#   mutate(code = if_else(
#     notes %in% c("1 old infl", "2 old infl", "1 new infl + 1 old infl"),
#     notes,
#     code
#   )) %>%
#   select(-notes)


# add a column with observations of phys condition ------------------------

# sometimes the survey team took recorded notes about the physiological 
# condition of plants  (e.g. resprouting, dried up). this function creates a
# column indicating the condition of plants.

source("./code_data_cleaning/code_condition.R")
ha_data<-code_condition(ha_data)

# You can check the different conditions here
# unique(ha_data$condition)


# add column indicating if plant was found or missing in survey yr --------

# add census_status (measured/missing)

# This adds a column indicating the status of plants in each year's census
# (alive, dead, missing,NA...). It's a little more complicated than it sounds; 
# see function for details. The NA plants are duplicate tag numbers, most of 
# which have no measurments of plant size

source("./code_data_cleaning/code_census_status.R")
ha_data<-code_census_status(ha_data)

# the categories in the new `census_status` column
# unique(ha_data$census_status)
# note some plants might have measurment of ht but not shts
# ha_data %>% filter(census_status == "measured" & is.na(shts) & is.na(ht)==FALSE)
# or a measurment of shts but not ht
# ha_data %>% filter(census_status == "measured" & is.na(ht) & is.na(shts)==FALSE)


# TODO: these are plants measured but with no shts, ht, or both. look into it
# ha_data %>% filter(census_status == "measured" & is.na(shts) & is.na(ht))

# once the plants cave been assigned census status, can delete Dead from the
# 'code' column

# unique(ha_data$code)
# unique(ha_data$census_status)
# summary(as.factor(ha_data$census_status))
# names(ha_data)



# final column cleanup ----------------------------------------------------

# code column no longer needed & rename "plotID" as plot_id
ha_data <- ha_data %>% 
  select(-code) 

# Create and save a df of plot characteristics ------------------------------
# 
# source("./code_data_cleaning/create_plot_info_file.R")
# ha_plots<-create_plot_info_file(ha_data)





# This is the version of the dataset that will get uploaded to dryad

# names(ha_data)
# head(ha_data)

# 
# ha_dryad <- ha_data %>%
#   arrange(row, as.numeric(column)) %>%
#   mutate(subplot = paste(row, column, sep = "")) %>%
#   select(plotID,
#     subplot,
#     plant_id,
#     year,
#     shts,
#     ht,
#     infl,
#     code,
#     recorded_sdlg = sdlg_status,
#     found_without_tag,
#     treefall_status,
#     condition,
#     census_status,
#     tag_number
#   ) %>%
#   ungroup() %>%
#   rename(
#     "plot" = "plotID",
#   )


# TODO: checking, cleanup

# no measurements for some plots in 2000, 2003
# ha_dryad %>%
#   group_by(plot, year) %>%
#   summarize(non_na = sum(!is.na(shts))) %>%
#   filter(non_na < 5)
# 
# 
# # TODO: clarify what this is for
# test <- ha_dryad %>%
#   # select(plant_id,notes,ht,shts,infl,census_status) %>%
#   filter(is.na(ht) & is.na(shts) & is.na(infl)) %>%
#   filter(census_status == "measured")
# view(test)

# 
# # create a new DF for treefall impact
# treefall_impact <- ha_dryad %>%
#   select(plot, plant_id, year, treefall_status) %>%
#   drop_na(treefall_status)
# 
# write_csv(treefall_impact, "./data_clean/treefall_impacts.csv")
# ha_dryad


# DELETE CODE COLUMN
# unique(ha_dryad$code)
# ha_dryad <- ha_dryad %>% select(-code)
# 
# head(ha_dryad)
# glimpse(ha_dryad)
# summary(ha_dryad$infl)
# summary(ha_dryad$recorded_sdlg)
# 
# names(ha_data)



# # tag check cleanup -------------------------------------------------------
# 
# 
# tag_changes <-
#   read.csv(
#     "./data_raw/tag_changes.csv",
#     dec = ".",
#     header = TRUE,
#     sep = ",",
#     check.names = FALSE
#   ) %>% 
#   mutate(plot = case_when(
#     plot == "2107" ~ "FF-1",
#     plot == "2108" ~ "FF-2",
#     plot == "2206" ~ "FF-5",
#     plot == "5756" ~ "CF-3",
#     plot == "5750" ~ "CF-2",
#     plot == "5751" ~ "FF-3",
#     plot == "5752" ~ "FF-2",
#     plot == "5753" ~ "FF-3",
#     plot == "CF-CF" ~ "CF-6",
#     plot == "Colosso-1" ~ "FF-3",
#     plot == "Colosso-10" ~ "FF-6",
#     plot == "PA CF" ~ "CF-5",
#     plot == "PA-CF" ~ "CF-5",
#     plot == "PA1" ~ "FF-4",
#     plot == "PA-10" ~ "FF-7",
#     plot == "Dim-CF" ~ "CF-4",
#     plot == "Florestal" ~ "CF-1",
#     TRUE ~ plot
#   )) %>% 
#   left_join(ha_plots) %>% 
#   select(-yr_isolated) %>% 
#   as_tibble() %>% 
#   arrange(plot,old_tag_no,year) %>% 
#   relocate("ranch","habitat", "bdffp_no",.before="year") 


# Save the files ----------------------------------------------------------

write_csv(ha_data, "./data_clean/heliconia_data_clean.csv")

x<-"\n
    ------------------------------------------------------------------
    The raw Heliconia census data have been merged, cleaned, and 
    organized. You may now proceed to prepare the dataset for
    uploading to Dryad.
    
    A csv file of this dataset has been saved as `heliconia_data_clean.csv`. 
    ------------------------------------------------------------------
    \n"

writeLines(x)   



# write_csv(ha_dryad, "./data_clean/HDP_1998_2009.csv")
# 
# write_csv(ha_plots, "./data_clean/HDP_plots.csv")

# write_csv(tag_changes, "./data_clean/tag_changes.csv")

# write_csv(treefall_impact, "./data_clean/treefall_impacts.csv")

return(ha_data)
}