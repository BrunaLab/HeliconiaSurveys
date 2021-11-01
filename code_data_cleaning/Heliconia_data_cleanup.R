
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

# ha_data$code_2005[ha_data$plot == "Florestal-CF" & 
#                      ha_data$tag_number == "1"] <- 60
ha_data$code[ha_data$plot == 'Florestal-CF' &
               (ha_data$year == 2005 |ha_data$year == 2006|ha_data$year == 2007) &
               ha_data$tag_number == 277] <- NA
ha_data$shts[ha_data$plot == 'Florestal-CF' &
               ha_data$year == 2004 &
               ha_data$tag_number == 277] <- NA
ha_data$ht[ha_data$plot == 'Florestal-CF' &
               ha_data$year == 2004 &
               ha_data$tag_number == 277] <- NA
ha_data$infl[ha_data$plot == 'Florestal-CF' &
             ha_data$year == 2004 &
             ha_data$tag_number == 277] <- NA


ha_data$code[ha_data$plot == 'Florestal-CF' &
                  ha_data$year == 2005 &
                  ha_data$tag_number == 1] <- "missing (60)"


ha_data$code[ha_data$plot == 'Florestal-CF' &
                     ha_data$year == 2004 &
                     ha_data$tag_number == 1508] <- "missing (60)"


ha_data$code[ha_data$plot == 'Florestal-CF' &
                     ha_data$year == 2004 &
                     ha_data$tag_number == 1508] <- "missing (60)"


ha_data$code[ha_data$plot == 'Florestal-CF' &
                     ha_data$year == 2005 &
                     ha_data$tag_number == 1508] <- "missing (60)"


ha_data$code[ha_data$plot == 'Florestal-CF' &
                     ha_data$year == 2004 &
                     ha_data$tag_number == 799] <- "missing (60)"

ha_data$code[ha_data$plot == 'Florestal-CF' &
                     ha_data$year == 2005 &
                     ha_data$tag_number == 799] <- "missing (60)"

# correcting location
ha_data$column[ha_data$plot == "Florestal-CF" & ha_data$column == 0] <- 1


# plant size entered incorrectly (entered as 449, should be 49)
ha_data$ht[ha_data$plot == "Florestal-CF" & 
             ha_data$year == 2003 &
             ha_data$tag_number == 590] <- 49

# incorrectly recorded as seedling
ha_data$code[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2008 & 
               ha_data$tag_number == 1916] <- "ULY (3)"

# incorrectly recorded the ht as 73 (it is 7.3). Rounded down.
ha_data$ht[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2001 & 
               ha_data$tag_number == 967] <- 7

# incorrectly recorded as seedling
ha_data$code[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2007 & 
               ha_data$tag_number == 378] <- "ULY (3)"

# incorrectly recorded as seedling
ha_data$code[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2007 & 
               ha_data$tag_number == 378] <- "ULY (3)"

# incorrectly recorded as seedling ("nova com cara de velha")
ha_data$code[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2007 & 
               ha_data$tag_number == 1578] <- "ULY (3)"

# correction (found after referring to the datasheet to fix 378 above)
ha_data$shts[ha_data$plot == "Florestal-CF" &
             ha_data$year == 2007 & 
             ha_data$tag_number == 1290] <- 2
ha_data$ht[ha_data$plot == "Florestal-CF" &
               ha_data$year == 2007 & 
               ha_data$tag_number == 1290] <- 16
ha_data$code[ha_data$plot == "Florestal-CF" &
              ha_data$year == 2007 & 
              ha_data$tag_number == 1290] <- NA


# corrections 5750 --------------------------------------------------------

# Some of the plants in 5750 were put as Row "L" because he thought they might be
# just outside the plot. I converted to J.
ha_data$row[ha_data$plot == "5750" & ha_data$row == "L"] <- "J"

# If you want to convert these to 0 to say they are inside the plot,
# then uncomment these two lines
# ha_data$x_09[ha_data$x_09 < 1] <- 0
# ha_data$y_09[ha_data$x_09 < 1] <- 0

# Plant 236 - add code for year it's missing, delete the plot
# it duplicate numbers, delete incorrect plot
ha_data$code[ha_data$plot == 5750 &
  ha_data$year == 2006 &
  ha_data$tag_number == 236] <- "missing (60)"
ha_data$code[ha_data$plot == 5750 &
  ha_data$year == 2008 &
  ha_data$tag_number == 236] <- "missing (60)"
ha_data$code[ha_data$plot == 5750 &
  ha_data$year == 2009 &
  ha_data$tag_number == 236] <- "missing (60)"
ha_data$shts[ha_data$plot == 5750 &
  ha_data$year == 2007 &
  ha_data$tag_number == 236] <- 1
ha_data$ht[ha_data$plot == 5750 &
  ha_data$year == 2007 &
  ha_data$tag_number == 236] <- 10
# delete the duplicate
to_delete <- ha_data %>%
  filter(plot == 5750 &
    tag_number == 236 &
    row == "G" &
    column == 9)
ha_data <- anti_join(ha_data, to_delete)
rm(to_delete)

# Updating Codes 
ha_data$code[ha_data$plot == "5750" & ha_data$year == 2005 & ha_data$tag_number == 864] <- "missing (60)"

ha_data$code[ha_data$plot == 5750 &
               (ha_data$year == 2005 | ha_data$year == 2006 | ha_data$year == 2007) & 
               ha_data$tag_number == 101] <- NA
ha_data$ht[ha_data$plot == 5750 &
               ha_data$year == 2004 & 
               ha_data$tag_number == 101] <- NA

ha_data$shts[ha_data$plot == 5750 &
             ha_data$year == 2004 & 
             ha_data$tag_number == 101] <- NA

ha_data$infl[ha_data$plot == 5750 &
               ha_data$year == 2004 & 
               ha_data$tag_number == 101] <- NA

# incorrectly recorded as seedling
ha_data$code[ha_data$plot == 5750 &
               ha_data$year == 2009 & 
               ha_data$tag_number == 2341] <- "ULY (3)"

# incorrectly recorded as seedling
ha_data$code[ha_data$plot == 5750 &
               ha_data$year == 2007 & 
               ha_data$tag_number == 2061] <- "ULY (3)"

# location
ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 962] <- 6
ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 977] <- 10
ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1133] <- "G"
ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1133] <- 6
ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1135] <- "G"
ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1135] <- 6
ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1280] <- "J"
ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1284] <- "J"
ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1577] <- 6
ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1778] <- 10
ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1790] <- 10
ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1836] <- "J"
ha_data$column[ha_data$plot == "5750" & ha_data$HA_ID_Number == 2149] <- 6
ha_data$row[ha_data$plot == "5750" & ha_data$HA_ID_Number == 1602] <- "J"


# 5750
# tag_no 988
# ha_data$ht[ha_data$plot=="5750" & ha_data$year==2007 & ha_data$tag_number==988] <-38
# ha_data$shts[ha_data$plot=="5750" & ha_data$year==2007 & ha_data$tag_number==988] <-3
# ha_data$code[ha_data$plot=="5750" & ha_data$year==2007 & ha_data$tag_number==988] <- NA
# ha_data$ht[ha_data$plot=="5750" & ha_data$year==2008 & ha_data$tag_number==988] <-60
# ha_data$shts[ha_data$plot=="5750" & ha_data$year==2008 & ha_data$tag_number==988] <-2
# ha_data$ht[ha_data$plot=="5750" & ha_data$year==2009 & ha_data$tag_number==988] <-66
# ha_data$shts[ha_data$plot=="5750" & ha_data$year==2009 & ha_data$tag_number==988] <-3




# corrections 5756 --------------------------------------------------------
ha_data$code[ha_data$plot == '5756' &
               (ha_data$year == 2005 |ha_data$year == 2006|ha_data$year == 2007) &
               ha_data$tag_number == 983] <- NA
ha_data$shts[ha_data$plot == '5756' &
               ha_data$year == 2004 &
               ha_data$tag_number == 983] <- NA
ha_data$ht[ha_data$plot == '5756' &
             ha_data$year == 2004 &
             ha_data$tag_number == 983] <- NA
ha_data$infl[ha_data$plot == '5756' &
               ha_data$year == 2004 &
               ha_data$tag_number == 983] <- NA

ha_data$code[ha_data$plot == '5756' &
               (ha_data$year == 2005 |ha_data$year == 2006) &
               ha_data$tag_number == 7] <- NA
ha_data$shts[ha_data$plot == '5756' &
               ha_data$year == 2004 &
               ha_data$tag_number == 7] <- NA
ha_data$ht[ha_data$plot == '5756' &
             ha_data$year == 2004 &
             ha_data$tag_number == 7] <- NA
ha_data$infl[ha_data$plot == '5756' &
               ha_data$year == 2004 &
               ha_data$tag_number == 7] <- NA

# tag no. 793
ha_data$code[ha_data$plot == 5756 &
  (ha_data$year == 2005 |
    ha_data$year == 2006) &
  ha_data$tag_number == 793] <- "missing (60)"

# Tag 372
ha_data$ht[ha_data$plot == "5756" & ha_data$year == 2005 & ha_data$tag_number == 372] <- 26
# TODO: did this one change tag numbers? 2x

# Tag 1616
ha_data$ht[ha_data$plot == "5756" & ha_data$year == 2004 & ha_data$tag_number == 1616] <- 77
ha_data$shts[ha_data$plot == "5756" & ha_data$year == 2004 & ha_data$tag_number == 1616] <- 4
ha_data$code[ha_data$plot == 5756 &
  (ha_data$year == 2005 | ha_data$year == 2006) &
  ha_data$tag_number == 1616] <- "missing (60)"
# TODO: figure out which of the plants in the plot this is - tags lost in tfall
# in the first yr this showed up

# Plant 933
ha_data$HA_ID_Number <- as.character(ha_data$HA_ID_Number)
ha_data <- ha_data %>%
  mutate(HA_ID_Number = if_else((plot == 5756 & tag_number == 933 & year < 2006), "4733.1", HA_ID_Number)) %>%
  mutate(HA_ID_Number = if_else((plot == 5756 & tag_number == 933 & year > 2005), "4733.2", HA_ID_Number))


# %>%
# mutate(tag_number = if_else((plot==5756 & tag_number==933 & year < 2006),
# 933.1,tag_number)) %>%
# mutate(tag_number = if_else((plot==5756 & tag_number==933 & year > 2005),
# 933.2,tag_number))

# Plant 929
# 929 in C8 is a renumber after tag was lost, I think it was written down
# incorrectly and needs to be 2x in field
ha_data$code[ha_data$plot == "5756" &
  ha_data$year == 2007 &
  ha_data$row == "C" &
  ha_data$column == 8 &
  ha_data$tag_number == 929] <- "ULY (3)"

# Plant 816
# 816 in D9 is a renumber after tag was lost, I think it was written down
# incorrectly and needs to be 2x in field
ha_data$code[ha_data$plot == "5756" &
  ha_data$year == 2009 &
  ha_data$row == "D" &
  ha_data$column == 9 &
  ha_data$tag_number == 816] <- "ULY (3)"

# tag no 29
# 29 in 5756 was actually in E3, and was retagged as 1663 in 07
ha_data <- ha_data %>%
  mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 1998), 54, ht)) %>%
  mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 1999), 56, ht)) %>%
  mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2000), 96, ht)) %>%
  mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2001), 79, ht)) %>%
  mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2002), 67, ht)) %>%
  mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2003), 55, ht)) %>%
  mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2004), 52, ht)) %>%
  mutate(ht = if_else((plot == 5756 & tag_number == 1663 & year == 2005), 15, ht)) %>%
  mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 1998), 2, shts)) %>%
  mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 1999), 4, shts)) %>%
  mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2000), 5, shts)) %>%
  mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2001), 9, shts)) %>%
  mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2002), 5, shts)) %>%
  mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2003), 3, shts)) %>%
  mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2004), 3, shts)) %>%
  mutate(shts = if_else((plot == 5756 & tag_number == 1663 & year == 2005), 2, shts))
ha_data$code[ha_data$plot == "5756" &
  (ha_data$year == 2005 |
    ha_data$year == 2006) &
  ha_data$tag_number == 1663] <- NA
to_delete <- ha_data %>%
  filter(plot == "5756" &
    tag_number == 29 &
    row == "E" &
    column == 3)
ha_data <- anti_join(ha_data, to_delete)
rm(to_delete)

# tag_no 1602
ha_data <- ha_data[!(ha_data$plot == "5756" &
  ha_data$tag_number == 1602 &
  ha_data$row == "A" &
  ha_data$column == 9), ]

# Updating Codes 
ha_data$code[ha_data$plot == "5756" &
                     ha_data$year == 2006 &
                     ha_data$tag_number == 1261] <- "missing (60)"

ha_data$code[ha_data$plot == "5756" &
                     ha_data$year == 2005 &
                     ha_data$tag_number == 1292] <- "missing (60)"

ha_data$code[ha_data$plot == "5756" &
                     ha_data$year == 2006 &
                     ha_data$tag_number == 1294] <- "missing (60)"

ha_data$code[ha_data$plot == "5756" &
                     ha_data$year == 2005 &
                     ha_data$tag_number == 141] <- "missing (60)"

ha_data$code[ha_data$plot == "5756" &
                     ha_data$year == 2006 &
                     ha_data$tag_number == 690] <- "missing (60)"

ha_data$code[ha_data$plot == "5756" &
                     ha_data$year == 2004 &
                     ha_data$tag_number == 707] <- "missing (60)"

ha_data$code[ha_data$plot == "5756" &
                     ha_data$year == 2005 &
                     ha_data$tag_number == 707] <- "missing (60)"

ha_data$code[ha_data$plot == "5756" &
                     ha_data$year == 2006 &
                     ha_data$tag_number == 707] <- "missing (60)"

ha_data$code[ha_data$plot == "5756" &
                     ha_data$year == 2006 &
                     ha_data$tag_number == 50] <- "under treefall (80)"

# incorrectly recorded 10 infl in 2007, should be NA
ha_data$infl[ha_data$plot == "5756" &
                     ha_data$year == 2007 &
                     ha_data$tag_number == 403] <- NA

# incorrectly recorded as seedling
# upon 2x of data sheet found it also had infl
ha_data$code[ha_data$plot == 5756 &
               ha_data$year == 2008 & 
               ha_data$tag_number == 1789] <- "ULY (3)"

ha_data$infl[ha_data$plot == 5756 &
               ha_data$year == 2008 & 
               ha_data$tag_number == 1789] <- 1

# something happened in 2005 with 332 and 933 in A7.  332 was reported missing,
# 933 was reported dead. Subsequent years have plant 933 (which should be dead) 
# with size measurements that are clearly 332. I think someone changed the tag 
# without noting it, otherwise the subsequent years would have discovered the 
# issue I am changing 993->933.1 and 332->933.2 until a field 2x can be conducted.
ha_data$tag_number[ha_data$plot == 5756 &
               ha_data$row == "A" & 
               ha_data$column == "7" & 
               ha_data$tag_number == 332] <- 933.2

ha_data$tag_number[ha_data$plot == 5756 &
                     ha_data$row == "A" & 
                     ha_data$column == "7" & 
                     ha_data$tag_number == 933] <- 933.1

ha_data$tag_number[ha_data$plot == 5756 &
                     ha_data$row == "A" & 
                     ha_data$column == "7" & 
                     (ha_data$year == 2006 |ha_data$year == 2007 |
                        ha_data$year == 2008 |ha_data$year == 2009 ) & 
                     ha_data$tag_number == 933.1] <- 933.2

# No idea what 816 in D9 is - big and late to be ULY, no match for missing.
# Maybe a tage replacement with the old tag? Will mark as 816.2 and 
# note for field 2x
ha_data$tag_number[ha_data$plot == 5756 &
                     ha_data$row == "D" & 
                     ha_data$column == "9" & 
                     ha_data$tag_number == 816] <- 816.2

# # 919 to 1760 (with a year incorrectly recorded as 929)
# delete the years no longer needed
ha_data<-ha_data[!(ha_data$plot==5756 &
                     (ha_data$year==2008 | ha_data$year==2009) &
                     ha_data$tag_number==919),]
# Add correct shts, height,code in 2007 (incorrectly recorded as 929)
ha_data$shts[ha_data$plot == 5756 &
               ha_data$row == "C" &
               ha_data$column == "8" &
               ha_data$year == 2007 &
               ha_data$tag_number == 919] <- 1
ha_data$ht[ha_data$plot == 5756 &
               ha_data$row == "C" &
               ha_data$column == "8" &
               ha_data$year == 2007 &
               ha_data$tag_number == 919] <- 17
ha_data$code[ha_data$plot == 5756 &
             ha_data$row == "C" &
             ha_data$column == "8" &
             ha_data$year == 2007 &
             ha_data$tag_number == 919] <- NA
# delete the incorrectly noted 929 (should have been 919)
ha_data<-ha_data[!(ha_data$plot==5756 &
                     (ha_data$column==8 & ha_data$row=="C") &
                     ha_data$tag_number==929),]
# remove the years form 1760, we will replace with the ones from 919
ha_data<-ha_data[!(ha_data$plot==5756 &
                     ha_data$column==8 & 
                     ha_data$row=="C" &
                     (ha_data$year == 1998 |ha_data$year == 1999 |
                        ha_data$year == 2000 |ha_data$year == 2001 |
                        ha_data$year == 2002 |ha_data$year == 2003 |
                        ha_data$year == 2004 |ha_data$year == 2005 |
                        ha_data$year == 2006 |ha_data$year == 2007 ) &
                     ha_data$tag_number==1760),]
#change the code on 1760
ha_data$code[ha_data$plot == 5756 &
               ha_data$row == "C" &
               ha_data$column == "8" &
               ha_data$year == 2008 &
               ha_data$tag_number == 1760] <- NA
# convert the 919 to the new tag nmumber of 1760
ha_data$tag_number[ha_data$plot == 5756 &
                     ha_data$row == "C" &
                     ha_data$column == "8" &
                     ha_data$tag_number == 919] <- 1760
# change the y coordinate
ha_data$y_09[ha_data$plot == 5756 &
                     ha_data$row == "C" &
                     ha_data$column == "8" &
                     ha_data$tag_number == 1760] <- 2.4
# 

# Corrections Dimona-CF ---------------------------------------------------

ha_data$column[ha_data$plot == "Dimona-CF" & ha_data$column == 11] <- 10

# plant 81 was not dead in 06
ha_data$code[ha_data$plot == "Dimona-CF" &
  ha_data$tag_number == 81 &
  ha_data$year == 2006] <- "missing (60)"

ha_data$code[ha_data$plot == "Dimona-CF" &
  ha_data$tag_number == 81 &
  ha_data$year == 2008] <- "missing (60)"

ha_data$code[ha_data$plot == "Dimona-CF" &
  ha_data$tag_number == 81 &
  ha_data$year == 2009] <- "missing (60)"

# location
ha_data$row[ha_data$plot == "Dimona-CF" & ha_data$HA_ID_Number == 5662] <- "E"
ha_data$column[ha_data$plot == "Dimona-CF" & ha_data$HA_ID_Number == 5739] <- 10
ha_data$column[ha_data$plot == "Dimona-CF" & ha_data$HA_ID_Number == 5762] <- 10


# Corrections 5753 --------------------------------------------------------

# Tag no. 108
ha_data$code[ha_data$plot == 5753 & ha_data$tag_number == 108 & ha_data$year == 2005] <- NA

# tag_no 841
ha_data <- ha_data[!(ha_data$plot == 5753 & ha_data$tag_number == 319 & ha_data$row == "D"), ]

# Status plant 412 in 2005
ha_data$code[ha_data$plot == 5753 &
  ha_data$year == 2005 &
  ha_data$tag_number == 412] <- "missing (60)"

ha_data$code[ha_data$plot == 5753 &
                     ha_data$year == 2005 &
                     ha_data$tag_number == 268] <- "missing (60)"

ha_data$code[ha_data$plot == 5753 &
                     ha_data$year == 2005 &
                     ha_data$tag_number == 276] <- "missing (60)"

ha_data$code[ha_data$plot == 5753 &
                     ha_data$year == 2005 &
                     ha_data$tag_number == 292] <- "missing (60)"

ha_data$code[ha_data$plot == 5753 &
                     ha_data$year == 2006 &
                     ha_data$tag_number == 34] <- "missing (60)"

ha_data$code[ha_data$plot == 5753 &
                     ha_data$year == 2006 &
                     ha_data$tag_number == 52] <- "missing (60)"

ha_data$code[ha_data$plot == 5753 &
                     ha_data$year == 2007 &
                     ha_data$tag_number == 34] <- "missing (60)"

ha_data$code[ha_data$plot == 5753 &
                     ha_data$year == 2008 &
                     ha_data$tag_number == 345] <- "missing (60)"

ha_data$code[ha_data$plot == 5753 &
                     ha_data$year == 2008 &
                     ha_data$tag_number == 412] <- "missing (60)"

# incorrectly recorded as seedling
ha_data$code[ha_data$plot == 5753 &
               ha_data$year == 2006 & 
               ha_data$tag_number == 404] <- "under branchfall (90)"

# Corrections 5754 (PA10) -------------------------------------------------

# plant size entered incorrectly (entered as 997, should be 97)
ha_data$ht[ha_data$plot == "5754" & ha_data$year == 2006 & ha_data$tag_number == 445] <- 97

# removing the code that was resulting in zombie
ha_data$code[ha_data$plot == 5754 &
               ha_data$row == "B" &
               ha_data$column == "7" &
               ha_data$year == 2006 &
               ha_data$tag_number == 823.7] <- NA

# 823 and 824 were marked dead, but I think that was because they were on the B7/C7
# border and not found when surveying B7. For not the "Dead" is being removed, and 
# and both are being placed in C7, with numbers corrected
ha_data$code[ha_data$plot == 5754 &
               ha_data$row == "B" &
               ha_data$column == "7" &
               ha_data$year == 2004 &
               ha_data$tag_number == 823.7] <- NA

ha_data$code[ha_data$plot == 5754 &
               ha_data$row == "B" &
               ha_data$column == "7" &
               ha_data$year == 2004 &
               ha_data$tag_number == 824.7] <- NA

# removing the ULY codes
ha_data$code[ha_data$plot == 5754 &
               ha_data$row == "C" &
               ha_data$column == "7" &
               ha_data$year == 2006 &
               ha_data$tag_number == 824.7] <- NA

ha_data$code[ha_data$plot == 5754 &
               ha_data$row == "C" &
               ha_data$column == "7" &
               ha_data$year == 2006 &
               ha_data$tag_number == 823.7] <- NA

# replace the values for the 1st year 
ha_data$shts[ha_data$plot == 5754 &
               (ha_data$row == "C" & ha_data$column == "7") &
               ha_data$year == 2003 &
               (ha_data$tag_number == 823.7|ha_data$tag_number == 824.7)] <- 1
ha_data$ht[ha_data$plot == 5754 &
               (ha_data$row == "C" & ha_data$column == "7") &
               ha_data$year == 2003 &
               (ha_data$tag_number == 823.7|ha_data$tag_number == 824.7)] <- 1
ha_data$code[ha_data$plot == 5754 &
             (ha_data$row == "C" & ha_data$column == "7") &
             ha_data$year == 2003 &
             (ha_data$tag_number == 823.7|ha_data$tag_number == 824.7)] <- "sdlg (1)"

# delete the duplicates
ha_data<-ha_data[!(ha_data$plot==5754 & 
                     ha_data$row=="B" & 
                     ha_data$column==7 &
                     ha_data$tag_number == 823.7),]

ha_data<-ha_data[!(ha_data$plot==5754 & 
                     ha_data$row=="B" & 
                     ha_data$column==7 &
                     ha_data$tag_number == 824.7),]
# correct the number
# str(ha_data$tag_number)
ha_data<-ha_data %>% 
  mutate(tag_number = ifelse(plot==5754 & tag_number == 824.7, 824, tag_number))

ha_data<-ha_data %>% 
  mutate(tag_number = ifelse(plot==5754 & tag_number == 823.7,823, tag_number))

# Corrections 5751 --------------------------------------------------------

# 395 incorrectly entered as 365
to_delete <- ha_data %>%
  filter(plot == "5751" &
    tag_number == 365 &
    row == "D" &
    column == 5)
ha_data <- anti_join(ha_data, to_delete)
rm(to_delete)
ha_data$ht[ha_data$plot == "5751" & ha_data$year == 2008 & ha_data$tag_number == 395] <- 40
ha_data$shts[ha_data$plot == "5751" & ha_data$year == 2008 & ha_data$tag_number == 395] <- 3


ha_data$code[ha_data$plot == "5751" &
                     ha_data$year == 2004 &
                     ha_data$tag_number == 128] <- "missing (60)"

ha_data$code[ha_data$plot == "5751" &
                     ha_data$year == 2005 &
                     ha_data$tag_number == 128] <- "missing (60)"

# location
ha_data$column[ha_data$plot == "5751" & ha_data$column == 0] <- 1


# Corrections 2108 --------------------------------------------------------

#TODO:

# 33 was missing in a treefall in 2003 
# in 2004 a plant was found iunder treefall and recorded as 227
# in 2005 the 227 tag was replaced and recorded as 240 BUT it was actually 249
# That's because 240 was a seedling marked in e8 in 2004
# in all subsequent years 240 in this plot is missing and 249 is correct in this plot,
# 240 should be in e8

move33<-ha_data %>% filter(plot == 2108 & tag_number == 33) %>% 
  filter(is.na(shts)==FALSE) %>% 
  mutate(tag_number=249) %>% 
  select(plot,tag_number, year,shts,ht)


ha_data$shts[ha_data$plot == 2108 & ha_data$year == 1998 & ha_data$tag_number == 249] <- 2
ha_data$shts[ha_data$plot == 2108 & ha_data$year == 1999 & ha_data$tag_number == 249] <- 2
ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2000 & ha_data$tag_number == 249] <- 3
ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2001 & ha_data$tag_number == 249] <- 4
ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2002 & ha_data$tag_number == 249] <- 5

ha_data$ht[ha_data$plot == 2108 & ha_data$year == 1998 & ha_data$tag_number == 249] <- 50
ha_data$ht[ha_data$plot == 2108 & ha_data$year == 1999 & ha_data$tag_number == 249] <- 52
ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2000 & ha_data$tag_number == 249] <- 57
ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2001 & ha_data$tag_number == 249] <- 83
ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2002 & ha_data$tag_number == 249] <- 120


omit33<-ha_data %>% filter(plot==2108 & tag_number==33)
ha_data<-anti_join(ha_data,omit33)
rm(move33,omit33)
ha_data$code[ha_data$plot == 2108 & 
               ha_data$year == 2006 & ha_data$tag_number == 249] <- NA

ha_data$code[ha_data$plot == 2108 & 
               ha_data$year == 2004 & ha_data$tag_number == 249] <- NA

ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2004 & ha_data$tag_number == 249] <- 5
ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2004 & ha_data$tag_number == 249] <- 128
ha_data$code[ha_data$plot == 2108 & ha_data$year == 2004 & ha_data$tag_number == 249] <- "under treefall (80)"

ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2005 & ha_data$tag_number == 249] <- 7
ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2005 & ha_data$tag_number == 249] <- 140
ha_data$code[ha_data$plot == 2108 & ha_data$year == 2005 & ha_data$tag_number == 249] <- NA

ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2008 & ha_data$tag_number == 249] <- 1
ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2008 & ha_data$tag_number == 249] <- 35
ha_data$code[ha_data$plot == 2108 & ha_data$year == 2008 & ha_data$tag_number == 249] <- NA


# Adding the year that was missing for 240
ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2005 & ha_data$tag_number == 240] <- 2
ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2005 & ha_data$tag_number == 240] <- 22
ha_data$code[ha_data$plot == 2108 & ha_data$year == 2005 & ha_data$tag_number == 240] <- NA

# 17 plot corrected but failed to correct on datasheet
ha_data$code[ha_data$plot == 2108 & ha_data$year == 2006 & ha_data$tag_number == 17] <- NA

ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2006 & ha_data$tag_number == 17] <- 0
ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2006 & ha_data$tag_number == 17] <- 0

ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2007 & ha_data$tag_number == 17] <- 16
ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2007 & ha_data$tag_number == 17] <- 1

ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2008 & ha_data$tag_number == 17] <- 11
ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2008 & ha_data$tag_number == 17] <- 1

ha_data$ht[ha_data$plot == 2108 & ha_data$year == 2009 & ha_data$tag_number == 17] <- 13
ha_data$shts[ha_data$plot == 2108 & ha_data$year == 2009 & ha_data$tag_number == 17] <- 1

ha_data$x_09[ha_data$plot == 2108 & ha_data$column == 7 & ha_data$tag_number == 17] <- 0.1
ha_data$y_09[ha_data$plot == 2108 & ha_data$column == 7 & ha_data$tag_number == 17] <- 2.60

# delete the duplicate
to_delete <- ha_data %>%
  filter(plot == 2108 &
    tag_number == 17 &
    row == "A" &
    column == 4)
ha_data <- anti_join(ha_data, to_delete)
rm(to_delete)
# correct the plot
ha_data$column[ha_data$plot == 2108 & ha_data$column == 7 & ha_data$tag_number == 17] <- 6


# tag_no 66
# Correct the value for C9
ha_data$ht[ha_data$plot == "2108" & ha_data$year == 1999 & ha_data$tag_number == 66] <- 13
ha_data$shts[ha_data$plot == "2108" & ha_data$year == 1999 & ha_data$tag_number == 66] <- 1
ha_data$code[ha_data$plot == "2108" & ha_data$year == 1999 & ha_data$tag_number == 66] <- NA
# delete the value for D10
ha_data <- ha_data[!(ha_data$plot == "2108" & ha_data$row == "D" & ha_data$tag_number == 66), ]


# location
ha_data$row[ha_data$plot == "2108" & ha_data$HA_ID_Number == 504] <- "E"

# Updating Codes 
# Plant 293: code say 'ULY (3)' in 2008, it's not. replace this with NA
ha_data$code[ha_data$plot == "2108" & ha_data$year == 2008 & ha_data$tag_number == 293] <- NA
# Plant 293: code say 'dead (2)' in 2009, it's not. replace this with NA
ha_data$code[ha_data$plot == "2108" & ha_data$year == 2009 & ha_data$tag_number == 293] <- NA


# Corrections 2017 --------------------------------------------------------

# Plant 237 in D6 is actually 337. The actual 237 is in C8
ha_data$tag_number[ha_data$plot == 2107 &
  ha_data$row == "D" &
  ha_data$column == 6 &
  ha_data$tag_number == 237] <- 337

# ha_data %>% filter((tag_number==68 | tag_number==275), bdffp_reserve_no==2107) %>% 
#   select(year, shts, ht, infl) %>% 
#   pivot_wider(names_from=tag_number, values_from=shts:infl) %>% 
#   mutate()

# tags 68/275
# source <- which(ha_data$tag_number == 68 & ha_data$bdffp_reserve_no == "2107")
# destination <- which(ha_data$tag_number == 275 & ha_data$bdffp_reserve_no == "2107")
# ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# Updating Codes 
# Plant 228: code say 'dead (2)' in 2006, should be missing (60)
ha_data$code[ha_data$plot == 2107 &
                     ha_data$year == 2006 &
                     ha_data$tag_number == 228] <- "missing (60)"

# Plant 282: code say 'dead (2)' in 2006, should be missing (60)
ha_data$code[ha_data$plot == 2107 &
                     ha_data$year == 2006 &
                     ha_data$tag_number == 282] <- "missing (60)"


# Corrections CaboFrio-CF -------------------------------------------------

# tag no. 2121
# create the correct values
correct_2121 <- ha_data %>%
  filter(plot == "CaboFrio-CF", tag_number == 2121) %>%
  group_by(year) %>%
  slice(1) %>%
  mutate(ht = if_else(year == 2009, 6, ht)) %>%
  mutate(shts = if_else(year == 2009, 1, shts)) %>%
  mutate(code = ifelse(year == 2009, NA, code))
# remove the duplicates from the original df
ha_data <- ha_data[!(ha_data$plot == "CaboFrio-CF" & ha_data$tag_number == 2121), ]
# re-insert them
str(ha_data$code)
str(correct_2121$code)
ha_data <- bind_rows(ha_data, correct_2121)
rm(correct_2121)

# location
ha_data$row[ha_data$plot == "CaboFrio-CF" & ha_data$HA_ID_Number == 5211] <- "E"
ha_data$row[ha_data$plot == "CaboFrio-CF" & ha_data$HA_ID_Number == 5303] <- "E"

# Corrections 5752  -------------------------------------------------------

# tag no. 181
# create the correct values
correct_181 <- ha_data %>%
  filter(plot == "5752", tag_number == 181) %>%
  group_by(year) %>%
  slice(1) %>%
  mutate(ht = if_else(year == 2006, 110, ht)) %>%
  mutate(shts = if_else(year == 2006, 3, shts)) %>%
  mutate(code = ifelse(year == 2006, NA, code))
# remove the duplicates from the original df
ha_data <- ha_data[!(ha_data$plot == "5752" & ha_data$tag_number == 181), ]
# re-insert them
ha_data <- bind_rows(ha_data, correct_181)
rm(correct_181)

# tag no. 526
# create the correct values
correct_526 <- ha_data %>%
  filter(plot == "5752", tag_number == 526) %>%
  group_by(year) %>%
  slice(1) %>%
  mutate(ht = if_else(year == 2006, 14, ht)) %>%
  mutate(shts = if_else(year == 2006, 3, shts)) %>%
  mutate(code = ifelse(year == 2006, NA, code))
# remove the duplicates from the original df
ha_data <- ha_data[!(ha_data$plot == "5752" & ha_data$tag_number == 526), ]
# re-insert them
ha_data <- bind_rows(ha_data, correct_526)
rm(correct_526)

ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 149] <- "missing (60)"
ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 499] <- "missing (60)"
ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 272] <- "missing (60)"
ha_data$code[ha_data$plot == 5752 & ha_data$year == 2005 & ha_data$tag_number == 736] <- "missing (60)"

# incorrectly recorded as seedling
ha_data$code[ha_data$plot == 5752 &
               ha_data$year == 1999 & 
               ha_data$tag_number == 378] <- "ULY (3)"


# Corrections - Porto Alegre CF -------------------------------------------
ha_data$code[ha_data$plot == "PortoAlegre-CF" & ha_data$year == 2004 & ha_data$tag_number == 196] <- "missing (60)"
ha_data$code[ha_data$plot == "PortoAlegre-CF" & ha_data$year == 2005 & ha_data$tag_number == 196] <- "missing (60)"
ha_data$code[ha_data$plot == "PortoAlegre-CF" & ha_data$year == 2006 & ha_data$tag_number == 238] <- "missing (60)"
ha_data$code[ha_data$plot == "PortoAlegre-CF" & ha_data$year == 2005 & ha_data$tag_number == 139] <- "missing (60)"
ha_data$code[ha_data$plot == "PortoAlegre-CF" & ha_data$year == 2006 & ha_data$tag_number == 139] <- "missing (60)"

# Remove duplicated record 
ha_data<-ha_data[
  (ha_data$plot != "PortoAlegre-CF") | 
    (ha_data$tag_number != "264") |
    (ha_data$row != "C") |
    (ha_data$column != 10)
    , ]

# Corrections - PA10 ------------------------------------------------------

# which(ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==98 & ha_data$year==2006 & ha_data$row=="E")
# ha_data[92607,]
ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==88 & ha_data$year==2005 & ha_data$row=="A"] <- 2
ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==88 & ha_data$year==2006 & ha_data$row=="A"] <- NA
ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==98 & ha_data$year==2006 & ha_data$row=="E"] <- NA
ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==134 & ha_data$year==2005 & ha_data$row=="A"] <- 1
ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==134 & ha_data$year==2006 & ha_data$row=="A"] <- NA
ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==171 & ha_data$year==2005 & ha_data$row=="B"] <- 1
ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==171 & ha_data$year==2006 & ha_data$row=="B"] <- 1
ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==171 & ha_data$year==2006 & ha_data$row=="B"] <- NA
ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==243 & ha_data$year==2006 & ha_data$row=="E"] <- NA
ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==245 & ha_data$year==2005 & ha_data$row=="A"] <- 3
ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==245 & ha_data$year==2006 & ha_data$row=="A"] <- NA
ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==272  & ha_data$year==2006 & ha_data$row=="C"] <- NA
ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==318 & ha_data$column==5 & ha_data$row=="D"] <- "318X"
ha_data <- ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==318 & row=="D"))
ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==371 & ha_data$year==2006 & ha_data$row=="A"] <- 1
ha_data$notes[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==371 & ha_data$year==2006 & ha_data$row=="A"] <- NA
ha_data$column[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==382 & ha_data$column==5.875 & ha_data$row=="C"] <- 5
ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==382 & ha_data$column==5 & ha_data$year==2006] <- 70
ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==382 & ha_data$column==5 & ha_data$year==2006] <- 6
ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==382 & row=="C" & column==6))
ha_data$shts[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770 & ha_data$column==3 & ha_data$row=="A" & ha_data$year==2005] <- 1
ha_data$ht[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770 & ha_data$column==3 & ha_data$row=="A" & ha_data$year==2005] <- 8
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==770 & ha_data$column==3 & ha_data$row=="A" & ha_data$year==2005] <- "sdlg (1)"
ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==770 & row=="A" & column==5))
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==780 & ha_data$column==7 & ha_data$row=="C" & ha_data$year==2006] <- NA
ha_data$column[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==780 & ha_data$column==7 & ha_data$row=="C" & ha_data$year==2006] <- 8
ha_data<-ha_data %>% filter(!(bdffp_reserve_no=="3209" & tag_number==780 & row=="C" & column==7))
ha_data$column[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==780 & ha_data$column==7.25 & ha_data$row=="C"] <- 8
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==812 & ha_data$column==9 & ha_data$row=="D" & ha_data$year==2006] <- NA
ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==812 & ha_data$column==9 & ha_data$row=="D"] <- "812X"
ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==813 & ha_data$column==9 & ha_data$row=="A"] <- "813X"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==813 & ha_data$column==5 & ha_data$row=="A" & ha_data$year==2006] <- NA
ha_data$infl[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816 & ha_data$column==3 & ha_data$row=="C" & ha_data$year==2005] <- 2
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816 & ha_data$column==3 & ha_data$row=="C" & ha_data$year==2006] <- NA
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816 & ha_data$column==8 & ha_data$row=="A" & ha_data$year==2006] <- NA
ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==816 & ha_data$column==8 & ha_data$row=="A"] <- "816X"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==832 & ha_data$column==4 & ha_data$row=="A" & ha_data$year==2006] <- NA
ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==832 & ha_data$column==4 & ha_data$row=="A"] <- "832X"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==835 & ha_data$column==4 & ha_data$row=="E" & ha_data$year==2006] <- NA
ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==835 & ha_data$column==4 & ha_data$row=="E"] <- "835X"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==836 & ha_data$column==1 & ha_data$row=="D" & ha_data$year==2006] <- NA
ha_data$tag_number[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==836 & ha_data$column==1 & ha_data$row=="D"] <- "836X"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==845 & ha_data$year==2006 & ha_data$row=="B"] <- NA

# These need to the code changed from "dead "to "missing"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==1376 & ha_data$year==2005] <- "missing (60)"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==748 & ha_data$year==2005] <- "missing (60)"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==303 & ha_data$year==2005] <- "missing (60)"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==855 & ha_data$year==2005] <- "missing (60)"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==198 & ha_data$year==2005] <- "missing (60)"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==121 & ha_data$year==2005] <- "missing (60)"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==879 & ha_data$year==2005] <- "missing (60)"
ha_data$code[ha_data$bdffp_reserve_no=="3209" & ha_data$tag_number==911 & ha_data$year==2005] <- "missing (60)"

zombie_rows_to_del <- data.frame(
  tag_number = c(39,39,39,39,110,110,110,180,180,180,180,184,184,184,185,185,
                 192,192,209,209,209,209,221,221,221,223,223,238,238,238,238,
                 250,250,250,250,250,250,280,280,280,280,280,283,283,283,283,
                 283,336,336,336,336,354,354,354,354,354,354,354,362,362,366,
                 366,366,386,386,386,386,386,386,419,419,419,419,419,419,420,
                 420,420,420,420,422,422,422,422,422,422,430,430,431,431,431,
                 431,431,431,436,436,449,449,449,449,449,459,459,459,459,459,
                 459,460,460,460,460,468,468,468,468,468,469,469,469,474,474,
                 474,474,474,478,478,478,478,478,480,480,481,481,481,482,482,
                 482,482,482,488,488,488,488,488,489,489,489,492,492,492,492,
                 496,496,496,496,496,496,499,499,499,515,515,515,515,515,515,
                 540,540,540,540,540,554,554,554,554,554,554,633,633,633,634,
                 634,645,645,649,649,649,664,664,669,669,669,670,670,680,680,
                 683,683,683,683,683,684,684,684,684,684,704,704,704,716,716,
                 716,776,776,785,785,785,795,795,797,797,894,894,902,902,902,
                 918,918,918,924,924,924,927,931,931,931,945,945,945,946,946,
                 946,947,947,947,949,949,949,949,949,954,954,956,963,963,963,
                 971,971,978,978,978,982,982,982,988,988,991,991,991,991,997,
                 997,997,1306,1306,1306,1317,1317,1317,1337,1337,1352,1352,1352,
                 1353,1353,1364,1364,1364,1364,1384,1384,1388,1400,1400,1400,
                 1400,823,823,823,823,824,824,824,824,120,120,120  ),
  year = c(2003,2004,2005,2006,2004,2005,2006,2003,2004,2005,2006,2004,2005,
           2006,2005,2006,2005,2006,2003,2004,2005,2006,2004,2005,2006,2005,
           2006,2003,2004,2005,2006,2001,2002,2003,2004,2005,2006,2002,2003,
           2004,2005,2006,2002,2003,2004,2005,2006,2003,2004,2005,2006,2000,
           2001,2002,2003,2004,2005,2006,2005,2006,2004,2005,2006,2001,2002,
           2003,2004,2005,2006,2001,2002,2003,2004,2005,2006,2002,2003,2004,
           2005,2006,2001,2002,2003,2004,2005,2006,2005,2006,2001,2002,2003,
           2004,2005,2006,2005,2006,2002,2003,2004,2005,2006,2001,2002,2003,
           2004,2005,2006,2003,2004,2005,2006,2002,2003,2004,2005,2006,2004,
           2005,2006,2002,2003,2004,2005,2006,2002,2003,2004,2005,2006,2005,
           2006,2004,2005,2006,2002,2003,2004,2005,2006,2002,2003,2004,2005,
           2006,2004,2005,2006,2003,2004,2005,2006,2001,2002,2003,2004,2005,
           2006,2004,2005,2006,2001,2002,2003,2004,2005,2006,2002,2003,2004,
           2005,2006,2001,2002,2003,2004,2005,2006,2004,2005,2006,2005,2006,
           2005,2006,2004,2005,2006,2005,2006,2004,2005,2006,2005,2006,2005,
           2006,2002,2003,2004,2005,2006,2002,2003,2004,2005,2006,2004,2005,
           2006,2004,2005,2006,2005,2006,2004,2005,2006,2005,2006,2005,2006,
           2005,2006,2004,2005,2006,2004,2005,2006,2004,2005,2006,2006,2004,
           2005,2006,2004,2005,2006,2004,2005,2006,2004,2005,2006,2002,2003,
           2004,2005,2006,2005,2006,2006,2004,2005,2006,2005,2006,2004,2005,
           2006,2004,2005,2006,2005,2006,2003,2004,2005,2006,2004,2005,2006,
           2004,2005,2006,2004,2005,2006,2005,2006,2004,2005,2006,2005,2006,
           2003,2004,2005,2006,2005,2006,2006,2003,2004,2005,2006,2004,2005,
           2005,2006,2004,2005,2005,2006,2004,2005,2006  )
)
zombie_rows_to_del$bdffp_reserve_no<-3209
zombie_rows_to_del$bdffp_reserve_no<-as.factor(zombie_rows_to_del$bdffp_reserve_no)
zombie_rows_to_del$tag_number<-as.character(zombie_rows_to_del$tag_number)
zombie_rows_to_del$year<-as.character(zombie_rows_to_del$year)
ha_data <- anti_join(ha_data,zombie_rows_to_del)

rm(zombie_rows_to_del)
# # Need to change all the ones where a plant is dead but size was recorded as "0"
 ha_data <- ha_data %>% mutate(shts = ifelse((shts == 0 & ht == 0 & code== "dead (2)"), 
                        NA, shts)) %>% 
   mutate(ht = ifelse((shts == 0 & ht == 0 & code== "dead (2)"), 
                      NA, ht)) %>% 
   mutate(infl = ifelse((shts == 0 & ht == 0 & code== "dead (2)"), 
                        NA, infl))
# 
# what happened to the data for 120? did it get lost in a tag switch?
# 5754	10-ha	120	1998	NA	NA	NA	
# 5754	10-ha	120	1999	NA	NA	NA	
# 5754	10-ha	120	2000	NA	NA	NA	
# 5754	10-ha	120	2001	NA	NA	NA	
# 5754	10-ha	120	2002	NA	NA	NA	
# 5754	10-ha	120	2003	0	0	dead (2)	
 
#TODO:
# Need to add 2006 seedling notations
# Figure out plant 46
# Need to add 1997 data
# Remove all the ones with NA tag numbers in ha_data

# Pull out 'Miscellaneous observations'; save to csv file -----------------

# ha_data$code<-gsub("under treefall", "under treefall (80)", ha_data$code)
summary(as.factor(ha_data$code))
MISC_OBS <-
  ha_data %>%
  filter(
    code == "dried (7)" |
      code == "under litter (70)" |
      code == "2x in field (200)" |
      code == "under branchfall (90)" |
      code == "resprouting (10)" |
      code == "under treefall (80)" |
      code == "90, 10 (two codes)" |
      is.na(notes)== FALSE
        ) %>%
  arrange(notes,plot, year, tag_number) %>%
  select(-ht, -shts, -infl,-x_09,-y_09)
write_csv(MISC_OBS, "./output/misc_observations.csv")

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



# THIS WILL CHECK TO SEE IF THERE ARE SOME THAT WERE REGISTERED DEAD BUT
# FOR WHICH THERE ARE ht or sht measurments in years AFTER they were marked dead

# returns 'ha_data', saves csv of things to check
source("./code_data_cleaning/zombies.R")
zombies <- zombies(ha_data)
zombies %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(tag_number)) %>%
  arrange(habitat, desc(N_plants))


source("./code_data_cleaning/duplicate_plants.R")
dupes <- duplicate_plants(ha_data)
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


