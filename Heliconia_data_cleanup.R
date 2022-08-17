
# Code Overview -----------------------------------------------------------
# Code to conduct the analyses and generate the figures in:
# Script created by Emilio M. Bruna, embruna@ufl.edu
# Script created in R version 3.3.1

# Load libraries ----------------------------------------------------------
library(tidyverse)
library(readxl)

# DATA ENTRY AND NAME CLEANUP ---------------------------------------------

# load the CSV file

ha_data <-
  read.csv(
    "./data_raw/Hacuminata_98-09_12oct2016.csv",
    dec = ".",
    header = TRUE,
    sep = ",",
    check.names = FALSE
  )

# make the column names lower case
names(ha_data) <- tolower(names(ha_data))
names(ha_data) <- make.unique(names(ha_data), sep = "_")
names(ha_data)
# rename the columns that have duplicate names
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


# correct the data types assigned to each
str(ha_data)
ha_data <-
  ha_data %>%
  mutate(across(starts_with("notes_"), as.character)) %>%
  mutate(across(starts_with("ht_"), as.double)) %>%
  mutate(column = as.character(column))


# Convert the names of ranches to 3 letter codes
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
# 
# unique(ha_data$ranch)
# unique(ha_data$plot)

plot_info <-
  read_csv("./data_raw/heliconia_plot_descriptors.csv") %>%
  select(plotID = habitat_type...1, plot = HDP_plot_ID_no)
ha_data <- left_join(ha_data, plot_info, by = "plot")

names(ha_data)
names(plot_info)
rm(plot_info)
str(ha_data)

# DATA CLEANING -----------------------------------------------------------

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
source("./code_data_cleaning/merge_with_PA10.R")
ha_data <- merge_with_PA10(ha_data)
names(ha_data)

# to match up file from PA with others need to do the following:
ha_data <- ha_data %>% rename("code" = "notes")

# a few values for x_09 were entered with a comma instead of decimal
ha_data$x_09 <- as.numeric(gsub("[\\,;]", "\\.", ha_data$x_09))

# clean up codes/notes ----------------------------------------------------
source("./code_data_cleaning/clean_codes.R")
ha_data <- clean_codes(ha_data)

# Add a unique plant_id index number for each plant -----------------------
# adding the plant id number here means any edits below will not alter
# the plant id number--important for changes made after published to Dryad.
ha_data <- ha_data %>%
  group_by(plot, row, column, tag_number) %>%
  mutate(plant_id = cur_group_id(), .before = 1)


# corrections 5750 --------------------------------------------------------
source("./code_data_cleaning/correct_5750.R")
ha_data <- correct_5750(ha_data)

# corrections 5756 --------------------------------------------------------
source("./code_data_cleaning/correct_5756.R")
ha_data <- correct_5756(ha_data)

# Corrections 5753 --------------------------------------------------------
source("./code_data_cleaning/correct_5753.R")
ha_data <- correct_5753(ha_data)

# Corrections 5754 --------------------------------------------------------
source("./code_data_cleaning/correct_5754.R")
ha_data <- correct_5754(ha_data)

# Corrections 5751 --------------------------------------------------------
source("./code_data_cleaning/correct_5751.R")
ha_data <- correct_5751(ha_data)

# Corrections 2108 --------------------------------------------------------
source("./code_data_cleaning/correct_2108.R")
ha_data <- correct_2108(ha_data)

# Corrections 2206 --------------------------------------------------------
source("./code_data_cleaning/correct_2206.R")
ha_data <- correct_2206(ha_data)

# Corrections 2107 --------------------------------------------------------
source("./code_data_cleaning/correct_2107.R")
ha_data <- correct_2107(ha_data)

# Corrections 5752  -------------------------------------------------------
source("./code_data_cleaning/correct_5752.R")
ha_data <- correct_5752(ha_data)

# corrections - Florestal -------------------------------------------------
source("./code_data_cleaning/correct_florestal.R")
ha_data <- correct_florestal(ha_data)

# Corrections - Porto Alegre CF -------------------------------------------
source("./code_data_cleaning/correct_pa_cf.R")
ha_data <- correct_pa_cf(ha_data)

# Corrections Dimona-CF ---------------------------------------------------
source("./code_data_cleaning/correct_dimona_cf.R")
ha_data <- correct_dimona_cf(ha_data)

# Corrections CaboFrio-CF -------------------------------------------------
source("./code_data_cleaning/correct_cabofrio_cf.R")
ha_data <- correct_cabofrio_cf(ha_data)

# correct & standardize tag numbers ---------------------------------------
# round down the duplicate numbers with decimals
# (the plant_ids are unique)
ha_data$tag_number <- floor(ha_data$tag_number)
ha_data$tag_number <- as.integer(ha_data$tag_number)

# correction - x/y coordinates and row/col--------------------------------
# some of the errors in plant location (Row/Column) corrected below found
# by ES, see https://github.com/BrunaLab/HeliconiaDemography/issues/5

# correct zombie plants  --------------------------------------------------

# Zombie Plants = marked dead in year t but with measurement of shts or ht
# in a subsequent year, indicating they had lost above-ground parts
# but were still alive

source("./code_data_cleaning/find_zombies.R")
zombies <- find_zombies(ha_data)
zombies %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(plant_id)) %>%
  arrange(habitat, desc(N_plants))

# check for duplicate id and tag numbers -----------------------------

# ID Numbers 
check_dupes <- function(ha_data) {
  ha_data %>%
    group_by(year, plant_id) %>%
    count() %>%
    filter(n > 1) %>%
    pull(plant_id) %>%
    unique()
}
initial_dupes <- check_dupes(ha_data)
initial_dupes <- ha_data %>% filter(plant_id %in% initial_dupes)
initial_dupes
# tag numbers
source("./code_data_cleaning/detect_duplicate_plants.R")
dupes <- detect_duplicate_plants(ha_data)
dupes %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(plant_id)) %>%
  arrange(habitat, desc(N_plants)) %>%
  filter(habitat != "")

duplicate_tags <- dupes %>%
  select(tag_number, plot) %>%
  group_by(tag_number, plot) %>%
  slice(1) %>%
  filter(tag_number > 0) %>%
  arrange(plot)
duplicate_tags

duplicate_tags$tag_number <- as.numeric(duplicate_tags$tag_number)
duplicate_tags$duplicate_tag <- "duplicate tag number"
ha_data <- left_join(ha_data, duplicate_tags)
names(ha_data)

count_dupes <- ha_data %>%
  filter(duplicate_tag == "duplicate tag number") %>%
  group_by(tag_number, plot) %>%
  summarize(N_plants = n_distinct(tag_number))
nrow(duplicate_tags) == nrow(count_dupes)

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

###
# TODO: Move this over to the in-progress corrections
ULYs <-
  ha_data %>%
  filter(code == "no tag" | code == "ULY" | code == "new plant in plot") %>%
  arrange(notes, plot, year, tag_number) %>%
  select(-ht, -shts, -infl, -x_09, -y_09,-notes)

summary(as.factor(ULYs$code==ULYs$notes))

write_csv(ULYs, "./data_check/uly_heliconia.csv")
# 
ULYs_post99 <-
  ha_data %>%
  filter(code == "no tag" | code == "ULY" | code == "new plant in plot") %>%
  filter(year > 1999) %>%
  arrange(notes, plot, year, tag_number) %>%
  select(-ht, -shts, -infl, -x_09, -y_09)
# write_csv(ULYs_post99, "./data_check/ULY_plants_post1999.csv")

ULYs_post99_summary <- ULYs_post99 %>%
  # group_by(plot, year, row, column) %>%
  # group_by(plot, year) %>%
  group_by(plot) %>%
  summarize(n = n()) %>%
  arrange(desc(n))
ULYs_post99_summary
###
# GO AHEAD AND DELETE THE ULY CODE FOR PLANTS AFTER 1999
ha_data <- ha_data %>%
  mutate(code = if_else((code == "ULY" & year == 1999), NA_character_, code))

# # Pull out 'Miscellaneous observations'; save to csv file -----------------
# summary(as.factor(ha_data$code))
# MISC_OBS <-
#   ha_data %>%
#   filter(
#     code == "dried" |
#       code == "under litter" |
#       code == "2x in field" |
#       code == "under branchfall" |
#       code == "resprouting" |
#       code == "under branchfall, resprouting" |
#       code == "under treefall" |
#       code == "90, 10" |
#       is.na(notes) == FALSE
#   ) %>%
#   arrange(notes, plot, year, tag_number) %>%
#   select(-ht, -shts, -infl, -x_09, -y_09)
# unique(MISC_OBS$code)
# unique(MISC_OBS$notes)
# write_csv(MISC_OBS, "./data_clean/misc_observations.csv")

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

# any_code <-
#   ha_data %>%
#   filter(!is.na(code)) %>%
#   filter(!code == "missing") %>%
#   filter(!code == "sdlg") %>%
#   filter(!code == "dead") %>%
#   filter(!code == "under branchfall") %>%
#   filter(!code == "under branchfall, resprouting") %>%
#   filter(!code == "under litter") %>%
#   filter(!code == "under treefall") %>%
#   filter(!code == "resprouting") %>%
#   filter(!code == "dried") %>%
#   arrange(code, plot, tag_number, year) %>%
#   select(-notes, -x_09, -y_09, -ranch, -plotID, -bdffp_reserve_no, -plant_id)
# 
# # any_code$code <- droplevels(any_code$code)
# unique(any_code$code)
# write_csv(any_code, "./data_check/any_code.csv")
# write_csv(ULYs, "./data_check/ULY_plants.csv")

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
unique(ha_data$code)

ha_data <- ha_data %>%
  mutate(found_without_tag = if_else(
    code %in% c("no tag", "plant without tag", "new plant in plot", "ULY"),
    TRUE,
    # else:
    FALSE
  ))

unique(ha_data$found_without_tag)
summary(ha_data$found_without_tag)

# add the repor checks to code, delete notes col -----
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

# %>% 
#   mutate(census_status = case_when(
#     (year == 2003 & plotID== "CF-6") ~ "no_census", # missing a census in these years 
#     (year == 2000 & (plotID== "CF-4"|plotID== "CF-5"|plotID== "CF-6")) ~ "no_census", # missing a census in these years 
#     ((year == 2008 |year == 2009) & (plotID== "FF-5"|plotID== "FF-6"|plotID== "FF-7")) ~ "no_census", # missing a census in these years 
#     TRUE ~ census_status # anything not measured or marked "missing", "dead" or "seedling" is NA
#   ))

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
    .before = 'code'
  ) %>%
  fill(blank_yr_delete, .direction ="down") %>%
  filter(is.na(blank_yr_delete)==TRUE) %>% 
  select(-blank_yr_delete) %>% 
  ungroup()


# TODO: these are plants measured bit with no shts, ht, or both. look into it
ha_data %>% filter(census_status=="measured"&is.na(shts)&is.na(ht))
ha_data %>% filter(census_status=="measured"&is.na(shts))
ha_data %>% filter(census_status=="measured"&is.na(ht))
# once the plants cave been assigned census status, can delete Dead from the
# 'code' column

ha_data<-ha_data %>%
  mutate(code=replace(code, code=="dead",NA)) %>% 
  mutate(code=replace(code, code=="dried",NA)) %>% 
  mutate(code=replace(code, code=="under branchfall",NA)) %>%
  mutate(code=replace(code, code=="under branchfall, resprouting",NA)) %>%
  mutate(code=replace(code, code=="under litter",NA)) %>%
  mutate(code=replace(code, code=="under treefall",NA)) %>%
  mutate(code=replace(code, code=="resprouting",NA)) %>%
  mutate(code=replace(code, code=="missing",NA)) %>%
  mutate(code=replace(code, code=="2x in field",NA)) %>% 
  mutate(code=replace(code, code=="sdlg",NA)) 

unique(ha_data$code)
unique(ha_data$census_status)
summary(as.factor(ha_data$census_status))
names(ha_data)

ha_data %>% filter(census_status=="measured"&is.na(shts))

# wide form to make it easier to search for ULY matches -------------------
#
# wide_ha_data <- ha_data %>%
#   select(
#     plot,
#     row,
#     column,
#     plant_id,
#     tag_number,
#     year,
#     shts,
#     ht,
#     infl,
#     code
#   ) %>%
#   pivot_wider(names_from = year, values_from = c("shts", "ht", "infl", "code")) %>%
#   relocate(contains("_1998"), .after = column) %>%
#   relocate(contains("_1999"), .after = code_1998) %>%
#   relocate(contains("_2000"), .after = code_1999) %>%
#   relocate(contains("_2001"), .after = code_2000) %>%
#   relocate(contains("_2002"), .after = code_2001) %>%
#   relocate(contains("_2003"), .after = code_2002) %>%
#   relocate(contains("_2004"), .after = code_2003) %>%
#   relocate(contains("_2005"), .after = code_2004) %>%
#   relocate(contains("_2006"), .after = code_2005) %>%
#   relocate(contains("_2007"), .after = code_2006) %>%
#   relocate(contains("_2008"), .after = code_2007) %>%
#   arrange(
#     plot,
#     row,
#     column,
#     tag_number,
#     code_1999,
#     shts_1998,
#     shts_1999,
#     shts_2000,
#     shts_2001
#   ) %>%
#   arrange(as.factor(row), as.numeric(column)) %>%
#   mutate(subplot = paste(row, column, sep = ""), .after = plot) %>%
#   select(-row, -column) %>%
#   relocate(contains("HA_ID"), .after = subplot) %>%
#   relocate(contains("tag_number"), .after = plant_id)
#
#
# names(wide_ha_data)

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
  mutate(ranch = recode_factor(ranch, "PortoAlegre" = "Porto Alegre")) %>%
  mutate(ranch = recode_factor(ranch, "DIM" = "Dimona")) %>%
  mutate(ranch = recode_factor(ranch, "PAL" = "Porto Alegre")) %>%
  mutate(ranch = recode_factor(ranch, "EST" = "Esteio")) %>%
  mutate(habitat = recode_factor(habitat, "1-ha" = "one")) %>%
  mutate(habitat = recode_factor(habitat, "10-ha" = "ten")) %>%
  mutate(habitat = recode_factor(habitat, "CF" = "forest")) %>%
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
  ungroup() %>%
  rename(
    "plot" = "plotID",
  ) 


# TODO: checking, cleanup

#Why no measurements for some plots in 2000, 2003?
ha_dryad %>% 
  group_by(plot, year) %>%
  summarize(non_na = sum(!is.na(shts))) %>%
  filter(non_na < 5)


test <- ha_dryad %>%
  select(plant_id, code, census_status) %>%
  filter(code == "missing")
test$test <- test$code == test$census_status
test %>% filter(test == FALSE)

test <- ha_dryad %>%
  # select(plant_id,notes,ht,shts,infl,census_status) %>%
  filter(is.na(ht) & is.na(shts) & is.na(infl)) %>%
  filter(census_status == "measured")
# view(test)


# create a new DF for treefall impact
treefall_impact <- ha_dryad %>%
  select(plot, plant_id, year, treefall_status) %>%
  drop_na(treefall_status)

ha_dryad


# DELETE CODE COLUMN
ha_dryad <- ha_dryad %>% select(-code)

head(ha_dryad)
glimpse(ha_dryad)
summary(ha_dryad$infl)
summary(ha_dryad$recorded_sdlg)

names(ha_data)


# Save the files ----------------------------------------------------------

 
write_csv(ha_dryad, "./data_clean/HDP_1997_2009.csv")

write_csv(ha_plots, "./data_clean/HDP_plots.csv")

# write_csv(treefall_impact, "./data_clean/treefall_data.csv")



