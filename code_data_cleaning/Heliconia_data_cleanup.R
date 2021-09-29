
# Code Overview -----------------------------------------------------------
# Code to conduct the analyses and generate the figures in:
# Script created by Emilio M. Bruna, embruna@ufl.edu
# Script created in R version 3.3.1



#TODO: Change ha_data to ha_wide
#TODO: Change ha_long to ha_long


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
names(ha_data)[66] <- "notes_to_eb"
names(ha_data)

# correct the data types assigned to each
str(ha_data)

# set as character
ha_data$notes_to_eb <- as.character(ha_data$notes_to_eb)

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

# make habitat (frag size) an ordered factor
ha_data$habitat <- ordered(ha_data$habitat, levels = c("1-ha", "10-ha", "CF"))

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
# incorrectly entered tag no. as 228 instead of 288
ha_data$plant_id_07[ha_data$plot == "2107" & ha_data$plant_id_07 == "228" &
                      ha_data$tag_number == "288"] <- "288"

# PortoAlegre-CF
# Remove duplicated record 
to_delete <- ha_data %>%
  filter(plot == "PortoAlegre-CF" &
    tag_number == "264" &
    row == "C" &
    column == 10)
ha_data <- anti_join(ha_data, to_delete)
rm(to_delete)


# 2018
# TODO: track down these marked and mapped in 07/08
# look for them in plant_id_07 for plants 1609 and 1629
filter(ha_data, tag_number == 1705 & plot == 5756)
filter(ha_data, tag_number == 1710 & plot == 5756)




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

# 5751
# fix tag 310
ha_data[which(ha_data$tag_number == 310 & ha_data$plot == "5751"), 49] <- NA

# 5753
# fix tags 176/199
source <- which(ha_data$tag_number == 199 & ha_data$plot == "5753")
destination <- which(ha_data$tag_number == 176 & ha_data$plot == "5753")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# fix tags 218/298
source <- which(ha_data$tag_number == 218 & ha_data$plot == "5753")
destination <- which(ha_data$tag_number == 298 & ha_data$plot == "5753")
ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# which(colnames(ha_data)=="plant_id_07")
#
# filter(ha_data, tag_number==347)
# filter(ha_data, tag_number==275 & plot==2107)
# filter(ha_data, tag_number==298 & plot==5753)
#
# source<-which(ha_data$tag_number==218 & ha_data$plot=="5753")
# destination<-which(ha_data$tag_number==298 & ha_data$plot=="5753")
# ha_data[c(destination,source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

####################

ha_data$plant_id_07 <- as.integer(ha_data$plant_id_07)
colnames(ha_data)
tag_checks <- ha_data %>%
  select(plot, tag_number, plant_id_07) %>%
  mutate(dble.chk = tag_number - plant_id_07)
tag_checks <- arrange(tag_checks, desc(dble.chk))
head(tag_checks, 20)
tag_checks <- arrange(tag_checks, dble.chk)
head(tag_checks, 20)
sum(tag_checks$dble.chk) # if NA=zero then all ok

tag_checks <- tag_checks %>%
  filter(dble.chk > 0 | dble.chk < 0) %>%
  arrange(plot)
#
# tag.double.chks<-bind_rows(
#     #2107
#     ha_data[(ha_data$plot=="2107" & (ha_data$tag_number=="68"| ha_data$tag_number=="275")),],
#     ha_data[(ha_data$plot=="2107" & (ha_data$tag_number=="129"| ha_data$tag_number=="311")),],
#     # 5750
#     ha_data[(ha_data$plot=="5750" & (ha_data$tag_number=="1338"| ha_data$tag_number=="1398")),],
#     # 5751
#     ha_data[(ha_data$plot=="5751" & (ha_data$tag_number=="154"| ha_data$tag_number=="390")),],
#     ha_data[(ha_data$plot=="5751" & (ha_data$tag_number=="264"| ha_data$tag_number=="337")),],
#     ha_data[(ha_data$plot=="5751" & (ha_data$tag_number=="310"| ha_data$tag_number=="347")),],
#     #5753
#     ha_data[(ha_data$plot=="5753" & (ha_data$tag_number=="218"| ha_data$tag_number=="298")),],
#     ha_data[(ha_data$plot=="5753" & (ha_data$tag_number=="199"| ha_data$tag_number=="176")),],
#     #5756
#     ha_data[(ha_data$plot=="5756" & (ha_data$tag_number=="551"| ha_data$tag_number=="1678")),],
#     ha_data[(ha_data$plot=="5756" & (ha_data$tag_number=="1231"| ha_data$tag_number=="1714")),],
#     ha_data[(ha_data$plot=="5756" & (ha_data$tag_number=="1609"| ha_data$tag_number=="1710")),],
#     ha_data[(ha_data$plot=="5756" & ha_data$tag_number=="1629"),],
#         ha_data[(ha_data$plot=="5756" & (ha_data$tag_number=="431"| ha_data$tag_number=="480")),],
#     ha_data[(ha_data$plot=="5756" & (ha_data$tag_number=="1864"| ha_data$tag_number=="1684")),]
#   )

# write_csv(tag.double.chks,"tag.double.chks.csv")





# DATA CLEANING -----------------------------------------------------------

# SELECT THE columns NEEDED
ha_data <-
  ha_data %>% select(
    # "HA.plot",
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

# RESHAPING FROM WIDE TO LONG. CONVOLUTED BUT IT WORKS

# # alternate solution using most recent version of tidyr:
# ha_long <- ha_data %>%
#   mutate(across(starts_with(c("shts_", "ht_", "infl_", "notes_")),
#                 as.character)) %>%
#   pivot_longer(cols = starts_with(c("shts_", "ht_", "infl_", "notes_")),
#                names_sep = "\\_",
#                names_to = c("var", "year")) %>%
#   pivot_wider(names_from = var, values_from = value)

ha_long.notes <-
  select(
    ha_data,
    # "HA.plot",
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
str(ha_long.notes)


ha_long.notes <-
  ha_long.notes %>%
  mutate(across(where(is.factor), as.character)) %>% # need this line because they were factors and had different levels in each column
  gather(
    "year.notes",
    "code.notes",
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
ha_long.notes <-
  ha_long.notes %>% separate(year.notes, c("factor", "year"), sep = "\\_")
head(ha_long.notes, 100)

ha_long.infl <-
  select(
    ha_data,
    # "HA.plot",
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
    "infl_2009"
  )
str(ha_long.infl)

ha_long.infl <- ha_long.infl %>%
  gather(
    "year.infl",
    "infl",
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
    "infl_2009"
  )
ha_long.infl <-
  ha_long.infl %>% separate(year.infl, c("factor", "year"), sep = "\\_")
head(ha_long.infl, 10)

ha_long.shts <-
  select(
    ha_data,
    # "HA.plot",
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
    "shts_2009"
  )
str(ha_long.shts)
ha_long.shts <-
  ha_long.shts %>% gather(
    "year.shts",
    "shts",
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
    "shts_2009"
  )
ha_long.shts <-
  ha_long.shts %>% separate(year.shts, c("factor", "year"), sep = "\\_")
head(ha_long.shts, 10)

ha_long.ht <-
  select(
    ha_data,
    # "HA.plot",
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
    "ht_2009"
  )
str(ha_long.ht)
ha_long.ht <-
  ha_long.ht %>% gather(
    "year.ht",
    "ht",
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
    "ht_2009"
  )
ha_long.ht <-
  ha_long.ht %>% separate(year.ht, c("factor", "year"), sep = "\\_")
head(ha_long.ht, 10)


# Check to see if they are all lined up properly by seeing if year matches across columns
years <-
  as.data.frame(cbind(ha_long.ht$year, ha_long.notes$year, ha_long.infl$year, ha_long.shts$year))
head(years, 10)
names(years) <- c("yr1", "yr2", "yr3", "yr4")

colnames(years)
years$ha_long <-
  (years$yr1 == years$yr2) &
  (years$yr3 == years$yr4) & (years$yr1 == years$yr4)

# all(years$ha_long)
summary(years$ha_long)

# THEY DO IF ALL = TRUE


# COMPLETE GOING FROM WIDE TO LONG BY DELETING THE COLUMSN YOU DON'T NEED
# bind the columns for ht, shots, infl, and notes into a single dataframe called 'ha_long'
colnames(ha_long.ht) == colnames(ha_long.shts)
colnames(ha_long.infl) == colnames(ha_long.notes)


ha_long <- full_join(ha_long.ht, ha_long.shts,
  by = c(
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
    "year"
  )
) %>%
  select(-factor.x, -factor.y)


ha_long <- full_join(ha_long, ha_long.notes) %>% select(-factor)
ha_long <- full_join(ha_long, ha_long.infl) %>% select(-factor)
head(ha_long, 10)
colnames(ha_long)

rm(ha_long.ht, ha_long.infl, ha_long.notes, ha_long.shts, years)
summary(ha_long)

# fix the data types as needed
ha_long$year <- as.numeric(as.character(ha_long$year))
summary(ha_long$year)
ha_long$plot <- as.factor(ha_long$plot)

# CLARIFY THE CODES
ha_long$code.notes <- as.factor(ha_long$code.notes)
summary(ha_long$code.notes)
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "1"] <-
  "sdlg (1)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "ULY"] <-
  "ULY (3)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "3"] <- "ULY (3)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "2"] <-
  "dead (2)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "4"] <-
  "uly? (4)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "5"] <-
  "dead above ground (5)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "6"] <-
  "new plant in plot (6)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "7"] <-
  "dried (7)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "10"] <-
  "resprouting (10)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "40"] <-
  "not on list (40)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "50"] <-
  "no tag (50)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "60"] <-
  "plant missing (60)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "70"] <-
  "under litter (70)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "80"] <-
  "under treefall (80)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "90"] <-
  "under branchfall (90)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "100"] <-
  "dead not on list (100)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "200"] <-
  "2x in field (200)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "300"] <-
  "dead, yr unknown (300)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "1, 200 "] <-
  "sdlg (1)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == ""] <- NA
summary(ha_long$code.notes)


# Rearrange plot, then tag number, then year
ha_long <- ha_long %>% arrange(plot, tag_number, year)
head(ha_long, 20)


#function to check for duplicate ID #s.
check_dupes <- function(df){
  df %>%
    group_by(year, HA_ID_Number) %>%
    count() %>%
    filter(n>1) %>% 
    pull(HA_ID_Number) %>% 
    unique()
}
check_dupes(ha_long)


# merge the PA10 data -----------------------------------------------------
source("./code_data_cleaning/merge_with_PA10.R")
ha_long <- merge_with_PA10(ha_long)


check_dupes(ha_long)


# remove the rows with NA across all columns -----------------------------
ha_long <- ha_long %>% drop_na(plot, habitat, ranch)

check_dupes(ha_long)


# correction - x/y coordinates and row/col--------------------------------

# a few were entered with a comma instead of decimal
ha_long$x_09 <- gsub("[\\,;]", "\\.", ha_long$x_09)
ha_long
# some of the errors in plant location (Row/Column) corrected below found 
# by ES, see https://github.com/BrunaLab/HeliconiaDemography/issues/5

# corrections - Florestal -------------------------------------------------

# ha_data$notes_2005[ha_data$plot == "Florestal-CF" & 
#                      ha_data$tag_number == "1"] <- 60
ha_long$code.notes[ha_long$plot == 'Florestal-CF' &
                  ha_long$year == 2005 &
                  ha_long$tag_number == 1] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 'Florestal-CF' &
                     ha_long$year == 2004 &
                     ha_long$tag_number == 1508] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 'Florestal-CF' &
                     ha_long$year == 2004 &
                     ha_long$tag_number == 1508] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 'Florestal-CF' &
                     ha_long$year == 2005 &
                     ha_long$tag_number == 1508] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 'Florestal-CF' &
                     ha_long$year == 2004 &
                     ha_long$tag_number == 799] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == 'Florestal-CF' &
                     ha_long$year == 2005 &
                     ha_long$tag_number == 799] <- "plant missing (60)"

# correcting location
ha_long$column[ha_long$plot == "Florestal-CF" & ha_long$HA_ID_Number == 5806] <- "1"
ha_long$column[ha_long$plot == "Florestal-CF" & ha_long$HA_ID_Number == 5850] <- "1"
ha_long$column[ha_long$plot == "Florestal-CF" & ha_long$HA_ID_Number == 5902] <- "1"
ha_long$column[ha_long$plot == "Florestal-CF" & ha_long$HA_ID_Number == 6107] <- "1"
ha_long$column[ha_long$plot == "Florestal-CF" & ha_long$HA_ID_Number == 6204] <- "1"
ha_long$column[ha_long$plot == "Florestal-CF" & ha_long$HA_ID_Number == 7009] <- "1"

# plant size entered incorrectly (entered as 449, should be 49)
ha_long$ht[ha_long$plot == "Florestal-CF" & 
             ha_long$year == 2003 &
             ha_long$tag_number == 590] <- 49


# corrections 5750 --------------------------------------------------------

# Some of the plants in 5750 were put as Row "L" because he thought they might be
# just outside the plot. I converted to J.
ha_long$row[ha_long$plot == "5750" & ha_long$row == "L"] <- "J"
ha_long$column[ha_long$plot == "Florestal-CF" & ha_long$column == 0] <- 1
ha_long$column[ha_long$plot == "5751" & ha_long$column == 0] <- 1

# If you want to convert these to 0 to say they are inside the plot,
# then uncomment these two lines
# ha_long$x_09[ha_long$x_09 < 1] <- 0
# ha_long$y_09[ha_long$x_09 < 1] <- 0


# Plant 236 - add code for year it's missing, delete the plot
# it duplicate numbers, delete incorrect plot
ha_long$code.notes[ha_long$plot == 5750 &
  ha_long$year == 2006 &
  ha_long$tag_number == 236] <- "plant missing (60)"
ha_long$code.notes[ha_long$plot == 5750 &
  ha_long$year == 2008 &
  ha_long$tag_number == 236] <- "plant missing (60)"
ha_long$code.notes[ha_long$plot == 5750 &
  ha_long$year == 2009 &
  ha_long$tag_number == 236] <- "plant missing (60)"
ha_long$shts[ha_long$plot == 5750 &
  ha_long$year == 2007 &
  ha_long$tag_number == 236] <- 1
ha_long$ht[ha_long$plot == 5750 &
  ha_long$year == 2007 &
  ha_long$tag_number == 236] <- 10
# delete the duplicate
to_delete <- ha_long %>%
  filter(plot == 5750 &
    tag_number == 236 &
    row == "G" &
    column == 9)
ha_long <- anti_join(ha_long, to_delete)
rm(to_delete)

# 5750
# Updating Codes 
ha_long$code.notes[ha_long$plot == "5750" & ha_long$year == 2005 & ha_long$tag_number == 864] <- "plant missing (60)"

# location
ha_long$column[ha_long$plot == "5750" & ha_long$HA_ID_Number == 962] <- 6
ha_long$column[ha_long$plot == "5750" & ha_long$HA_ID_Number == 977] <- 10
ha_long$row[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1133] <- "G"
ha_long$column[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1133] <- 6
ha_long$row[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1135] <- "G"
ha_long$column[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1135] <- 6
ha_long$row[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1280] <- "J"
ha_long$row[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1284] <- "J"
ha_long$column[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1577] <- 6
ha_long$column[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1778] <- 10
ha_long$column[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1790] <- 10
ha_long$row[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1836] <- "J"
ha_long$column[ha_long$plot == "5750" & ha_long$HA_ID_Number == 2149] <- 6
ha_long$row[ha_long$plot == "5750" & ha_long$HA_ID_Number == 1602] <- "J"

# corrections 5756 --------------------------------------------------------

# tag no. 793
ha_long$code.notes[ha_long$plot == 5756 &
  (ha_long$year == 2005 |
    ha_long$year == 2006) &
  ha_long$tag_number == 793] <- "plant missing (60)"

# Tag 372
ha_long$ht[ha_long$plot == "5756" & ha_long$year == 2005 & ha_long$tag_number == 372] <- 26
# TODO: did this one change tag numbers? 2x

# Tag 1616
ha_long$ht[ha_long$plot == "5756" & ha_long$year == 2004 & ha_long$tag_number == 1616] <- 77
ha_long$shts[ha_long$plot == "5756" & ha_long$year == 2004 & ha_long$tag_number == 1616] <- 4
ha_long$code.notes[ha_long$plot == 5756 &
  (ha_long$year == 2005 | ha_long$year == 2006) &
  ha_long$tag_number == 1616] <- "plant missing (60)"
# TODO: figure out which of the plants in the plot this is - tags lost in tfall
# in the first yr this showed up

# Plant 933
ha_long$HA_ID_Number <- as.character(ha_long$HA_ID_Number)
ha_long <- ha_long %>%
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
ha_long$code.notes[ha_long$plot == "5756" &
  ha_long$year == 2007 &
  ha_long$row == "C" &
  ha_long$column == 8 &
  ha_long$tag_number == 929] <- "ULY (3)"

# Plant 816
# 816 in D9 is a renumber after tag was lost, I think it was written down
# incorrectly and needs to be 2x in field
ha_long$code.notes[ha_long$plot == "5756" &
  ha_long$year == 2009 &
  ha_long$row == "D" &
  ha_long$column == 9 &
  ha_long$tag_number == 816] <- "ULY (3)"

# tag no 29
# 29 in 5756 was actually in E3, and was retagged as 1663 in 07
ha_long <- ha_long %>%
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
ha_long$code.notes[ha_long$plot == "5756" &
  (ha_long$year == 2005 |
    ha_long$year == 2006) &
  ha_long$tag_number == 1663] <- NA
to_delete <- ha_long %>%
  filter(plot == "5756" &
    tag_number == 29 &
    row == "E" &
    column == 3)
ha_long <- anti_join(ha_long, to_delete)
rm(to_delete)

# tag_no 1602
ha_long <- ha_long[!(ha_long$plot == "5756" &
  ha_long$tag_number == 1602 &
  ha_long$row == "A" &
  ha_long$column == 9), ]



# Updating Codes 
ha_long$code.notes[ha_long$plot == "5756" &
                     ha_long$year == 2006 &
                     ha_long$tag_number == 1261] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "5756" &
                     ha_long$year == 2005 &
                     ha_long$tag_number == 1292] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "5756" &
                     ha_long$year == 2006 &
                     ha_long$tag_number == 1294] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "5756" &
                     ha_long$year == 2005 &
                     ha_long$tag_number == 141] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "5756" &
                     ha_long$year == 2006 &
                     ha_long$tag_number == 690] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "5756" &
                     ha_long$year == 2004 &
                     ha_long$tag_number == 707] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "5756" &
                     ha_long$year == 2005 &
                     ha_long$tag_number == 707] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "5756" &
                     ha_long$year == 2006 &
                     ha_long$tag_number == 707] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "5756" &
                     ha_long$year == 2006 &
                     ha_long$tag_number == 50] <- "under treefall (80)"


# incorrectly recorded 10 infl in 2007, should be NA
ha_long$infl[ha_long$plot == "5756" &
                     ha_long$year == 2007 &
                     ha_long$tag_number == 403] <- NA






# Corrections Dimona-CF ---------------------------------------------------

ha_long$column[ha_long$plot == "Dimona-CF" & ha_long$column == 11] <- 10


# plant 81 was not dead in 06
ha_long$code.notes[ha_long$plot == "Dimona-CF" &
  ha_long$tag_number == 81 &
  ha_long$year == 2006] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "Dimona-CF" &
  ha_long$tag_number == 81 &
  ha_long$year == 2008] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "Dimona-CF" &
  ha_long$tag_number == 81 &
  ha_long$year == 2009] <- "plant missing (60)"

# location

# DIMONA-CF
ha_long$row[ha_long$plot == "Dimona-CF" & ha_long$HA_ID_Number == 5662] <- "E"
ha_long$column[ha_long$plot == "Dimona-CF" & ha_long$HA_ID_Number == 5739] <- 10
ha_long$column[ha_long$plot == "Dimona-CF" & ha_long$HA_ID_Number == 5762] <- 10


# Corrections 5753 --------------------------------------------------------

# Tag no. 108
ha_long$code.notes[ha_long$plot == 5753 & ha_long$tag_number == 108 & ha_long$year == 2005] <- NA

# tag_no 841
ha_long <- ha_long[!(ha_long$plot == 5753 & ha_long$tag_number == 319 & ha_long$row == "D"), ]

# Status plant 412 in 2005
ha_long$code.notes[ha_long$plot == 5753 &
  ha_long$year == 2005 &
  ha_long$tag_number == 412] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 5753 &
                     ha_long$year == 2005 &
                     ha_long$tag_number == 268] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 5753 &
                     ha_long$year == 2005 &
                     ha_long$tag_number == 276] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 5753 &
                     ha_long$year == 2005 &
                     ha_long$tag_number == 292] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 5753 &
                     ha_long$year == 2006 &
                     ha_long$tag_number == 34] <- "plant missing (60)"



ha_long$code.notes[ha_long$plot == 5753 &
                     ha_long$year == 2006 &
                     ha_long$tag_number == 52] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 5753 &
                     ha_long$year == 2007 &
                     ha_long$tag_number == 34] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 5753 &
                     ha_long$year == 2008 &
                     ha_long$tag_number == 345] <- "plant missing (60)"


ha_long$code.notes[ha_long$plot == 5753 &
                     ha_long$year == 2008 &
                     ha_long$tag_number == 412] <- "plant missing (60)"




# Corrections 5754 (PA10) -------------------------------------------------

# plant size entered incorrectly (entered as 997, should be 97)
ha_long$ht[ha_long$plot == "5754" & ha_long$year == 2006 & ha_long$tag_number == 445] <- 97




# Corrections 5751 --------------------------------------------------------

# 395 incorrectly entered as 365
to_delete <- ha_long %>%
  filter(plot == "5751" &
    tag_number == 365 &
    row == "D" &
    column == 5)
ha_long <- anti_join(ha_long, to_delete)
rm(to_delete)
ha_long$ht[ha_long$plot == "5751" & ha_long$year == 2008 & ha_long$tag_number == 395] <- 40
ha_long$shts[ha_long$plot == "5751" & ha_long$year == 2008 & ha_long$tag_number == 395] <- 3



ha_long$code.notes[ha_long$plot == "5751" &
                     ha_long$year == 2004 &
                     ha_long$tag_number == 128] <- "plant missing (60)"

ha_long$code.notes[ha_long$plot == "5751" &
                     ha_long$year == 2005 &
                     ha_long$tag_number == 128] <- "plant missing (60)"

# location
ha_long$column[ha_long$plot == "5751" & ha_long$HA_ID_Number == 2224] <- 1
ha_long$column[ha_long$plot == "5751" & ha_long$HA_ID_Number == 2242] <- 1


# Corrections 2108 --------------------------------------------------------

# 17 plot corrected but failed to correct on datasheet
ha_long$code.notes[ha_long$plot == 2108 & ha_long$year == 2006 & ha_long$tag_number == 17] <- NA

ha_long$ht[ha_long$plot == 2108 & ha_long$year == 2006 & ha_long$tag_number == 17] <- 0
ha_long$shts[ha_long$plot == 2108 & ha_long$year == 2006 & ha_long$tag_number == 17] <- 0

ha_long$ht[ha_long$plot == 2108 & ha_long$year == 2007 & ha_long$tag_number == 17] <- 16
ha_long$shts[ha_long$plot == 2108 & ha_long$year == 2007 & ha_long$tag_number == 17] <- 1

ha_long$ht[ha_long$plot == 2108 & ha_long$year == 2008 & ha_long$tag_number == 17] <- 11
ha_long$shts[ha_long$plot == 2108 & ha_long$year == 2008 & ha_long$tag_number == 17] <- 1

ha_long$ht[ha_long$plot == 2108 & ha_long$year == 2009 & ha_long$tag_number == 17] <- 13
ha_long$shts[ha_long$plot == 2108 & ha_long$year == 2009 & ha_long$tag_number == 17] <- 1

ha_long$x_09[ha_long$plot == 2108 & ha_long$column == 7 & ha_long$tag_number == 17] <- 0.1
ha_long$y_09[ha_long$plot == 2108 & ha_long$column == 7 & ha_long$tag_number == 17] <- 2.60

# delete the duplicate
to_delete <- ha_long %>%
  filter(plot == 2108 &
    tag_number == 17 &
    row == "A" &
    column == 4)
ha_long <- anti_join(ha_long, to_delete)
rm(to_delete)
# correct the plot
ha_long$column[ha_long$plot == 2108 & ha_long$column == 7 & ha_long$tag_number == 17] <- 6


# tag_no 66
# Correct the value for C9
ha_long$ht[ha_long$plot == "2108" & ha_long$year == 1999 & ha_long$tag_number == 66] <- 13
ha_long$shts[ha_long$plot == "2108" & ha_long$year == 1999 & ha_long$tag_number == 66] <- 1
ha_long$code.notes[ha_long$plot == "2108" & ha_long$year == 1999 & ha_long$tag_number == 66] <- NA
# delete the value for D10
ha_long <- ha_long[!(ha_long$plot == "2108" & ha_long$row == "D" & ha_long$tag_number == 66), ]


# location
ha_long$row[ha_long$plot == "2108" & ha_long$HA_ID_Number == 504] <- "E"

# Updating Codes 
# Plant 293: notes say 'ULY (3)' in 2008, it's not. replace this with NA
ha_long$code.notes[ha_long$plot == "2108" & ha_long$year == 2008 & ha_long$tag_number == 293] <- NA
# Plant 293: notes say 'dead (2)' in 2009, it's not. replace this with NA
ha_long$code.notes[ha_long$plot == "2108" & ha_long$year == 2009 & ha_long$tag_number == 293] <- NA


# Corrections 2017 --------------------------------------------------------

# Plant 237 in D6 is actually 337. The actual 237 is in C8
ha_long$tag_number[ha_long$plot == 2107 &
  ha_long$row == "D" &
  ha_long$column == 6 &
  ha_long$tag_number == 237] <- 337





# 2017
# Updating Codes 
# Plant 228: notes say 'dead (2)' in 2006, should be plant missing (60)

ha_long$tag_number[ha_long$plot == 2107 &
                     ha_long$year == 2006 &
                     ha_long$tag_number == 228] <- "plant missing (60)"
# Plant 282: notes say 'dead (2)' in 2006, should be plant missing (60)

ha_long$tag_number[ha_long$plot == 2107 &
                     ha_long$year == 2006 &
                     ha_long$tag_number == 282] <- "plant missing (60)"




# Corrections CaboFrio-CF -------------------------------------------------

# tag no. 2121
# create the correct values
correct_2121 <- ha_long %>%
  filter(plot == "CaboFrio-CF", tag_number == 2121) %>%
  group_by(year) %>%
  slice(1) %>%
  mutate(ht = if_else(year == 2009, 6, ht)) %>%
  mutate(shts = if_else(year == 2009, 1, shts)) %>%
  mutate(code.notes = ifelse(year == 2009, NA, code.notes))
# remove the duplicates from the original df
ha_long <- ha_long[!(ha_long$plot == "CaboFrio-CF" & ha_long$tag_number == 2121), ]
# re-insert them
ha_long <- bind_rows(ha_long, correct_2121)
rm(correct_2121)



# location
ha_long$row[ha_long$plot == "CaboFrio-CF" & ha_long$HA_ID_Number == 5211] <- "E"
ha_long$row[ha_long$plot == "CaboFrio-CF" & ha_long$HA_ID_Number == 5303] <- "E"




# 5750
# tag_no 988
# ha_long$ht[ha_long$plot=="5750" & ha_long$year==2007 & ha_long$tag_number==988] <-38
# ha_long$shts[ha_long$plot=="5750" & ha_long$year==2007 & ha_long$tag_number==988] <-3
# ha_long$code.notes[ha_long$plot=="5750" & ha_long$year==2007 & ha_long$tag_number==988] <- NA
# ha_long$ht[ha_long$plot=="5750" & ha_long$year==2008 & ha_long$tag_number==988] <-60
# ha_long$shts[ha_long$plot=="5750" & ha_long$year==2008 & ha_long$tag_number==988] <-2
# ha_long$ht[ha_long$plot=="5750" & ha_long$year==2009 & ha_long$tag_number==988] <-66
# ha_long$shts[ha_long$plot=="5750" & ha_long$year==2009 & ha_long$tag_number==988] <-3




# Corrections 5752  -------------------------------------------------------

# tag no. 181
# create the correct values
correct_181 <- ha_long %>%
  filter(plot == "5752", tag_number == 181) %>%
  group_by(year) %>%
  slice(1) %>%
  mutate(ht = if_else(year == 2006, 110, ht)) %>%
  mutate(shts = if_else(year == 2006, 3, shts)) %>%
  mutate(code.notes = ifelse(year == 2006, NA, code.notes))
# remove the duplicates from the original df
ha_long <- ha_long[!(ha_long$plot == "5752" & ha_long$tag_number == 181), ]
# re-insert them
ha_long <- bind_rows(ha_long, correct_181)
rm(correct_181)

# tag no. 526
# create the correct values
correct_526 <- ha_long %>%
  filter(plot == "5752", tag_number == 526) %>%
  group_by(year) %>%
  slice(1) %>%
  mutate(ht = if_else(year == 2006, 14, ht)) %>%
  mutate(shts = if_else(year == 2006, 3, shts)) %>%
  mutate(code.notes = ifelse(year == 2006, NA, code.notes))
# remove the duplicates from the original df
ha_long <- ha_long[!(ha_long$plot == "5752" & ha_long$tag_number == 526), ]
# re-insert them
ha_long <- bind_rows(ha_long, correct_526)
rm(correct_526)



ha_long$code.notes[ha_long$plot == 5752 & ha_long$year == 2005 & ha_long$tag_number == 149] <- "plant missing (60)"
ha_long$code.notes[ha_long$plot == 5752 & ha_long$year == 2005 & ha_long$tag_number == 499] <- "plant missing (60)"
ha_long$code.notes[ha_long$plot == 5752 & ha_long$year == 2005 & ha_long$tag_number == 272] <- "plant missing (60)"
ha_long$code.notes[ha_long$plot == 5752 & ha_long$year == 2005 & ha_long$tag_number == 736] <- "plant missing (60)"


# Corrections - Porto Alegre CF -------------------------------------------
ha_long$code.notes[ha_long$plot == "PortoAlegre-CF" & ha_long$year == 2004 & ha_long$tag_number == 196] <- "plant missing (60)"
ha_long$code.notes[ha_long$plot == "PortoAlegre-CF" & ha_long$year == 2005 & ha_long$tag_number == 196] <- "plant missing (60)"
ha_long$code.notes[ha_long$plot == "PortoAlegre-CF" & ha_long$year == 2006 & ha_long$tag_number == 238] <- "plant missing (60)"
ha_long$code.notes[ha_long$plot == "PortoAlegre-CF" & ha_long$year == 2005 & ha_long$tag_number == 139] <- "plant missing (60)"
ha_long$code.notes[ha_long$plot == "PortoAlegre-CF" & ha_long$year == 2006 & ha_long$tag_number == 139] <- "plant missing (60)"




# Duplicated tag numbers to check in the field ----------------------------

# 2107
#TODO: 237: one in C8, one in D6




# Pull out 'Miscellaneous observations'; save to csv file -----------------

MISC_OBS <-
  ha_long %>%
  filter(
    code.notes == "dried (7)" |
      code.notes == "under litter (70)" |
      code.notes == "2x in field (200)" |
      code.notes == "under branchfall (90)" |
      code.notes == "resprouting (10)" |
      code.notes == "under treefall (80)" |
      code.notes == "90, 10 (two codes)"
  ) %>%
  arrange(plot, year, tag_number) %>%
  select(-ht, -shts, -infl)

write.csv(MISC_OBS, "./output/misc_observations.csv", row.names = FALSE)



# Save CSV of plants that were not on the survey list ---------------------

# but had a tag on them, so they were marked in a previous year.  Not sure why -
# could have been someone forgot to call it out. They are useful because they
# are a true mortality (had a tag, now dead), or were alive in past year

Not_on_SurveyList <-
  ha_long %>% filter(code.notes == "not on list (40)" |
    code.notes == "dead not on list (100)")
write.csv(Not_on_SurveyList,
  "./data_clean/Not_on_SurveyList.csv",
  row.names = FALSE
)



# Delete "Misc" obs,; make the remainder consistent ---------------------

levels(ha_long$code.notes)[levels(ha_long$code.notes) == "uly? (4)"] <-
  "ULY (3)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "dead above ground (5)"] <-
  "dead (2)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "new plant in plot (6)"] <-
  "ULY (3)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "dried (7)"] <-
  NA
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "resprouting (10)"] <-
  NA
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "not on list (40)"] <-
  NA
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "no tag (50)"] <-
  "tag missing (50)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "under litter (70)"] <-
  NA
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "under treefall (80)"] <-
  NA
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "under branchfall (90)"] <-
  NA
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "dead not on list (100)"] <-
  "dead (2)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "2x in field (200)"] <-
  NA
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "dead, yr unknown (300)"] <-
  "dead (2)"
levels(ha_long$code.notes)[levels(ha_long$code.notes) == "90, 10 (two codes)"] <-
  NA
ha_long <- droplevels(ha_long)


# summary(ha_long)
# summary(ha_long$code.notes)
# colnames(ha_long)


# Finds Zombies and Duplicates --------------------------------------------

# This finds any marked dead in year X but with measurments of shts or ht
source("./code_data_cleaning/marked_dead_but_measured.R")
df <- marked_dead_but_measured(ha_long)



# THIS WILL CHECK TO SEE IF THERE ARE SOME THAT WERE REGISTERED DEAD BUT
# FOR WHICH THERE ARE ht or sht measurments in years AFTER they were marked dead

# returns 'ha_long', saves csv of things to check
source("./code_data_cleaning/zombies.R")
zombies <- zombies(ha_long)


source("./code_data_cleaning/duplicate_plants.R")
dupes <- duplicate_plants(ha_long)

dim(dupes)
check_dupes(ha_long)

write.csv(ha_long, "./data_clean/Ha_survey_with_Zombies.csv", row.names = FALSE)


ha_long %>%
  group_by(habitat, plot) %>%
  summarize(N_plants = n_distinct(HA_ID_Number)) %>%
  arrange(habitat, desc(N_plants))

ha_long <- ha_long %>% arrange(habitat, plot, plotID, bdffp_reserve_no, tag_number, row, column, year)



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



# Be sure to delete the ones for which there are no data after being marked dead (see dy in zombies.R)

