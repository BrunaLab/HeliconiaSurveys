
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
names(ha_data) <- make.unique(names(ha_data), sep="_")

# rename the columns that have duplicate names
ha_data<-ha_data %>% rename("habitat"="size",
                            "plant_id_07"="plantid",
                            "row_07"="row_1",
                            "column_07"="col",
                            "x_08"="x",
                            "y_08"="y",
                            "plant_id_08"="plantid_1",
                            "row_08"="row_2",
                            "column_08"="col_1",
                            "x_09"="x_1",
                            "y_09"="y_1",
                           "code_to_eb"="notes to emilio")
names(ha_data)
# 
# names(ha_data)[2] <- "habitat"
# names(ha_data)[48] <- "plant_id_07"
# names(ha_data)[49] <- "row_07"
# names(ha_data)[50] <- "column_07"
# names(ha_data)[55] <- "x_08"
# names(ha_data)[56] <- "y_08"
# names(ha_data)[57] <- "plant_id_08"
# names(ha_data)[58] <- "row_08"
# names(ha_data)[59] <- "column_08"
# names(ha_data)[64] <- "x_09"
# names(ha_data)[65] <- "y_09"
# names(ha_data)[66] <- "code_to_eb"
# names(ha_data)

# correct the data types assigned to each
str(ha_data)

# set as character
ha_data$code_to_eb <- as.character(ha_data$code_to_eb)

# set these as a factor
cols <-
  c(
    "plot",
    "ranch",
    "column",
    "notes_1998",
    "notes_1999",
    "notes_2000",
    "notes_2001",
    "notes_2002",
    "notes_2003",
    "notes_2004",
    "notes_2005",
    "notes_2006",
    "notes_2007",
    "notes_2008",
    "notes_2009"
  )
ha_data[cols] <- lapply(ha_data[cols], factor)
str(ha_data)


# Convert the names of ranches to 3 letter codes
levels(ha_data$ranch)[match("PortoAlegre", levels(ha_data$ranch))] <- "PAL"
levels(ha_data$ranch)[match("Esteio-Colosso", levels(ha_data$ranch))] <- "EST"
levels(ha_data$ranch)[match("Dimona", levels(ha_data$ranch))] <- "DIM"
summary(ha_data$ranch)

# clean up the names of plots
summary(ha_data$plot)
levels(ha_data$plot)[match("Dimona CF", levels(ha_data$plot))] <- "Dimona-CF"
levels(ha_data$plot)[match("PA-CF", levels(ha_data$plot))] <- "PortoAlegre-CF"
levels(ha_data$plot)[match("Cabo Frio", levels(ha_data$plot))] <- "CaboFrio-CF"
levels(ha_data$plot)[match("Florestal", levels(ha_data$plot))] <- "Florestal-CF"
summary(ha_data$plot)


plot_info <-
  read_csv("./data_raw/heliconia_plot_descriptors.csv") %>%
  rename(plotID = habitat_type, plot = HDP_plot_ID_no) %>%
  select(plotID, plot)
ha_data <- left_join(ha_data, plot_info, by = "plot")

#   read_csv("./data_raw/heliconia_plot_descriptors.csv") %>% 
#   rename(plotID = habitat_type...1, plot=HDP_plot_ID_no) %>% 
#   select(plotID,plot)
# ha_data <- left_join(ha_data, plot_info,by="plot") 

rm(plot_info)
ha_data$plot <- as.factor(ha_data$plot)
str(ha_data)



# ADD A UNIQUE ID NUMBER FOR EACH PLANT -----------------------------------
ha_data <- rowid_to_column(ha_data, "HA_ID_Number")


# CORRECTIONS TO THE DATASET ----------------------------------------------

# TODO: is it possible these lost above ground parts, which Is why they were
# counted as zero?

# 2107
# # incorrectly entered tag no. as 228 instead of 288
 ha_data$plant_id_07[ha_data$plot == "2107" & ha_data$plant_id_07 == "228" &
                       ha_data$tag_number == "288"] <- "288"

# 5751
# fix tag 310
ha_data[which(ha_data$tag_number == 310 & ha_data$plot == "5751"), 49] <- NA


# correcting data assignment after replacing tag in field   ---------------

# PLOT 2017

# tags 68/275
source <- which(ha_data$tag_number == 68 & ha_data$bdffp_reserve_no == "2107")
destination <- which(ha_data$tag_number == 275 & ha_data$bdffp_reserve_no == "2107")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# fix 129/311
source <- which(ha_data$tag_number == 129 & ha_data$bdffp_reserve_no == "2107")
destination <- which(ha_data$tag_number == 311 & ha_data$bdffp_reserve_no == "2107")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# PLOT 1501
# tags 1338/1398
source <- which(ha_data$tag_number == 1338 & ha_data$bdffp_reserve_no == "1501")
destination <- which(ha_data$tag_number == 1398 & ha_data$bdffp_reserve_no == "1501")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# Reserve 1104 (Colosso 1-ha)
# fix 154/390
source <- which(ha_data$tag_number == 154 & ha_data$bdffp_reserve_no == "1104")
destination <- which(ha_data$tag_number == 390 & ha_data$bdffp_reserve_no == "1104")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# fix 364/337
source <- which(ha_data$tag_number == 264 & ha_data$bdffp_reserve_no == "1104")
destination <- which(ha_data$tag_number == 337 & ha_data$bdffp_reserve_no == "1104")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# PLOT 5756
# fix 431/480
source <- which(ha_data$tag_number == 431 & ha_data$plot == "5756")
destination <- which(ha_data$tag_number == 480 & ha_data$plot == "5756")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# fix tag 1629
destination <- which(ha_data$tag_number == 1629 & ha_data$plot == "5756")
ha_data[destination, 49:53] <- NA

# fix tag 1609
destination <- which(ha_data$tag_number == 1609 & ha_data$plot == "5756")
ha_data[destination, 49:53] <- NA

# fix tag 551/1678
source <- which(ha_data$tag_number == 551 & ha_data$plot == "5756")
destination <- which(ha_data$tag_number == 1678 & ha_data$plot == "5756")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# fix tag 1231/1714
source <- which(ha_data$tag_number == 1231 & ha_data$plot == "5756")
destination <- which(ha_data$tag_number == 1714 & ha_data$plot == "5756")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# fix tag 1864 / 1684
# <<<<<<< dupes
# source<-which(ha_data$tag_number==1864 & ha_data$plot=="5756")
# destination<-which(ha_data$tag_number==1684 & ha_data$plot=="5756")
# ha_data[c(destination,source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))
# ha_data[c(destination,source), 45:48] <- rbind(ha_data[source, 45:48], rep(NA, 4))
# #TODO: What column(s) is this supposed to set to NA? Or should this remove 1864 entirely?
# ha_data[which(ha_data$tag_number==1864 & ha_data$plot=="5756"),]<-NA 

source <- which(ha_data$tag_number == 1864 & ha_data$plot == "5756")
destination <- which(ha_data$tag_number == 1684 & ha_data$plot == "5756")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))
ha_data[c(destination, source), 45:48] <- rbind(ha_data[source, 45:48], rep(NA, 4))
ha_data[which(ha_data$tag_number == 1864 & ha_data$plot == "5756"), ] <- NA

# 5753
# fix tags 176/199
source <- which(ha_data$tag_number == 199 & ha_data$plot == "5753")
destination <- which(ha_data$tag_number == 176 & ha_data$plot == "5753")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# fix tags 218/298
source <- which(ha_data$tag_number == 218 & ha_data$plot == "5753")
destination <- which(ha_data$tag_number == 298 & ha_data$plot == "5753")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# tag checks
# 
# ha_data$plant_id_07 <- as.integer(ha_data$plant_id_07)
# colnames(ha_data)
# tag_checks <- ha_data %>%
#   select(plot, tag_number, plant_id_07) %>%
#   mutate(dble.chk = tag_number - plant_id_07)
# tag_checks <- arrange(tag_checks, desc(dble.chk))
# head(tag_checks, 20)
# tag_checks <- arrange(tag_checks, dble.chk)
# head(tag_checks, 20)
# sum(tag_checks$dble.chk) # if NA=zero then all ok
# 
# tag_checks <- tag_checks %>%
#   filter(dble.chk > 0 | dble.chk < 0) %>%
#   arrange(plot)

# DATA CLEANING -----------------------------------------------------------

# delete unecessary columns
ha_data<-ha_data %>% select(-plant_id_07, 
                            -row_07, 
                            -column_07, 
                            -plant_id_08, 
                            -row_08, 
                            -column_08, 
                            -code_to_eb,
                            -x_08,
                            -y_08)

# colnames(ha_data)
# rearrange the columns
ha_data<-ha_data %>% select(order(colnames(.)))
ha_data<-ha_data %>% relocate(c(row,column,x_09,y_09), .after = habitat)
ha_data<-ha_data %>% relocate(c(habitat,ranch, plot, plotID), 
                              .before = bdffp_reserve_no)
ha_data<-ha_data %>% relocate(tag_number, .after = HA_ID_Number)
ha_data<-ha_data %>% relocate(starts_with(c("shts_", "ht_", "infl_", "notes_")), .after = y_09)

colnames(ha_data)
#remove NAs
ha_data <- ha_data %>% filter(!is.na(HA_ID_Number))

# # alternate solution using most recent version of tidyr:
ha_data <- ha_data %>%
  mutate(across(starts_with(c("shts_", "ht_", "infl_", "notes_")),
                as.character)) %>%
  pivot_longer(cols = starts_with(c("shts_", "ht_", "infl_", "notes_")),
               names_sep = "\\_",
               names_to = c("var", "year")) %>%
   pivot_wider(names_from = var, values_from = value)

# head(ha_data, 10)
# colnames(ha_data)
# summary(ha_data)

ha_data$shts <- as.numeric(as.numeric(ha_data$shts))
ha_data$ht <- as.numeric(as.numeric(ha_data$ht))
ha_data$infl <- as.numeric(as.numeric(ha_data$infl))


# merge the PA10 data -----------------------------------------------------
source("./code_data_cleaning/merge_with_PA10.R")
ha_data <- merge_with_PA10(ha_data)
names(ha_data)
ha_data <-ha_data %>% rename("code"="notes") 
# %>%
#   replace_na(list(infl = 0))   #convert all NA in infl column to zero


# stabndardize column classes ---------------------------------------------
ha_data$infl <- as.character(ha_data$infl)
ha_data$shts <- as.numeric(as.character(ha_data$shts))
ha_data$ht <- as.numeric(as.character(ha_data$ht))
ha_data$plot <- as.factor(ha_data$plot)
ha_data$plotID <- as.factor(ha_data$plotID)
ha_data$ranch <- as.factor(ha_data$ranch)
ha_data$bdffp_reserve_no <- as.factor(ha_data$bdffp_reserve_no)
ha_data$row <- as.factor(ha_data$row)
# make habitat (frag size) an ordered factor
ha_data$habitat <- ordered(ha_data$habitat, levels = c("1-ha", "10-ha", "CF"))




# clean up codes/notes ----------------------------------------------------
source("./code_data_cleaning/clean_codes.R")
ha_data<-clean_codes(ha_data)

# levels(as.factor(ha_data$code))
# levels(as.factor(ha_data$notes))

# 
# codes_to_fix<-ha_data %>% select(tag_number,code) %>% 
#   drop_na() %>% distinct(code,.keep_all = TRUE) %>% 
#   arrange(code) # make a summary table of all the different codes in the PA10 dataset 
# summary(as.factor(codes_to_fix$code))

# Rearrange plot, then tag number, then year
ha_data <- ha_data %>% arrange(plot, tag_number, year)
head(ha_data, 20)



# Check for Duplicate ID Numbers ------------------------------------------
# 
# check_dupes <- function(df){
#   df %>%
#     group_by(year, HA_ID_Number) %>%
#     count() %>%
#     filter(n>1) %>% 
#     pull(HA_ID_Number) %>% 
#     unique()
# }
# initial_dupes<-check_dupes(ha_data)
# initial_dupes<-ha_data[initial_dupes,]
# 
# initial_dupes<-initial_dupes %>% filter(ha_data %in%initial_dupes)


# remove the rows with NA across all columns -----------------------------
ha_data <- ha_data %>% drop_na(plot, habitat, ranch)

# correction - x/y coordinates and row/col--------------------------------

# a few were entered with a comma instead of decimal
ha_data$x_09 <- gsub("[\\,;]", "\\.", ha_data$x_09)
ha_data

# some of the errors in plant location (Row/Column) corrected below found 
# by ES, see https://github.com/BrunaLab/HeliconiaDemography/issues/5

# corrections - Florestal -------------------------------------------------
source("./code_data_cleaning/correct_florestal.R")
ha_data<-correct_florestal(ha_data)

# corrections 5750 --------------------------------------------------------
source("./code_data_cleaning/correct_5750.R")
ha_data<-correct_5750(ha_data)

# corrections 5756 --------------------------------------------------------
source("./code_data_cleaning/correct_5756.R")
ha_data<-correct_5756(ha_data)

# Corrections Dimona-CF ---------------------------------------------------
source("./code_data_cleaning/correct_dimona_cf.R")
ha_data<-correct_dimona_cf(ha_data)

# Corrections 5753 --------------------------------------------------------
source("./code_data_cleaning/correct_5753.R")
ha_data<-correct_5753(ha_data)

# Corrections 5754 (PA10) -------------------------------------------------
source("./code_data_cleaning/correct_5754.R")
ha_data<-correct_5754(ha_data)

# Corrections 5751 --------------------------------------------------------
source("./code_data_cleaning/correct_5751.R")
ha_data<-correct_5751(ha_data)

# Corrections 2108 --------------------------------------------------------
source("./code_data_cleaning/correct_2108.R")
ha_data<-correct_2108(ha_data)


# Corrections 2206 --------------------------------------------------------
source("./code_data_cleaning/correct_2206.R")
ha_data<-correct_2206(ha_data)


# Corrections 2107 --------------------------------------------------------
source("./code_data_cleaning/correct_2107.R")
ha_data<-correct_2107(ha_data)

# Corrections CaboFrio-CF -------------------------------------------------
source("./code_data_cleaning/correct_cabofrio_cf.R")
ha_data<-correct_cabofrio_cf(ha_data)

# Corrections 5752  -------------------------------------------------------
source("./code_data_cleaning/correct_5752.R")
ha_data<-correct_5752(ha_data)

# Corrections - Porto Alegre CF -------------------------------------------
source("./code_data_cleaning/correct_pa_cf.R")
ha_data<-correct_pa_cf(ha_data)


# Corrections - PA10 ------------------------------------------------------
source("./code_data_cleaning/correct_pa_10.R")
ha_data<-correct_pa_10(ha_data)


# Pull out 'Miscellaneous observations'; save to csv file -----------------

# ha_data$code<-gsub("under treefall", "under treefall (80)", ha_data$code)
# summary(as.factor(ha_data$code))
# MISC_OBS <-
#   ha_data %>%
#   filter(
#     code == "dried (7)" |
#       code == "under litter (70)" |
#       code == "2x in field (200)" |
#       code == "under branchfall (90)" |
#       code == "resprouting (10)" |
#       code == "under treefall (80)" |
#       code == "90, 10 (two codes)" |
#       is.na(notes)== FALSE
#         ) %>%
#   arrange(notes,plot, year, tag_number) %>%
#   select(-ht, -shts, -infl,-x_09,-y_09)
# write_csv(MISC_OBS, "./output/misc_observations.csv")

# Save CSV of plants that were not on the survey list ---------------------

#TODO: what is the difference between "not on list" and "new plant in plot"? 
# If nothing then collapse. What about "dead not on list...where they properly recorded as dead?

# but had a tag on them, so they were marked in a previous year.  Not sure why -
# could have been someone forgot to call it out. They are useful because they
# are a true mortality (had a tag, now dead), or were alive in past year
# summary(as.factor(ha_data$code))
# Not_on_SurveyList <-
#   ha_data %>% filter(code == "not on list (40)" |
#                        code == "dead not on list (100)" |
#   code == "new plant in plot (6)")
# write_csv(Not_on_SurveyList,
#   "./data_clean/Not_on_SurveyList.csv")

# Add MISC codes to code2, make the remainder consistent ---------------------
# ha_data$code2<-NA
# # ha_data$code2<-as.factor(ha_data$code2)
# summary(as.factor(ha_data$code))
# # summary(as.factor(ha_data$code2))
# # levels(ha_data$code2)<-levels(ha_data$code)
# # ha_data$code<-as.character(ha_data$code)
# # ha_data$code2==ha_data$code
# ha_data$code2<-NA
# 
# ha_data$code2[1]==ha_data$code[1]
ha_data$code<-trimws(ha_data$code)
ha_data$code<-as.factor(ha_data$code)
ha_data$code<-as.character(ha_data$code)
levels(as.factor(ha_data$code))

#create a new column to note if seedling in a given survey year
ha_data$sdlg_status<-ha_data$code 
ha_data <- ha_data %>%
  mutate(sdlg_status = replace(as.character(sdlg_status), sdlg_status!="sdlg (1)",NA))
levels(as.factor(ha_data$sdlg_status))

#create a new column to note it's status in dataset
ha_data$survey_status<-ha_data$code 
ha_data <- ha_data %>%
  mutate(survey_status = replace(as.character(survey_status), ((survey_status!="dead (2)")&
                                 (survey_status!="missing (60)")&
                                 (survey_status!="dead and not on list (100)"))
                                 ,NA)) %>% 
  mutate(survey_status = replace(as.character(survey_status), survey_status=="dead and not on list (100)","dead (2)"))
levels(as.factor(ha_data$survey_status))

#create a new column to note if under tree/branch/litter
ha_data$treefall_status<-ha_data$code 
ha_data <- ha_data %>%
  mutate(treefall_status = replace(as.character(treefall_status), ((treefall_status!="under branchfall (90)") &
                                                                 (treefall_status!="under treefall (80)")&
                                                                 (treefall_status!="under litter (70)")),NA)) 
levels(as.factor(ha_data$treefall_status))

#create a new column to note if ULY, Lost tag etc.
ha_data$adult_recruit<-ha_data$code 
ha_data <- ha_data %>%
  mutate(adult_recruit = replace(as.character(adult_recruit), ((adult_recruit!="new plant in plot (6)")&
                                                                 (adult_recruit!="no tag (50)")&
                                                                 (adult_recruit!="not on list (40)")&
                                                                 (adult_recruit!= "ULY (3)")& 
                                                                 (adult_recruit!= "dead and not on list (100)")), NA)) %>%
  mutate(adult_recruit = replace(as.character(adult_recruit), adult_recruit=="dead and not on list (100)","not on list (40)")) %>% 
  mutate(adult_recruit = replace(as.character(adult_recruit), adult_recruit=="new plant in plot (6)","ULY (3)"))
levels(as.factor(ha_data$adult_recruit))


ha_data$sdlg_status<-as.factor(ha_data$sdlg_status)
ha_data$survey_status<-as.factor(ha_data$survey_status)
ha_data$adult_recruit<-as.factor(ha_data$adult_recruit)
ha_data$treefall_status<-as.factor(ha_data$treefall_status)
ha_data$x_09<-as.numeric(ha_data$x_09)
ha_data$y_09<-as.numeric(ha_data$y_09)
ha_data$year<-as.factor(ha_data$year)
ha_data$infl<-as.integer(ha_data$infl)

# Finds Zombies and Duplicates --------------------------------------------

# This finds any marked dead in year X but with measurments of shts or ht
source("./code_data_cleaning/marked_dead_but_measured.R")
df <- marked_dead_but_measured(ha_data)
df

# THIS WILL CHECK TO SEE IF THERE ARE SOME THAT WERE REGISTERED DEAD BUT
# FOR WHICH THERE ARE ht or sht measurments in years AFTER they were marked dead

# returns 'ha_data', saves csv of things to check
source("./code_data_cleaning/zombies.R")
zombies <- zombies(ha_data)
zombies %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(tag_number)) %>%
  arrange(habitat, desc(N_plants))


source("./code_data_cleaning/detect_duplicate_plants.R")
dupes <- detect_duplicate_plants(ha_data)
dupes %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants))



dim(dupes)
# check_dupes(ha_data)

ha_data %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants))


ha_data %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants)) %>% 
  summarize(N_plants=sum(N_plants))



ha_data %>%
  group_by(habitat) %>%
  summarize(N_plants = n_distinct(HA_ID_Number))



ha_data %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants)) %>% 
  ungroup() %>% 
  summarize(total_plants=sum(N_plants))


ha_data <- ha_data %>% arrange(habitat, plot, plotID, bdffp_reserve_no, tag_number, row, column, year)

summary(ha_data)
write_csv(ha_data, "./data_clean/Ha_survey_pre_submission.csv")





foo<-as.data.frame(ha_data$tag_number)

# FIXES AFTER REVIEWING THE FILES -----------------------------------

# TODO:
# 2107 - tag 237 : it looks like these are actually two different plants,
# so need to 2x in the field. Note as such and treat as independent

# 2108: tag 17: these are the same plant, should actually be in A6. (was
# marked as ULY in 1999 and position was subsequently corrected.)

# 2108: tag 66: this is in C9, not a seedling C( - was not missing in 99,
# but rather marked as a seedling in D10 (must be right on an edge()))

# FF-1	2107	1-ha	282	A	5	2005	4	81	NA  this
# is actually 222, which was then retagged as 302 in 2006

# track down these marked and mapped in 07/08
# look for them in plant_id_07 for plants 1609 and 1629
filter(ha_data, tag_number == 1705 & plot == 5756)
filter(ha_data, tag_number == 1710 & plot == 5756)

#TODO: check the xy 
#TODO: check the TODO notes in PA10, 5750, and 5756 cleanup files
# TODO:# add a column with plots numbered as CF-1, CF-2...FF-7 to match map in
# Bruna (2003) Ecology

# Duplicated tag numbers to check in the field ----------------------------
# 2107 : 237 in C8 and D6
# CaboFrio-CF: 194 in C10 and A8, need to be figured out in field
# 5756: 16, 816.2 looks like a ULA but recorded number wrong, 2x in field, 933/332 in A7 check 2007 note for 1686 that it is "rebroto de velha sem placa"