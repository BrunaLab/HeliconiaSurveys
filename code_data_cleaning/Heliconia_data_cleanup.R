
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

# rename the columns that have duplicate names
names(ha_data)[2] <- "habitat"
names(ha_data)[48] <- "plant_id_07"
names(ha_data)[49] <- "row_07"
names(ha_data)[50] <- "column_07"
names(ha_data)[55] <- "x_08"
names(ha_data)[56] <- "y_08"
names(ha_data)[57] <- "plant_id_08"
names(ha_data)[58] <- "row_08"
names(ha_data)[59] <- "column_08"
names(ha_data)[64] <- "x_09"
names(ha_data)[65] <- "y_09"
names(ha_data)[66] <- "code_to_eb"
names(ha_data)

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


# add a column with plots numbered as CF-1, CF-2...FF-7 to match map in
# Bruna (2003) Ecology

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

# SELECT THE columns NEEDED
ha_data <-
  ha_data %>% select(
    "plot",
    "plotID",
    "habitat",
    "ranch",
    "bdffp_reserve_no",
    "HA_ID_Number",
    "tag_number",
    "row",
    "column",
    "x_09",
    "y_09",
    "shts_1998",
    "shts_1999",
    "shts_2000",
    "shts_2001",
    "shts_2002",
    "shts_2003",
    "shts_2004",
    "shts_2005",
    "shts_2006",
    "shts_2007",
    "shts_2008",
    "shts_2009",
    "ht_1998",
    "ht_1999",
    "ht_2000",
    "ht_2001",
    "ht_2002",
    "ht_2003",
    "ht_2004",
    "ht_2005",
    "ht_2006",
    "ht_2007",
    "ht_2008",
    "ht_2009",
    "infl_1998",
    "infl_1999",
    "infl_2000",
    "infl_2001",
    "infl_2002",
    "infl_2003",
    "infl_2004",
    "infl_2005",
    "infl_2006",
    "infl_2007",
    "infl_2008",
    "infl_2009",
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

head(ha_data, 10)
colnames(ha_data)
summary(ha_data)



ha_data$shts <- as.numeric(as.numeric(ha_data$shts))
ha_data$ht <- as.numeric(as.numeric(ha_data$ht))
ha_data$infl <- as.numeric(as.numeric(ha_data$infl))


str(pa_wide)
str(ha_data)
names(pa_wide)
names(ha_data)

# merge the PA10 data -----------------------------------------------------
source("./code_data_cleaning/merge_with_PA10.R")
ha_data <- merge_with_PA10(ha_data)
names(ha_data)
ha_data <-ha_data %>% rename("code"="notes") 
# %>%
#   replace_na(list(infl = 0))   #convert all NA in infl column to zero

# fix the data types as needed
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

ha_data <- rename(ha_data, "code"="code")
ha_data$code <- as.factor(ha_data$code)
summary(ha_data$code)
levels(ha_data$code)[levels(ha_data$code) == "1"] <-  "sdlg (1)"
levels(ha_data$code)[levels(ha_data$code) == "ULY"] <-  "ULY (3)"
levels(ha_data$code)[levels(ha_data$code) == "3"] <- "ULY (3)"
levels(ha_data$code)[levels(ha_data$code) == "2"] <-  "dead (2)"
levels(ha_data$code)[levels(ha_data$code) == "4"] <-  "ULY (3)"
levels(ha_data$code)[levels(ha_data$code) == "5"] <-  "dead (2)"
levels(ha_data$code)[levels(ha_data$code) == "6"] <-  "new plant in plot (6)"
levels(ha_data$code)[levels(ha_data$code) == "7"] <-  "dried (7)"
levels(ha_data$code)[levels(ha_data$code) == "10"] <-  "resprouting (10)"
levels(ha_data$code)[levels(ha_data$code) == "40"] <-  "not on list (40)"
levels(ha_data$code)[levels(ha_data$code) == "50"] <-  "no tag (50)"
levels(ha_data$code)[levels(ha_data$code) == "60"] <-  "missing (60)"
levels(ha_data$code)[levels(ha_data$code) == "70"] <-  "under litter (70)"
levels(ha_data$code)[levels(ha_data$code) == "80"] <-  "under treefall (80)"
levels(ha_data$code)[levels(ha_data$code) == "90"] <-  "under branchfall (90)"
levels(ha_data$code)[levels(ha_data$code) == "100"] <-  "dead and not on list (100)"
levels(ha_data$code)[levels(ha_data$code) == "200"] <-  "2x in field (200)"
levels(ha_data$code)[levels(ha_data$code) == "300"] <-  "dead (2)"
levels(ha_data$code)[levels(ha_data$code) == "1, 200 "] <-  "sdlg (1)"
levels(ha_data$code)[levels(ha_data$code) == ""] <- NA
summary(as.factor(ha_data$code))
levels(as.factor(ha_data$code))

# CLARIFY THE CODES FROM PA10
ha_data$notes <-as.character(NA)
ha_data$code<-as.character(ha_data$code)
ha_data$code<-trimws(ha_data$code)
ha_data <- ha_data %>%
  mutate(notes = if_else(code == "not on list. must be313","is it 133?", notes)) %>% 
  mutate(notes = if_else(code == "1 new infl + 1 old infl","1 new infl + 1 old infl", notes)) %>% 
  mutate(notes = if_else(code == "not on list. must be96","is it 96?", notes)) %>% 
  mutate(notes = if_else(code == "1 old infl","1 old infl", notes)) %>% 
  mutate(notes = if_else(code == "2 old infl","2 old infl", notes)) %>% 
  mutate(notes = if_else(code == "2 old infls","2 old infl", notes)) %>% 
  mutate(notes = if_else(code == "3 old infls","2 old infl", notes)) %>% 
  mutate(notes = if_else(code == "actualkly in c8","in c8", notes)) %>% 
  mutate(notes = if_else(code == "actually  B5","in b5", notes)) %>% 
  mutate(notes = if_else(code == "actually  A6","in a6", notes)) %>% 
  mutate(notes = if_else(code == "should be c5","in c5", notes)) %>% 
  mutate(notes = if_else(code == "this number belongs to a pvc in a6","this no belongs to pvc in a6", notes)) %>% 
  mutate(notes = if_else(code == "pvc stake not on list","pvc stake not on list", notes)) %>% 
  mutate(notes = if_else(code == "its in C2","its in C2", notes)) %>% 
  mutate(notes = if_else(code == "e E6","its in e6", notes)) %>% 
  mutate(notes = if_else(code == "3 old infl","2 old infl", notes)) %>% 
  mutate(notes = if_else(code == "horrible treefall in plot","horrible treefall in plot", notes)) %>% 
  mutate(notes = if_else(code == "treefall in plot","treefall in plot", notes)) %>% 
  mutate(notes = if_else(code == "horrible treefall in plot, can barely make it in","horrible treefall in plot, can barely make it in", notes)) %>% 
  mutate(notes = if_else(code == "lots of small branchfalls in plot","lots of small branchfalls in plot", notes)) %>% 
  mutate(notes = if_else(code == "plot is 50% treefall","plot is 50% treefall", notes)) %>% 
  mutate(notes = if_else(code == "trefall","trefall", notes)) %>% 
  mutate(code = if_else(code=="dead","dead (2)", code)) %>% 
  mutate(code= na_if(code, "dead")) %>% 
  mutate(code = if_else(code == "sdlg","sdlg (1)", code)) %>% 
  mutate(code = na_if(code, "sdlg")) %>% 
  mutate(code = if_else(code == "under trunk","under treefall (80)", code)) %>% 
  mutate(code = if_else(code == "under treefall","under treefall (80)", code)) %>% 
  mutate(code = if_else(code == "under fallen trunk","under treefall (80)", code)) %>% 
  mutate(code= na_if(code, "under trunk")) %>%
  mutate(code= na_if(code, "under treefall")) %>%
  mutate(code= na_if(code, "under fallen trunk")) %>%
  mutate(code = if_else(code == "under branch" | code == "under branch), must have lost tag",
                         "under branchfall (90)", code)) %>% 
  mutate(code= na_if(code, "under branch")) %>%
  mutate(code= na_if(code, "under branch, must have lost tag")) %>%
  mutate(code = if_else(code == "not on list","not on list (40)", code)) %>% 
  mutate(code= na_if(code, "not on list")) %>% 
  mutate(code = if_else(code == "missing","missing (60)", code)) %>% 
  mutate(code= na_if(code, "missing")) %>% 
  mutate(code = if_else(code== "ULY?","ULY (3)", code)) %>% 
  mutate(code= na_if(code, "ULY?")) %>% 
  mutate(code = if_else(code== "not on list. must be313","not on list (40)", code)) %>% 
  mutate(code = if_else(code== "not on list. must be96","not on list (40)", code)) %>% 
  mutate(code= na_if(code, "not on list. must be313")) %>% 
  mutate(code= na_if(code, "not on list. must be96")) %>% 
  mutate(code= na_if(code, "must be one of missing")) %>% 
  mutate(code = if_else(code== "Dead, Not on List","dead and not on list (100)", code)) %>% 
  mutate(code= if_else(code == "dead, not on list","dead and not on list (100)", code)) %>% 
  mutate(code= na_if(code, "Dead, Not on List")) %>% 
  mutate(code= na_if(code, "dead, not on list")) %>% 
  mutate(code= na_if(code, "could be one of missing")) %>% 
  mutate(code= na_if(code, "could be 1333")) %>% 
  mutate(code= na_if(code, "could be 378")) %>% 
  mutate(code= na_if(code, "could be 680?")) %>% 
  mutate(code= na_if(code, "must have lost tag")) %>% 
  mutate(code= na_if(code, "1 new infl + 1 old infl")) %>% 
  mutate(code= na_if(code, "1 old infl")) %>% 
  mutate(code= na_if(code, "2 old infl")) %>% 
  mutate(code= na_if(code, "2 old infls")) %>%
  mutate(code= na_if(code, "3 old infls")) %>%
  mutate(code= na_if(code, "actualkly in c8")) %>%
  mutate(code= na_if(code, "actually  B5")) %>%
  mutate(code= na_if(code, "actually in A6")) %>% 
  mutate(code= na_if(code, "should be c5")) %>%
  mutate(code= na_if(code, "this number belongs to a pvc in a6")) %>%
  mutate(code = if_else(code == "pvc stake not on list","not on list (40)", code)) %>% 
  mutate(code= na_if(code, "pvc stake not on list")) %>%
  # mutate(code= na_if(code, "pvc stake not on list")) %>%
  mutate(code= na_if(code, "its in C2")) %>%
  mutate(code= na_if(code, "e E6")) %>%
  mutate(code= na_if(code, ", must have lost tag")) %>%
  mutate(code= na_if(code, "3 old infl")) %>% 
  mutate(infl = if_else(infl=="0" & code == "1 new infl" , "1", infl)) %>% 
  mutate(code= na_if(code,"1 new infl")) %>% 
  mutate(code= na_if(code, "horrible treefall in plot")) %>%
  mutate(code= na_if(code, "treefall in plot")) %>%
  mutate(code= na_if(code, "horrible treefall in plot, can barely make it in")) %>%
  mutate(code= na_if(code, "lots of small branchfalls in plot")) %>%
  mutate(code= na_if(code, "plot is 50% treefall")) %>%
  mutate(code= na_if(code, "trefall")) 

    
levels(as.factor(ha_data$code))
levels(as.factor(ha_data$notes))

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
check_dupes(ha_data)

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
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants)) %>% 
  ungroup() %>% 
  summarize(total_plants=sum(N_plants))


ha_data <- ha_data %>% arrange(habitat, plot, plotID, bdffp_reserve_no, tag_number, row, column, year)

summary(ha_data)
write_csv(ha_data, "./data_clean/Ha_survey_pre_submission.csv")


summary(as.factor(ha_data$code))


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

#TODO: Check misc code to see which ones repro need to be updated

# Duplicated tag numbers to check in the field ----------------------------
# 2107
# 237: one in C8, one in D6


# Be sure to delete the ones for which there are no data after being marked dead (see dy in zombies.R)


# 2018
# TODO: track down these marked and mapped in 07/08
# look for them in plant_id_07 for plants 1609 and 1629
filter(ha_data, tag_number == 1705 & plot == 5756)
filter(ha_data, tag_number == 1710 & plot == 5756)


