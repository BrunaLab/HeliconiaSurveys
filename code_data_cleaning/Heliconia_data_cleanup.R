
# Code Overview -----------------------------------------------------------
# Code to conduct the analyses and generate the figures in:
# Script created by Emilio M. Bruna, embruna@ufl.edu
# Script created in R version 3.3.1

# Load libraries ----------------------------------------------------------
library(tidyverse)

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
    c("PortoAlegre" = "PAL", "Esteio-Colosso" = "EST", "Dimona" = "DIM"))) %>% 
# clean up the names of plots
  mutate(plot = str_replace_all(
    plot,
    c("Dimona CF" = "Dimona-CF",
      "PA-CF" = "PortoAlegre-CF",
      "Cabo Frio" = "CaboFrio-CF",
      "Florestal" = "Florestal-CF")
  ))

unique(ha_data$ranch)
unique(ha_data$plot)

plot_info <-
  read_csv("./data_raw/heliconia_plot_descriptors.csv") %>%
  select(plotID = habitat_type...1, plot = HDP_plot_ID_no)
ha_data <- left_join(ha_data, plot_info, by = "plot")


rm(plot_info)
str(ha_data)


# ADD A UNIQUE ID NUMBER FOR EACH PLANT -----------------------------------
ha_data <- rowid_to_column(ha_data, "HA_ID_Number")

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


# remove NAs
ha_data <- ha_data %>% filter(!is.na(HA_ID_Number)) #(ERS: this shouldn't do anything.  HA_ID_Number is just the row numbers at this point.)

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


# Check for Duplicate ID Numbers ------------------------------------------
#
# check_dupes <- function(df){
#   df %>%
#     group_by(year, HA_ID_Number) %>%
#     count() %>%
#     filter(n>1) %>%
#     pull(HA_ID_Number) %>%
#     unique()
#   }
# initial_dupes<-check_dupes(ha_data)
# initial_dupes<-ha_data[initial_dupes,]
#
# initial_dupes<-initial_dupes %>% filter(ha_data %in%initial_dupes)


# remove the rows with NA across all columns -----------------------------
ha_data <- ha_data %>% drop_na(plot, habitat, ranch) #ERS: this does nothing currently

# correction - x/y coordinates and row/col--------------------------------

# some of the errors in plant location (Row/Column) corrected below found
# by ES, see https://github.com/BrunaLab/HeliconiaDemography/issues/5

ha_data %>%
  group_by(HA_ID_Number) %>%
  summarize(n_distinct(HA_ID_Number))




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
# (the HA_ID_numbers are unique)
ha_data$tag_number <- floor(ha_data$tag_number)
ha_data$tag_number <- as.integer(ha_data$tag_number)


# correct zombie plants  --------------------------------------------------

# Zombie Plants = marked dead in year t but with measurement of shts or ht
# in a subsequent year, indicating they had lost above-ground parts
# but were still alive

source("./code_data_cleaning/find_zombies.R")
zombies <- find_zombies(ha_data)
zombies %>%
  group_by(habitat, plot) %>%
  # summarize(N_plants = n_distinct(tag_number)) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants))

# NB: 1/226/22: the zombies are due to duplicate numbers


# check for plants with duplicate tag numbers -----------------------------

source("./code_data_cleaning/detect_duplicate_plants.R")
dupes <- detect_duplicate_plants(ha_data)
dupes %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants)) %>%
  filter(habitat != "")

duplicate_tags <- dupes %>%
  select(tag_number, plot) %>%
  group_by(tag_number, plot) %>%
  slice(1) %>%
  filter(tag_number > 0)

duplicate_tags$tag_number <- as.numeric(duplicate_tags$tag_number)
duplicate_tags$duplicate_tag <- "duplicate tag number"
ha_data <- left_join(ha_data, duplicate_tags)
names(ha_data)


# PA-10 ha has a bunch of duplicated tag numbers, this will
# save a csv file to 2x

# dupes_pa10<-filter(dupes,plot=="5754")
# dupes_pa10<-filter(dupes_pa10,(is.na(shts)==FALSE) & is.na(ht)==FALSE) %>%
#   select(plot, tag_number, year, row, column,shts, ht, code)
# rownames(dupes_pa10) <- NULL
# dupes_pa10
# write_csv(dupes_pa10, "./data_check/dupes_pa10.csv")
#
# dupes_pa10_short<-filter(dupes,plot=="5754") %>%
#   group_by(tag_number) %>%
#   slice(1)
# dupes_pa10_short$tag_number

count_dupes <- ha_data %>%
  filter(duplicate_tag == "duplicate tag number") %>%
  group_by(tag_number, plot) %>%
  summarize(N_plants = n_distinct(tag_number))
nrow(duplicate_tags) == nrow(count_dupes)
# check_dupes(ha_data)



# simplify codes ----------------------------------------------------------
unique(ha_data$code)

#TODO: document what is expected here
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


# "dried (7)"
# "2x in field (200)"
# "90, 10 (two codes)"
# "dead (2)"
# "dead and not on list (100)"
# "missing (60)"
# "new plant in plot (6)"
# "no tag (50)"
# "not on list (40)"
# "resprouting (10)"
# "sdlg (1)"
# "ULY (3)"
# "under branchfall (90)"
# "under litter (70)"
# "under treefall (80)"


# Pull out 'ULY'; save to csv file -----------------

# NOTE plots weere still being completely surveyed through 99, which is why so
# many ULY - most were from that year. We want to focus on those AFTER the 
# initial survey sweep so lets instead mark uly only after 1999

ULYs <-
  ha_data %>%
  filter(code == "no tag" | code == "ULY" | code == "new plant in plot") %>% 
  arrange(notes, plot, year, tag_number) %>%
  select(-ht, -shts, -infl, -x_09, -y_09)
write_csv(ULYs, "./data_check/ULY_plants.csv")

ULYs_post99 <-
  ha_data %>%
  filter(code == "no tag" | code == "ULY" | code == "new plant in plot") %>%
  filter(year > 1999) %>%
  arrange(notes, plot, year, tag_number) %>%
  select(-ht, -shts, -infl, -x_09, -y_09)
write_csv(ULYs_post99, "./data_check/ULY_plants_post1999.csv")

ULYs_post99_summary <- ULYs_post99 %>%
  # group_by(plot, year, row, column) %>%
  # group_by(plot, year) %>%
  group_by(plot) %>%
  summarize(n = n()) %>%
  arrange(desc(n))
ULYs_post99_summary

# GO AHEAD AND DELETE THE ULY CODE FOR PLANTS AFTER 1999

ha_data <- ha_data %>% 
  mutate(code = if_else((code == "ULY" & year == 1999), NA_character_, code))

# Pull out 'Miscellaneous observations'; save to csv file -----------------

summary(as.factor(ha_data$code))
MISC_OBS <-
  ha_data %>%
  filter(
    code == "dried" |
      code == "under litter" |
      code == "2x in field" |
      code == "under branchfall" |
      code == "resprouting" |
      code == "under branchfall, resprouting" |
      code == "under treefall" |
      code == "90, 10" |
      is.na(notes) == FALSE
  ) %>%
  arrange(notes, plot, year, tag_number) %>%
  select(-ht, -shts, -infl, -x_09, -y_09)
unique(MISC_OBS$code)
unique(MISC_OBS$notes)
write_csv(MISC_OBS, "./data_clean/misc_observations.csv")

# Save CSV of plants that were not on the survey list ---------------------

Not_on_SurveyList <-
  ha_data %>%
  filter(code == "not on list" |
    code == "dead and not on list") %>%
  arrange(plot, tag_number)

unique(Not_on_SurveyList$code)
unique(Not_on_SurveyList$notes)
write_csv(
  Not_on_SurveyList,
  "./data_check/Not_on_List_plants.csv"
)



any_code <-
  ha_data %>%
  filter(!is.na(code)) %>%
  filter(!code == "missing") %>%
  filter(!code == "sdlg") %>%
  filter(!code == "dead") %>%
  filter(!code == "under branchfall") %>%
  filter(!code == "under branchfall, resprouting") %>%
  filter(!code == "under litter") %>%
  filter(!code == "under treefall") %>%
  filter(!code == "resprouting") %>%
  filter(!code == "dried") %>%
  arrange(code, plot, tag_number, year) %>%
  select(-notes, -x_09, -y_09, -ranch, -plotID, -bdffp_reserve_no, -HA_ID_Number)

# any_code$code <- droplevels(any_code$code)
unique(any_code$code)
write_csv(any_code, "./data_check/any_code.csv")
write_csv(ULYs, "./data_check/ULY_plants.csv")





# Things that can be added for data paper ---------------------------------


# ha_data$missing<-ha_data$code
# ha_data <- ha_data %>%
#   mutate(survey_status = replace(as.character(survey_status), ((survey_status!="dead")&
#                                                                  (survey_status!="missing")&
#                                                                  (survey_status!="dead and not on list"))
#                                  ,NA)) %>%
#   mutate(survey_status = replace(as.character(survey_status), survey_status=="dead and not on list","dead"))
# levels(as.factor(ha_data$survey_status))


# add Seedling (T/F) column  --------------------------------------------

ha_data <- 
  ha_data %>% 
  mutate(sdlg_status = if_else(code == "sdlg", "sdlg", NA_character_))
unique(ha_data$sdlg_status)

# add branchfall / treefall column ----------------------------------------
ha_data <- ha_data %>% 
  mutate(treefall_status = if_else(
    code %in% c("under branchfall", "under treefall", "under branchfall, resprouting", "under litter"),
    code,
    NA_character_)) %>% 
  mutate(treefall_status = replace(treefall_status, treefall_status == "under branchfall, resprouting", "under branchfall"))

unique(ha_data$treefall_status)


# add column to note if recruited as adult (uly,new tag, etc) -------------

unique(ha_data$code)
ha_data <- ha_data %>% 
  mutate(plant_no_tag = case_when(
    code %in% c("not on list", "dead and not on list") ~ "not on list",
    code %in% c("no tag", "plant without tag", "new plant in plot", "ULY") ~ "plant without tag",
    #else:
    TRUE ~ NA_character_
  ))

unique(ha_data$plant_no_tag)

# add column to check repro status -------------

unique(ha_data$code)
unique(ha_data$notes)

ha_data <- ha_data %>%
  mutate(repro_check = replace(notes, notes == "1 new infl + 1 old infl", "1 new infl, 1 old infl"))
unique(ha_data$repro_check)

# add column to check condition (resprouting, dried) -------------

unique(ha_data$code)
ha_data <- ha_data %>% 
  mutate(condition = case_when(
    code == "dried" ~ "dried",
    code %in% c("under branchfall, resprouting", "resprouting") ~ "resprouting",
    #else
    TRUE ~ NA_character_
  ))

unique(ha_data$condition)




# add census_status (measured/missing)column ------------------------------
# unique(ha_data$code)
# ha_data_original<-ha_data
ha_data<-ha_data_original

ha_data <- ha_data %>% 
  mutate(census_status = case_when(
    (ht >= 0 | shts >= 0 | infl > 0) ~ "measured",  # anything with a measurement is alive
    code %in% c("sdlg") ~ "measured", # new seedlings are alive, even if no ht or sht measurment
    code %in% c("dead", "dead and not on list") ~ "dead", # anything dead is dead
    # code %in% c("sdlg","no tag","plant_no_tag", "ULY","new plant in plot") ~ "new",
    code %in% c("missing") ~ code,  # in some years plants were marked missing
    # (is.na(ht) & is.na(shts) & is.na(infl)) ~ "missing",  # anything with a measurement is alive
    TRUE ~ NA_character_  # anything not measured or marked "missing", "dead" or "seedling" is NA
  )) %>%
  group_by(plot,HA_ID_Number) %>%
  # fill in the rows down. Any "missing will be recorded as missing until 
  # they bump up against another category (dead, measured). Dead will be 
  # filled in as dead until the last year of census
  fill(census_status, .direction = "down") %>%  
  arrange(plot,HA_ID_Number, year) 

unique(ha_data$census_status)

# Now keep only those alive, missing, and the first year marked dead
ha_measured<- ha_data %>% filter(census_status=="measured")
ha_missing<- ha_data %>% filter(census_status=="missing")
ha_na<- ha_data %>% filter(is.na(census_status))
ha_na<-ha_na %>% filter(!is.na(duplicate_tag))
ha_dead<- ha_data %>%  
  filter(census_status=="dead") %>% 
  arrange(plot,HA_ID_Number,year) %>% 
  group_by(plot,HA_ID_Number) %>% 
  filter(row_number()==1)
  
ha_data<-bind_rows(ha_measured,ha_na,ha_dead,ha_missing) %>% 
  arrange(plot, HA_ID_Number, year)
unique(ha_data$census_status)

# Some that were NA in all measurments but were duplicate tage numbers weren getting marked
# as NA instead of missing in census_status so this takes care of that

ha_data <- ha_data %>% 
  mutate(
    census_status = case_when(
      (is.na(ht) & is.na(shts)  & is.na(infl) & census_status=="measured" & (is.na(code)==TRUE  & is.na(notes)==TRUE & is.na(duplicate_tag)==TRUE))  ~ "missing",
      TRUE ~ census_status)  # anything not measured or marked "missing", "dead" or "seedling" is NA
  )

## The ones under trefalls coming back "measured"
ha_data <- ha_data %>% 
  mutate(census_status = case_when(
        (is.na(ht) & is.na(shts)  & is.na(infl) & census_status=="measured" & (treefall_status=="under treefall" |  treefall_status=="under branchfall")) ~ "missing",
      TRUE ~ census_status)  # anything not measured or marked "missing", "dead" or "seedling" is NA
  )


# TODO: some that were measured but thjen never marked as missing in the
# subsequent year were filled as measured.

ha_recruit_yr<- ha_data_1 %>% filter(census_status=="measured") %>% filter(row_number()==1)
hist(ha_recruit_yr$year)
ha_recruit_yr %>% group_by(year) %>% count() %>%
  ungroup() %>% 
  mutate(freq = (n/ sum(n)*100)) %>% 
  mutate(cumulative_freq = (cumsum(n)/ sum(n)*100))
  
# 
# 
# %>% 
#   mutate(census_status = if_else(
#     (
#       (is.na(ht) & is.na(shts)) & 
#        (lag(census_status,1)=="measured" |(lag(census_status,1)=="missing"|  & lead(census_status=="measured")))
#       ),
#     "missing",
#     census_status)) 
# %>% 
#   
  

# 
# 
# mutate(census_status = case_when(
#   (is.na(census_status) & is.na(ht) & is.na(shts))  ~ "missing",
#   TRUE ~ NA_character_
# )) 


# Delete any with rows prior to being a seedling or after dead:
# AFTER ADDING CENSUS STATUS, this is incredibly easy

# ha_data <- ha_data %>% filter(!is.na(census_status) | !is.na(duplicate_tag))

# NOT AS GOOD AS METHOD ABOVE!
# first, for any plant with a seedling code, flag all the pre-seedling years.
# in a new column, first indicate the seedling year, then muytate this column to 
# fill back in time with the "delete" tag,
# then keep only those that are NA (ie, no "delete" tag)
# then do the same with dead, except move forward from the year marked dead
# ha_data <-
#   ha_data %>%
#   group_by(HA_ID_Number) %>%
#   mutate(
#     blank_yr_delete = if_else(lead(code, 1) == "sdlg", "delete", NA_character_),
#     .before = 'code'
#   ) %>% 
#   fill(blank_yr_delete, .direction ="up") %>% 
#   filter(is.na(blank_yr_delete)) %>% 
#   mutate(
#     blank_yr_delete = if_else(
#       lag(code, 1) %in% c("dead", "dead and not on list"),
#       "delete",
#       NA_character_
#     ),
#     .before = 'code'
#   ) %>% 
#   fill(blank_yr_delete, .direction ="down") %>% 
#   filter(is.na(blank_yr_delete)) %>% 
#   select(-blank_yr_delete)
# 
# # NB: this isn't removing any ULY that aren't ULY that weren't marked as such'

# this is the less efficient way
# 
# levels(as.factor(ha_data$sdlg_status))
# levels(as.factor(ha_data$code))
# ha_data %>%
#   group_by(HA_ID_Number) %>%
#   filter(lag(sdlg_status == "sdlg", 1))
# 
# dead_lags <- ha_data %>%
#   select(plot, HA_ID_Number, tag_number, row, column, year, ht, shts, infl, code, notes) %>%
#   group_by(HA_ID_Number) %>%
#   filter(lag(code == "dead", 1) |
#     lag(code == "dead", 2) |
#     lag(code == "dead", 3) |
#     lag(code == "dead", 4) |
#     lag(code == "dead", 5) |
#     lag(code == "dead", 6) |
#     lag(code == "dead", 7) |
#     lag(code == "dead", 8) |
#     lag(code == "dead", 9) |
#     lag(code == "dead", 10) |
#     lag(code == "dead", 11))
# 
# #didn't include the dead and not on list!
# 
# 
# pre_sdlg_na <- ha_data %>%
#   select(plot, HA_ID_Number, tag_number, row, column, year, ht, shts, infl, code, notes, sdlg_status) %>%
#   group_by(HA_ID_Number) %>%
#   filter(lead(sdlg_status == "sdlg", 1) |
#     lead(sdlg_status == "sdlg", 2) |
#     lead(sdlg_status == "sdlg", 3) |
#     lead(sdlg_status == "sdlg", 4) |
#     lead(sdlg_status == "sdlg", 5) |
#     lead(sdlg_status == "sdlg", 6) |
#     lead(sdlg_status == "sdlg", 7) |
#     lead(sdlg_status == "sdlg", 8) |
#     lead(sdlg_status == "sdlg", 9) |
#     lead(sdlg_status == "sdlg", 10) |
#     lead(sdlg_status == "sdlg", 11))
# 
# summary(dead_lags)
# summary(pre_sdlg_na)
# 
# delete_rows <- bind_rows(dead_lags, pre_sdlg_na)
# summary(delete_rows)
# ha_slim <- anti_join(ha_data, delete_rows)
# # The complete and comprehensive version of the data with all columns
# 
# 
# # COMPARISON
# nrow(ha_data)==nrow(ha_data_1) # different number of rows
# nrow(ha_data)-nrow(ha_data_1) # different number of rows
# # my more efficient one deleted 6656 extra rows
# names(ha_data)
# names(ha_data_1)
# ha_data_1.1<-ha_data_1 %>% select(-census_status)
# diff_rows<-setdiff(ha_data, ha_data_1.1)

# ha_data <- ha_data %>%
#   arrange(as.numeric(row), as.numeric(column)) %>%
#   mutate(subplot = paste(row, column, sep = "")) %>%
#   arrange(subplot, HA_ID_Number, year)


unique(ha_data$census_status)
summary(as.factor(ha_data$census_status))
write_csv(ha_data, "./data_clean/Ha_survey_pre_submission.csv")


# standardize column classes ---------------------------------------------
#ERS: this doesn't matter if the output is .csv
# ha_data$infl <- as.character(ha_data$infl)
ha_data$plot <- as.factor(ha_data$plot)
ha_data$plotID <- as.factor(ha_data$plotID)
ha_data$ranch <- as.factor(ha_data$ranch)
ha_data$bdffp_reserve_no <- as.factor(ha_data$bdffp_reserve_no)
ha_data$row <- as.factor(ha_data$row)
# make habitat (frag size) an ordered factor
ha_data$habitat <- ordered(ha_data$habitat, levels = c("1-ha", "10-ha", "CF"))

#TODO: write rds?

names(ha_data)
# wide form to make it easier to search for ULY matches -------------------
# 
# wide_ha_data <- ha_data %>%
#   select(
#     plot,
#     row,
#     column,
#     HA_ID_Number,
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
#   relocate(contains("tag_number"), .after = HA_ID_Number)
# 
# 
# names(wide_ha_data)
# FIXES AFTER REVIEWING THE FILES -----------------------------------

# TODO: 5756
# figure out which of the plants in the plot is  now 933
# RESPONSE:  looks like was 332 lost tag and became 933

# 1864/1864: was there a tage switch? did these get confused?
# 1684: was it a seedling in 1st year?

# tag 976 plant id 4775 the 06 and 07 measurments are obs wrong

# TODO: 2107
# track down these marked and mapped in 07/08
# look for them in plant_id_07 for plants 1609 and 1629
# filter(ha_data, tag_number == 1705 & plot == 5756)
# filter(ha_data, tag_number == 1710 & plot == 5756)

# TODO: 5753
# 345 sdlg twice?
# marked as ULY or seedling prior to seedling year?
# 345

# TODO:5752
# marked as ULY or seedling prior to seedling year?
# 401
# 414
# 426
# 438
# 456
# 467
# 484
# 485
# 503
# 504
# 560

# check the xy

# TODO  5754 PA 10

# Need to add 2006 seedling notations

# plant 46 in B4 is actually 6. (2,112 in 1999) can track down what appened to it?

# 770 in 2006 missing on csv, 2x on form?
# 765 in 2006 missing on csv, 2x on form?

# ha id 7775  marked as mewasured in 03 but was missing
# ha id 8478  marked as mewasured in 01 but was missing, misisng but measured 05


# TODO: 17, 25 is missing every year?!


# TODO: Duplicated tag numbers to check in the field
# 2107 : 237 in C8 and D6
# CaboFrio-CF: 194 in C10 and A8, need to be figured out in field
# 5756: 16, 816.2 looks like a ULA but recorded number wrong, 2x in field,
# 933/332 in A7 check 2007 note for 1686 that it is "rebroto de velha sem placa"

# TODO: verify that CF-1, CF-2...FF-7 match Bruna (2003) Ecology and ConBio
# TODO: Make non repro 0 instead of NA
# TODO: what is the difference between "not on list" and "new plant in plot"?
# If nothing then collapse.
# TODO: "dead not on list...where they properly recorded as dead?
# but had a tag on them, so they were marked in a previous year.  Not sure why -
# could have been someone forgot to call it out. They are useful because they
# are a true mortality (had a tag, now dead), or were alive in past year
# summary(as.factor(ha_data$code))


# TODO: PACF ha id 7416 shts and ht NA in a year marked with 1 infl 2x


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
  arrange(as.numeric(row), as.numeric(column)) %>%
  mutate(subplot = paste(row, column, sep = "")) %>%
  select(
    "plotID",
    "habitat",
    "ranch",
    "bdffp_reserve_no",
    "plot"
  ) %>%
  distinct() %>%
  arrange(plotID) %>%
  mutate(ranch = recode_factor(ranch, "PortoAlegre" = "PAL")) %>%
  mutate(habitat = recode_factor(habitat, "1-ha" = "one")) %>%
  mutate(habitat = recode_factor(habitat, "10-ha" = "ten")) %>%
  mutate(habitat = recode_factor(habitat, "CF" = "forest")) %>%
  rename(
    "ha_plot_no" = "plot",
    "bdffp_no" = "bdffp_reserve_no",
    "plot" = "plotID"
  ) %>%
  select(-"ha_plot_no") %>%
  left_join(isolation)
ha_plots



# This is the version of the dataset that will get uploaded to dryad

names(ha_data)
head(ha_data)

ha_dryad <- ha_data %>%
  arrange(row, as.numeric(column)) %>%
  mutate(subplot = paste(row, column, sep = "")) %>%
  select(plotID,
    subplot,
    HA_ID_Number,
    year,
    shts,
    ht,
    infl,
    code,
    notes,
    recorded_sdlg = sdlg_status,
    treefall_status,
    condition,
    census_status
  ) %>%
  # change infl to be conditional - IF reproductive, how many infl? others ->NA
  mutate(infl = replace(infl, infl == 0, NA)) %>%
  # convert column sdlg_status to be logical TRUE/FALSE/NA
  # mutate(sdlg_status = case_when(sdlg_status == "sdlg (1)"~ TRUE,
  #                                is.na(sdlg_status) &
  #                                  is.na(ht) == FALSE &
  #                                  is.na(shts) == FALSE ~ FALSE)) %>%

  # mutate(recorded_dead = case_when(
  #   code == "dead" ~ TRUE,
  #   code == "dead and not on list" ~ TRUE,
  #   code != "dead" ~ FALSE,
  #   is.na(code) == TRUE ~ FALSE
  # )) %>%
  # mutate(code = replace(code, code == "dead", NA)) %>%
  # mutate(code = replace(code, code == "dead and not on list", "not on list")) %>%
  mutate(recorded_sdlg = case_when(
    recorded_sdlg == "sdlg" ~ TRUE,
    recorded_sdlg != "sdlg" ~ FALSE,
    is.na(recorded_sdlg) == TRUE ~ FALSE
  )) %>%
  mutate(code = replace(code, code == "sdlg", NA)) %>%
  mutate(treefall_impact = case_when(
    code == "under branchfall" ~ "branch",
    code == "under litter" ~ "litter",
    code == "under treefall" ~ "crown"
  )) %>%
  mutate(code = replace(code, code == "under branchfall", NA)) %>%
  mutate(code = replace(code, code == "under litter", NA)) %>%
  mutate(code = replace(code, code == "under treefall", NA)) %>%
  mutate(code = case_when(
    code == "resprouting" ~ "resprouting",
    code == "dried" ~ "dried",
    code == "ULY" ~ "ULY",
    code == "new plant in plot" ~ "ULY",
    code == "not on list" ~ "NOL",
    code == "dead and not on list" ~ "NOL",
    TRUE ~ as.character(code)
  )) %>%
  ungroup() %>% 
  select(-plot) %>% 
  rename(
    "plot" = "plotID",
    "plant_id" = "HA_ID_Number"
  ) %>%
  mutate(across(where(is.character), as.factor)) %>%
  unite("notes", code:notes, sep = "", na.rm = TRUE) %>%
  mutate(notes = replace(notes, notes == "", NA))

#TODO: checking, cleanup

test<-ha_dryad %>% select(plant_id,notes,census_status) %>% filter(notes=="missing")
test$test<-test$notes==test$census_status
test %>% filter(test==FALSE)

test<-ha_dryad %>% 
  # select(plant_id,notes,ht,shts,infl,census_status) %>% 
  filter(is.na(ht) & is.na(shts) & is.na(infl)) %>% 
  filter(census_status=="measured")
view(test)


# create a new DF for treefall impact
treefall_impact <- ha_dryad %>%
  select(plot, plant_id, year, treefall_status) %>%
  drop_na(treefall_status)
# delete "trefall impact" colummn
ha_dryad <- ha_dryad %>% select(-treefall_impact)

ha_dryad

unique(ha_dryad$notes)
#TODO: if notes = status (i.e., missing, then delete from notes)
# ha_dryad <- ha_dryad %>% 
# mutate(notes = case_when(
#   notes == census_status ~ NA_character_,
#   TRUE ~ notes)
# )
# unique(ha_dryad$notes)
# unique(ha_dryad$census_status)
# ha_dryad$code <- droplevels(ha_dryad$code)
# levels(ha_dryad$code)
head(ha_dryad)
glimpse(ha_dryad)
summary(ha_dryad$infl)
summary(ha_dryad$recorded_sdlg)
summary(ha_dryad$recorded_dead)
summary(as.factor(ha_dryad$notes))
summary(ha_dryad$sdlg_status)

levels(as.factor(ha_dryad$notes))


write_csv(ha_dryad, "./data_clean/ha_plants_dryad.csv")

# unique(ha_dryad$notes)

write_csv(ha_plots, "./data_clean/ha_plots_dryad.csv")

write_csv(ha_dryad, "./data_clean/treefall_impact_dryad.csv")







# wide form to make it easier to search for ULY matches -------------------

wide_ha_dryad <- ha_dryad %>%
  pivot_wider(
    names_from = year,
    values_from = c("shts", "ht", "infl", "notes"),
    names_vary = "slowest"
  ) %>% 
  arrange(
    plot,
    subplot,
    plant_id
  )
names(wide_ha_dryad)
#recorded_* columns no longer make sense in this format.  Why not just keep it all in notes?






# summaries ---------------------------------------------------------------



ha_data %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants))


ha_data %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants)) %>%
  summarize(N_plants = sum(N_plants))



ha_data %>%
  group_by(habitat) %>%
  summarize(N_plants = n_distinct(HA_ID_Number))


ha_dryad %>%
  group_by(plot) %>%
  filter(recorded_sdlg==TRUE) %>%
  group_by(plot) %>% 
  tally() %>% 
  arrange(desc(n))


ha_data %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants)) %>%
  ungroup() %>%
  summarize(total_plants = sum(N_plants))

