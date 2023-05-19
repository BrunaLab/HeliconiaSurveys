
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
# the conditions in plots. These are standardized with function `clean_codes.R`

source("./code_data_cleaning/clean_codes.R")
ha_data <- clean_codes(ha_data)

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


# correct & standardize tag numbers ---------------------------------------

# round down the duplicate numbers with decimals 
# (the plant_ids are unique)
ha_data$tag_number <- floor(ha_data$tag_number)
ha_data$tag_number <- as.integer(ha_data$tag_number)

# correction - x/y coordinates and row/col--------------------------------

# some of the errors in plant location (Row/Column) corrected below found
# by ES, see https://github.com/BrunaLab/HeliconiaDemography/issues/5

# correct "zombie plants"  ------------------------------------------------

# Zombie Plants are plants that were marked dead in year t but with 
# a measurement of shts or ht in a subsequent year, indicating they had 
# lost above-ground parts but were still alive. This function identifies
# them, corrects those that are simple to correct, and then saves a csv
# file with those that should be reviewed in the original records and corrected
# in the correction file.
# A message will be provided if there are no zombies in the dataset

source("./code_data_cleaning/find_zombies.R")
zombies <- find_zombies(ha_data)

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

# This will give you a list of the individual duplicated tag numbers and
# the plot in which they are located
# 
# count_dupes <- ha_data %>%
#   filter(duplicate_tag == "duplicate tag number") %>%
#   group_by(tag_number, plot) %>%
#   summarize(N_plants = n_distinct(tag_number))

# simplify codes ----------------------------------------------------------

unique(ha_data$code)

# This is simply to see how many have these different codes
ha_data %>% filter(code == "dead and not on list")
ha_data %>% filter(code == "under branchfall, resprouting")
ha_data %>% filter(code == "resprouting")
ha_data %>% filter(code == "new plant in plot")
ha_data %>% filter(code == "dried")
ha_data %>% filter(code == "not on list")
ha_data %>% filter(code == "ULY")
ha_data %>% filter(code == "under branchfall")
ha_data %>% filter(code == "under litter")
ha_data %>% filter(code == "no tag")
ha_data %>% filter(code == "missing")
ha_data %>% filter(code == "under treefall")

# Pull out 'ULY'; save to csv file -----------------

# NOTE plots were still being completely surveyed through 99, which is why so
# many ULY - most were from that year. We want to focus on those AFTER the
# initial survey sweep so lets instead mark uly only after 1999


# TODO: Move this over to the in-progress corrections
ULYs <-
  ha_data %>%
  filter(code == "no tag" | code == "ULY" | code == "new plant in plot") %>%
  arrange(notes, plot, year, tag_number) %>%
  select(-ht, -shts, -infl, -x_09, -y_09, -notes)

summary(as.factor(ULYs$code == ULYs$notes))

write_csv(ULYs, "./data_check/uly_heliconia.csv")

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

# TODO: Move this over to the in-progress corrections
Not_on_SurveyList <-
  ha_data %>%
  filter(code == "not on list" |
    code == "dead and not on list") %>%
  arrange(plot, tag_number)

unique(Not_on_SurveyList$code)
unique(Not_on_SurveyList$notes)

# write_csv(
#   Not_on_SurveyList,
#   "./data_check/Not_on_List_plants.csv"
# )

# ha_data midway ----------------------------------------------------------

#  this is just here so don't have to clean from step one every time
# ha_data_original <- ha_data
# ha_data<-ha_data_original

# Additional columns for the data paper ---------------------------------

# Infl column is conditional - if repro, how many infl.
# Any that are 0 need to be changed to NA
ha_data <- ha_data %>%
  mutate(infl = replace(infl, infl == 0, NA))

# Seedling (T/F) column
ha_data <-
  ha_data %>%
  mutate(sdlg_status = if_else(code == "sdlg", TRUE, FALSE)) %>%
  mutate(sdlg_status = if_else(is.na(sdlg_status), FALSE, sdlg_status))
unique(ha_data$sdlg_status)
summary(ha_data$sdlg_status)

# branchfall / treefall column
ha_data <- ha_data %>%
  mutate(treefall_status = if_else(
    code %in% c("under branchfall", "under treefall", "under branchfall, resprouting", "under litter"),
    code,
    NA_character_
  )) %>%
  mutate(treefall_status = replace(treefall_status, treefall_status == "under branchfall, resprouting", "under branchfall"))

unique(ha_data$treefall_status)


# add column to note if recruited as adult (uly,new tag, etc)
# unique(ha_data$code)

ha_data <- ha_data %>%
  mutate(found_without_tag = if_else(
    code %in% c("no tag", "plant without tag", "new plant in plot", "ULY"),
    TRUE,
    # else:
    FALSE
  ))

# unique(ha_data$found_without_tag)
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


# add column to check condition (resprouting, dried)
unique(ha_data$code)
ha_data <- ha_data %>%
  mutate(condition = case_when(
    code == "dried" ~ "dried",
    code %in% c("under branchfall, resprouting", "resprouting") ~ "resprouting",
    # else
    TRUE ~ NA_character_
  ))

unique(ha_data$condition)

# add census_status (measured/missing)

# unique(ha_data$code)
ha_data <- ha_data %>%
  mutate(census_status = case_when(
    (ht >= 0 | shts >= 0 | infl > 0) ~ "measured", # anything with a measurement is alive
    code == "sdlg" ~ "measured", # new seedlings are alive, even if no ht or sht measurment
    code %in% c("dead", "dead and not on list") ~ "dead", # anything dead is dead
    # code %in% c("sdlg","no tag","plant_no_tag", "ULY","new plant in plot") ~ "new",
    code == "missing" ~ "missing", # in some years plants were marked missing
    TRUE ~ NA_character_ # anything not measured or marked "missing", "dead" or "seedling" is NA
  )) %>%
  group_by(plot, plant_id) %>%
  # fill in the rows down. Any "missing will be recorded as missing until
  # they bump up against another category (dead, measured). Dead will be
  # filled in as dead until the last year of census
  fill(census_status, .direction = "down") %>%
  arrange(plot, plant_id, year)

unique(ha_data$census_status)


# Now keep only those alive, missing, and the first year marked dead
ha_measured <- ha_data %>% filter(census_status == "measured")
ha_missing <- ha_data %>% filter(census_status == "missing")
ha_na <- ha_data %>% filter(is.na(census_status))
ha_na <- ha_na %>% filter(!is.na(duplicate_tag))
ha_dead <- ha_data %>%
  filter(census_status == "dead") %>%
  arrange(plot, plant_id, year) %>%
  group_by(plot, plant_id) %>%
  filter(row_number() == 1)

ha_data <- bind_rows(ha_measured, ha_na, ha_dead, ha_missing) %>%
  arrange(plot, plant_id, year)


# Some that were NA in all measurements but were duplicate tag numbers weren't getting marked
# as NA instead of missing in census_status so this takes care of that
ha_data <- ha_data %>%
  mutate(
    census_status = case_when(
      census_status == "measured" &
        is.na(ht) &
        is.na(shts) &
        is.na(infl) &
        is.na(code) &
        is.na(duplicate_tag) ~ "missing",
      TRUE ~ census_status
    ) # anything not measured or marked "missing", "dead" or "seedling" is NA
  )

## The ones under treefalls coming back "measured"
ha_data <- ha_data %>%
  mutate(
    census_status = case_when(
      is.na(ht) &
        is.na(shts) &
        is.na(infl) &
        census_status == "measured" &
        (treefall_status == "under treefall" |
          treefall_status == "under branchfall") ~ "missing",
      TRUE ~ census_status
    ) # anything not measured or marked "missing", "dead" or "seedling" is NA
  )

unique(ha_data$census_status)


# this gets any left that were coming back as "missing" even after marked "dead"
ha_data <-
  ha_data %>%
  group_by(plant_id) %>%
  mutate(
    blank_yr_delete = if_else(lag(census_status, 1) == "dead", "delete", NA_character_),
    .before = "code"
  ) %>%
  fill(blank_yr_delete, .direction = "down") %>%
  filter(is.na(blank_yr_delete) == TRUE) %>%
  select(-blank_yr_delete) %>%
  ungroup()


# TODO: these are plants measured but with no shts, ht, or both. look into it
ha_data %>% filter(census_status == "measured" & is.na(shts) & is.na(ht))
ha_data %>% filter(census_status == "measured" & is.na(shts))
ha_data %>% filter(census_status == "measured" & is.na(ht))
# once the plants cave been assigned census status, can delete Dead from the
# 'code' column

ha_data <- ha_data %>%
  mutate(code = replace(code, code == "dead", NA)) %>%
  mutate(code = replace(code, code == "dried", NA)) %>%
  mutate(code = replace(code, code == "under branchfall", NA)) %>%
  mutate(code = replace(code, code == "under branchfall, resprouting", NA)) %>%
  mutate(code = replace(code, code == "under litter", NA)) %>%
  mutate(code = replace(code, code == "under treefall", NA)) %>%
  mutate(code = replace(code, code == "resprouting", NA)) %>%
  mutate(code = replace(code, code == "missing", NA)) %>%
  mutate(code = replace(code, code == "2x in field", NA)) %>%
  mutate(code = replace(code, code == "sdlg", NA))

unique(ha_data$code)
unique(ha_data$census_status)
summary(as.factor(ha_data$census_status))
names(ha_data)

ha_data %>% filter(census_status == "measured" & is.na(shts))

# dataset for dryad -------------------------------------------------------

# Create a df of plot characteristics

# these are the years each fragment was isolated
isolation <- tibble(
  "bdffp_no" = c(2107, 2108, 1104, 3114, 2206, 1202, 3209),
  "yr_isolated" = c(1984, 1984, 1980, 1983, 1984, 1980, 1983)
) %>%
  mutate(across(where(is.double), as.factor))

# select the plot id variables
ha_plots <- ha_data %>%
  select(
    "plotID",
    "habitat",
    "ranch",
    "bdffp_reserve_no"
  ) %>%
  distinct() %>%
  arrange(plotID) %>%
  mutate(ranch = recode_factor(ranch, "PortoAlegre" = "porto alegre")) %>%
  mutate(ranch = recode_factor(ranch, "DIM" = "dimona")) %>%
  mutate(ranch = recode_factor(ranch, "PAL" = "porto alegre")) %>%
  mutate(ranch = recode_factor(ranch, "EST" = "esteio")) %>%
  mutate(habitat = recode_factor(habitat, "1-ha" = "one")) %>%
  mutate(habitat = recode_factor(habitat, "10-ha" = "ten")) %>%
  mutate(habitat = recode_factor(habitat, "CF" = "forest")) %>%
  mutate(bdffp_reserve_no = replace(bdffp_reserve_no, bdffp_reserve_no == "none", NA)) %>%
  rename(
    "bdffp_no" = "bdffp_reserve_no",
    "plot" = "plotID"
  ) %>%
  left_join(isolation)
ha_plots

# This is the version of the dataset that will get uploaded to dryad

names(ha_data)
head(ha_data)
# unique(ha_data$code)
# any(ha_data$code %in% c("sdlg", "under branchfall", "under litter", "under treefall"))
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
  mutate(code = case_when(
    code == "resprouting" ~ "resprouting",
    code == "dried" ~ "dried",
    code == "ULY" ~ "ULY",
    code == "new plant in plot" ~ "ULY",
    code == "not on list" ~ "NOL",
    code == "dead and not on list" ~ "NOL",
    TRUE ~ code
  )) %>%
  mutate(treefall_status = case_when(
    treefall_status == "under branchfall" ~ "branch",
    treefall_status == "under treefall" ~ "tree",
    treefall_status == "under litter" ~ "litter",
    TRUE ~ treefall_status
  )) %>%
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


# create a new DF for treefall impact
treefall_impact <- ha_dryad %>%
  select(plot, plant_id, year, treefall_status) %>%
  drop_na(treefall_status)

# ha_dryad


# DELETE CODE COLUMN
ha_dryad <- ha_dryad %>% select(-code)
# 
# head(ha_dryad)
# glimpse(ha_dryad)
# summary(ha_dryad$infl)
# summary(ha_dryad$recorded_sdlg)
# 
# names(ha_data)



# tag check cleanup -------------------------------------------------------


tag_changes <-
  read.csv(
    "./data_raw/tag_changes.csv",
    dec = ".",
    header = TRUE,
    sep = ",",
    check.names = FALSE
  ) %>% 
  mutate(plot = case_when(
    plot == "2107" ~ "FF-1",
    plot == "2108" ~ "FF-2",
    plot == "2206" ~ "FF-5",
    plot == "5756" ~ "CF-3",
    plot == "5750" ~ "CF-2",
    plot == "5751" ~ "FF-3",
    plot == "5752" ~ "FF-2",
    plot == "5753" ~ "FF-3",
    plot == "CF-CF" ~ "CF-6",
    plot == "Colosso-1" ~ "FF-3",
    plot == "Colosso-10" ~ "FF-6",
    plot == "PA CF" ~ "CF-5",
    plot == "PA-CF" ~ "CF-5",
    plot == "PA1" ~ "FF-4",
    plot == "PA-10" ~ "FF-7",
    plot == "Dim-CF" ~ "CF-4",
    plot == "Florestal" ~ "CF-1",
    TRUE ~ plot
  )) %>% 
  left_join(ha_plots) %>% 
  select(-yr_isolated) %>% 
  as_tibble() %>% 
  arrange(plot,old_tag_no,year) %>% 
  relocate("ranch","habitat", "bdffp_no",.before="year") 


# Save the files ----------------------------------------------------------


write_csv(ha_dryad, "./data_clean/HDP_1998_2009.csv")

write_csv(ha_plots, "./data_clean/HDP_plots.csv")

write_csv(tag_changes, "./data_clean/tag_changes.csv")

write_csv(treefall_impact, "./data_clean/treefall_impacts.csv")
