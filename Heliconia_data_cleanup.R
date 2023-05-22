
# Code Overview -----------------------------------------------------------

# Code to conduct the analyses and generate the figures in:
# Script created by Emilio M. Bruna, embruna@ufl.edu
# Script created in R version 3.3.1

# Load libraries ----------------------------------------------------------

library(tidyverse)
library(readxl)

# LOAD RAW DEMOGRAPHIC DATA ----------------------------------------------

# load the CSV file of demographic data

ha_data <-
  read.csv(
    "./data_raw/Hacuminata_98-09_12oct2016.csv",
    dec = ".",
    header = TRUE,
    sep = ",",
    check.names = FALSE
  )

# convert column names to lower case
names(ha_data) <- tolower(names(ha_data))

# some of the column names were the same for each survey year, 
# so they were made unique and then corrected

# make duplicate column names unique
names(ha_data) <- make.unique(names(ha_data), sep = "_")
# names(ha_data)

# rename columns with duplicate names
ha_data <- ha_data %>% rename(
  "habitat" = "size",
  "plant_id_07" = "plantid",
  "row_07" = "row_1",
  "column_07" = "col",
  "x_08" = "x",
  "y_08" = "y",
  "plant_id_08" = "plantid_1",
  "row_08" = "row_2",
  "column_08" = "col_1",
  "x_09" = "x_1",
  "y_09" = "y_1",
  "code_to_eb" = "notes to emilio"
)
names(ha_data)

# correct each the data type of each column
str(ha_data)
ha_data <-
  ha_data %>%
  mutate(across(starts_with("notes_"), as.character)) %>%
  mutate(across(starts_with("ht_"), as.double)) %>%
  mutate(column = as.character(column))


# Convert the names of the ranches to a 3 letter code
ha_data <- ha_data %>%
  mutate(ranch = str_replace_all(
    ranch,
    c("PortoAlegre" = "PAL", "Esteio-Colosso" = "EST", "Dimona" = "DIM")
  )) %>%
  # clean up the names of plots
  mutate(plot = str_replace_all(
    plot,
    c(
      "Dimona CF" = "Dimona-CF",
      "PA-CF" = "PortoAlegre-CF",
      "Cabo Frio" = "CaboFrio-CF",
      "Florestal" = "Florestal-CF"
    )
  ))

# unique(ha_data$ranch)
# unique(ha_data$plot)



# LOAD PLOT DESCRIPTORS & ADD THEM TO DEMOG DATA --------------------------

plot_info <-
  read_csv("./data_raw/heliconia_plot_descriptors.csv") %>%
  select(plotID = habitat_type...1, plot = HDP_plot_ID_no)

# add plot descriptors to demographic data
ha_data <- left_join(ha_data, plot_info, by = "plot")

# names(ha_data)
# names(plot_info)
# str(ha_data)

# delete the plot-level data from the environment
rm(plot_info)


# CLEANING UP THE DATA ----------------------------------------------------

# delete unnecessary columns
ha_data <- ha_data %>% select(
  -plant_id_07,
  -row_07,
  -column_07,
  -plant_id_08,
  -row_08,
  -column_08,
  -code_to_eb,
  -x_08,
  -y_08
)

# Convert from wide to long format

ha_data <- ha_data %>%
  pivot_longer(
    cols = starts_with(c("shts_", "ht_", "infl_", "notes_")),
    names_to = c(".value", "year"),
    names_sep = "_"
  ) %>%
  mutate(year = as.numeric(year))


# merge the PA10 data -----------------------------------------------------

# The data from Porto Alegre's 10-ha fragment were in a different CSV file.
# They were cleaned up and merged with the rest of the demographic data 
# with the function `merge_with_PA10.R`  

source("./code_data_cleaning/merge_with_PA10.R")
ha_data <- merge_with_PA10(ha_data)


# clean up codes column ----------------------------------------------------

# The survey team often recorded observations about individual plants or
# the conditions in plots. These were entered as numberical codes. The 
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

# correct "zombie plants"  ------------------------------------------------

# Zombie Plants are plants that were marked dead in year t but with 
# a measurement of shts or ht in a subsequent year, indicating they had 
# lost above-ground parts but were still alive. This function identifies
# them, corrects those that are simple to correct, and then saves a csv
# file with those that should be reviewed in the original records and corrected
# in the correction file.
# A message will be provided if there are no zombies in the dataset

source("./code_data_cleaning/find_zombies.R")
zombie_summary <- find_zombies(ha_data)

# If there are zombies, un-commented the code below to see how many are found 
# in each plot

# zombies %>%
#   group_by(habitat, plot) %>%
#   summarize(N_plants = n_distinct(plant_id)) %>%
#   arrange(habitat, desc(N_plants))

# check for duplicate id numbers -----------------------------

# This will verify that there are no duplicate ID numbers 

source("./code_data_cleaning/find_dupe_id.R")
initial_dupes <- find_dupe_id(ha_data)
# initial_dupes


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

# Identify 'ULY' plants and save to csv file -----------------

# NOTE plots were still being completely surveyed through 99, which is why so
# many ULY - most were from that year. We want to focus on those AFTER the
# initial survey sweep so lets instead mark uly only after 1999
source("./code_data_cleaning/find_uly.R")
uly_summary<-find_uly(ha_data)


# recoding post 1999 ULY --------------------------------------------------


# These are the ULY plants marked after 1999 (by which time plots had been 
# surveyed quite a bit and so would expect very few
ULYs_post99 <-
  ha_data %>%
  filter(code == "no tag" | code == "ULY" | code == "new plant in plot") %>%
  filter(year > 1999) %>%
  arrange(notes, plot, year, tag_number) %>%
  select(-ht, -shts, -infl, -x_09, -y_09)
# write_csv(ULYs_post99, "./data_check/ULY_plants_post1999.csv")

# Summary of the post-1999 ULYs
ULYs_post99_summary <- ULYs_post99 %>%
  # group_by(plot, year, row, column) %>%
  # group_by(plot, year) %>%
  group_by(plot) %>%
  summarize(n = n()) %>%
  arrange(desc(n))
ULYs_post99_summary

# Remove the ULY code from plants in 1999
ha_data <- ha_data %>%
  mutate(code = if_else((code == "ULY" & year == 1999), NA_character_, code))

# Save CSV of plants that were not on the survey list ---------------------

# Sometimes the team conducting the survey will find a plant that is not on the 
# list of plants to be recorded. This is usually because it was marked dead 
# in a previous year but re-sprouted. (This is why we leave plants with their 
# numbered stake until they have been recorded "dead" >1 time).
# 
# This function will find any any that were not on the survey list and save
# them in a csv file to allow going back through surveys and clear it update

source("./code_data_cleaning/find_not_listed.R")
not_listed_summary<-find_not_listed(ha_data)


# Formatting columns identifying seedlings and reproductive plants -----------

# No. of Inflorescences
# `Infl` column is conditional: given that a plant is reproductive, 
# how many infloresences does it have?
# This function scans to make sure the entries are properly coded.

source("./code_data_cleaning/code_as_flowering.R")
ha_data<-code_as_flowering(ha_data)


# Seedling TRUE/FALSE
# this function codes a plant as a new seedling in a given survey year (TRUE/FALSE)
source("./code_data_cleaning/code_as_sdlg.R")
ha_data<-code_as_sdlg(ha_data)

# This will confirm that all plants are correctly coded as seedling TRUE/FALSE
# unique(ha_data$sdlg_status)
# This will tell you how many seedlings (TRUE) were counted across all surveys
# summary(ha_data$sdlg_status)

# This codes the options in the branchfall / treefall column
source("./code_data_cleaning/code_treefalls.R")
ha_data<-code_treefalls(ha_data)
# This will tell you what the different types of treefall / branchfall data
# that are indicated in the dataset
# unique(ha_data$treefall_status)



# indicated plants marked as "adults" -------------------------------------


# Sometimes the survey team simply misses established plants that are in a
# plot, perhaps because density is so high or it is difficult to see 
# individuals in treefalls. This function adds a column indicating if 
# plants were 'adults" found without a tag. 
# In the surveys there might be coded as `ULY`,`new plant in plot` or similar.
# 
# Sometimes plants will also lose their tags - a branch could fall on them
# knowing it off, or it could be lost in a treefall. These are also identified 
# in the survey (`plant without tag`), given a new number, and also labeled as 
# a being marked as an adult.

# You can see the codes that will be flagged with this column here: 
# unique(ha_data$code)

source("./code_data_cleaning/code_marked_as_adults.R")
ha_data<-code_marked_as_adults(ha_data)

# Confirm that all values in this column are either TRUE or FALSE
# unique(ha_data$found_without_tag)
# See how many were marked as adult plants without a tag
# summary(ha_data$found_without_tag)

# add the repro checks to code, delete notes col -----
#
# unique(ha_data$code)
# unique(ha_data$notes)
#
ha_data <- ha_data %>%
  mutate(code = if_else(
    notes %in% c("1 old infl", "2 old infl", "1 new infl + 1 old infl"),
    notes,
    code
  )) %>%
  select(-notes)


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
ha_data %>% filter(census_status == "measured" & is.na(shts) & is.na(ht))

# once the plants cave been assigned census status, can delete Dead from the
# 'code' column

# unique(ha_data$code)
# unique(ha_data$census_status)
# summary(as.factor(ha_data$census_status))
# names(ha_data)



# Create and save a df of plot characteristics ------------------------------
# 
# source("./code_data_cleaning/create_plot_info_file.R")
# ha_plots<-create_plot_info_file(ha_data)





# This is the version of the dataset that will get uploaded to dryad

names(ha_data)
head(ha_data)

ha_dryad <- ha_data %>%
  arrange(row, as.numeric(column)) %>%
  mutate(subplot = paste(row, column, sep = "")) %>%
  select(plotID,
    subplot,
    plant_id,
    year,
    shts,
    ht,
    infl,
    code,
    recorded_sdlg = sdlg_status,
    found_without_tag,
    treefall_status,
    condition,
    census_status,
    tag_number
  ) %>%
  ungroup() %>%
  rename(
    "plot" = "plotID",
  )


# TODO: checking, cleanup

# no measurements for some plots in 2000, 2003
ha_dryad %>%
  group_by(plot, year) %>%
  summarize(non_na = sum(!is.na(shts))) %>%
  filter(non_na < 5)


# TODO: clarify what this is for
test <- ha_dryad %>%
  # select(plant_id,notes,ht,shts,infl,census_status) %>%
  filter(is.na(ht) & is.na(shts) & is.na(infl)) %>%
  filter(census_status == "measured")
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
unique(ha_dryad$code)
ha_dryad <- ha_dryad %>% select(-code)
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


# write_csv(ha_dryad, "./data_clean/HDP_1998_2009.csv")
# 
# write_csv(ha_plots, "./data_clean/HDP_plots.csv")

# write_csv(tag_changes, "./data_clean/tag_changes.csv")

# write_csv(treefall_impact, "./data_clean/treefall_impacts.csv")
