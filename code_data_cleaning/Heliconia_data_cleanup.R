#=============================================================================================================#
# Script created by Emilio M. Bruna, embruna@ufl.edu
# Script created in R version 3.3.1
# Code to conduct the analyses and generate the figures in:
#
#=============================================================================================================#
library(tidyverse) #Data Manipulations+ggplo1


############################################################################################################
### DATA ENTRY AND CLEANUP
############################################################################################################

# CODE BELOW ASSUMES
# 1) Data are in a folder in the working directory or RStudio Project called 'data'
# 2) There is a folder in the working directory or RStudio Project called 'output'



#########################################
#  Nest data import and selection
#########################################

# Step 1: load the CSV files and save as dataframe
ha_data <-
  read.csv(
    "./data_raw/Hacuminata_98-09_12oct2016.csv",
    dec = ".",
    header = TRUE,
    sep = ",",
    check.names = FALSE
  )
# ha_data<-rowid_to_column(ha_data, "HA_ID_Number")


######################################################
# make the column nmaes lower case
names(ha_data)<-tolower(names(ha_data))
# rename the ones with duplicate names
ha_data <- rename(ha_data, new_name = old_name)
ha_data <- rename(ha_data[48], new_name = old_name)

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

str(ha_data)


# set these as a factor
cols <-
  c(
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
colnames(ha_data)
str(ha_data)


# clean up the names of ranches and plots

levels(ha_data$ranch)[match("PortoAlegre",levels(ha_data$ranch))] <- "Porto Alegre"
levels(ha_data$ranch)[match("Esteio-Colosso",levels(ha_data$ranch))] <- "Esteio"
levels(ha_data$plot)[match("Dimona CF",levels(ha_data$plot))] <- "Dimona-CF"
levels(ha_data$plot)[match("PA-CF",levels(ha_data$plot))] <- "Porto Alegre-CF"


#add the column with CF-1....FF-7 to match bruna 2003
plot_info <-
  read.csv(
    "./data_raw/heliconia_plot_descriptors.csv",
    dec = ".",
    header = TRUE,
    sep = ",",
    check.names = FALSE
  )

levels(ha_data$plot)
levels(plot_info_subset$Heliconia.Plot.ID)


plot_info_subset<-plot_info %>% select(HA.plot,plot)

ha_data <- left_join(ha_data, plot_info_subset,by="plot") 
str(ha_data)
rm(plot_info, plot_info_subset)
# ha_data <- tibble::set_tidy_names(ha_data)
# colnames(ha_data)

######################################################
# SELECT THE columnS NEEDED
ha_data <-
  ha_data %>% select(
    "plot",
    "size",
    "ranch",
    "bdffp_reserve_no",
    "tag_number",
    "row",
    "column",
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

### Not included, need to figure out what these are
# "plantID", "row", "col", "notes to Emilio", "Y", "plantID.1", "row.1", "col.1",


#
# test<-ha_data %>% gather("HA.plot","year_notes", "notes.code", "notes_1998", "notes_1999", "notes_2000", "notes_2001", "notes_2002", "notes_2003", "notes_2004", "notes_2005", "notes_2006", "notes_2008", "notes_2009")
# test<-test %>% gather("HA.plot","year_shts", "shts", "shts_1998", "shts_1999", "shts_2000", "shts_2001", "shts_2002", "shts_2003", "shts_2004", "shts_2005", "shts_2006", "shts_2008", "shts_2009")
# test<-test %>% gather("HA.plot","year_ht", "ht", "ht_1998", "ht_1999", "ht_2000", "ht_2001", "ht_2002", "ht_2003", "ht_2004", "ht_2005", "ht_2006", "ht_2008", "ht_2009")
# test<-test %>% gather("HA.plot","year_infl", "infl", "infl_1998", "infl_1999", "infl_2000", "infl_2001", "infl_2002", "infl_2003", "infl_2004", "infl_2005", "infl_2006", "infl_2008", "infl_2009")


# levels(ha_data$notes_2004)[levels(ha_data$notes_2004)=="ULY"] <- "3"

######################################################
# RESHAPING FROM WIDE TO LONG. CONVOLUTED BUT IT WORKS
test.notes <-
  select(
    ha_data,
    "HA.plot",
    "plot",
    "size",
    "ranch",
    "bdffp_reserve_no",
    "tag_number",
    "row",
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
str(test.notes)
test.notes <-
  test.notes %>% gather(
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
test.notes <-
  test.notes %>% separate(year.notes, c("factor", "year"), sep = "\\_")
head(test.notes, 100)

test.infl <-
  select(
    ha_data,
    "HA.plot",
    "plot",
    "size",
    "ranch",
    "bdffp_reserve_no",
    "tag_number",
    "row",
    "column",
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
str(test.infl)
test.infl <-
  test.infl %>% gather(
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
test.infl <-
  test.infl %>% separate(year.infl, c("factor", "year"), sep = "\\_")
head(test.infl, 10)

test.shts <-
  select(
    ha_data,
    "HA.plot",
    "plot",
    "size",
    "ranch",
    "bdffp_reserve_no",
    "tag_number",
    "row",
    "column",
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
str(test.shts)
test.shts <-
  test.shts %>% gather(
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
test.shts <-
  test.shts %>% separate(year.shts, c("factor", "year"), sep = "\\_")
head(test.shts, 10)

test.ht <-
  select(
    ha_data,
    "HA.plot",
    "plot",
    "size",
    "ranch",
    "bdffp_reserve_no",
    "tag_number",
    "row",
    "column",
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
str(test.ht)
test.ht <-
  test.ht %>% gather(
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
test.ht <-
  test.ht %>% separate(year.ht, c("factor", "year"), sep = "\\_")
head(test.ht, 10)

######################################################
# Check to see if they are all lined up properly by seeing if year matches across columns
years <-
  as.data.frame(cbind(test.ht$year, test.notes$year, test.infl$year, test.shts$year))
head(years, 10)
names(years) <- c("yr1", "yr2", "yr3", "yr4")

colnames(years)
years$test <-
  (years$yr1 == years$yr2) &
  (years$yr3 == years$yr4) & (years$yr1 == years$yr4)
summary(years$test)
# THEY DO IF ALL = TRUE

######################################################
# COMPLETE GOING FROM WIDE TO LONG BY DELETING THE COLUMSN YOU DON'T NEED
# bind the columns fo ht, shots, infl, and notes into a single dataframe called 'test'
test <-
  as.data.frame(bind_cols(test.ht, test.shts, test.infl, test.notes))
head(test, 10)
colnames(test)
# eliminate the redundant columns by selecting the ones you want to keep
test <-
  select(
    test,
    "HA.plot",
    "plot",
    "size",
    "ranch",
    "bdffp_reserve_no",
    "tag_number",
    "row",
    "column",
    "year",
    "ht",
    "shts",
    "infl",
    "code.notes"
  )
head(test, 30)

rm(test.ht, test.infl, test.notes, test.shts, years)

######################################################
# CLEAN-UP
# fix the data types as needed
test$year <- as.numeric(as.character(test$year))
summary(test$year)

# CLARIFY THE CODES
test$code.notes <- as.factor(test$code.notes)
summary(test$code.notes)
levels(test$code.notes)[levels(test$code.notes) == "1"] <-
  "sdlg (1)"
levels(test$code.notes)[levels(test$code.notes) == "ULY"] <-
  "ULY (3)"
levels(test$code.notes)[levels(test$code.notes) == "3"] <- "ULY (3)"
levels(test$code.notes)[levels(test$code.notes) == "2"] <-
  "dead (2)"
levels(test$code.notes)[levels(test$code.notes) == "4"] <-
  "uly? (4)"
levels(test$code.notes)[levels(test$code.notes) == "5"] <-
  "dead above ground (5)"
levels(test$code.notes)[levels(test$code.notes) == "6"] <-
  "new plant in plot (6)"
levels(test$code.notes)[levels(test$code.notes) == "7"] <-
  "dried (7)"
levels(test$code.notes)[levels(test$code.notes) == "10"] <-
  "resprouting (10)"
levels(test$code.notes)[levels(test$code.notes) == "40"] <-
  "not on list (40)"
levels(test$code.notes)[levels(test$code.notes) == "50"] <-
  "no tag (50)"
levels(test$code.notes)[levels(test$code.notes) == "60"] <-
  "plant missing (60)"
levels(test$code.notes)[levels(test$code.notes) == "70"] <-
  "under litter (70)"
levels(test$code.notes)[levels(test$code.notes) == "80"] <-
  "under treefall (80)"
levels(test$code.notes)[levels(test$code.notes) == "90"] <-
  "under branchfall (90)"
levels(test$code.notes)[levels(test$code.notes) == "100"] <-
  "dead not on list (100)"
levels(test$code.notes)[levels(test$code.notes) == "200"] <-
  "2x in field (200)"
levels(test$code.notes)[levels(test$code.notes) == "300"] <-
  "dead, yr unknown (300)"
levels(test$code.notes)[levels(test$code.notes) == "1, 200 "] <-
  "sdlg (1)"
levels(test$code.notes)[levels(test$code.notes) == ""] <- NA
summary(test$code.notes)

######################################################
# REARRANGE BY plot, then tag number, then year
test <- test %>% arrange(plot, tag_number, year)
head(test, 20)

######################################################
# PULL OUT THE 'Miscellaneous observations' AND PUT THEM IN A DIFFERENT CSV FILE

MISC_OBS <-
  test %>% filter(
    code.notes == "dried (7)" |
      code.notes == "under litter (70)" |
      code.notes == "2x in field (200)" |
      code.notes == "under branchfall (90)" |
      code.notes == "resprouting (10)" |
      code.notes == "under treefall (80)" |
      code.notes == "90, 10 (two codes)"
  ) %>%
  arrange(plot, year, tag_number) %>% select(-ht, -shts, -infl)

write.csv(MISC_OBS, "./output/misc_observations.csv", row.names = FALSE)



######################################################
# MAKE A NEW CSV FILE OF THE plants that were not on the survey list
# but had a tag on them, so they were marked in a previous year.  Not sure why -
# could have been someone forgot to call it out. They are useful because they
# are a true mortality (had a tag, now dead), or were alive in past year

Not_on_SurveyList <-
  test %>% filter(code.notes == "not on list (40)" |
                    code.notes == "dead not on list (100)")
write.csv(Not_on_SurveyList,
          "./data_clean/Not_on_SurveyList.csv",
          row.names = FALSE)


######################################################
# DELETE THE MISC OBSERVATIONS FROM THAT column
# THEN MAKE THEM CONSISTENT
levels(test$code.notes)[levels(test$code.notes) == "uly? (4)"] <-
  "ULY (3)"
levels(test$code.notes)[levels(test$code.notes) == "dead above ground (5)"] <-
  "dead (2)"
levels(test$code.notes)[levels(test$code.notes) == "new plant in plot (6)"] <-
  "ULY (3)"
levels(test$code.notes)[levels(test$code.notes) == "dried (7)"] <-
  NA
levels(test$code.notes)[levels(test$code.notes) == "resprouting (10)"] <-
  NA
levels(test$code.notes)[levels(test$code.notes) == "not on list (40)"] <-
  NA
levels(test$code.notes)[levels(test$code.notes) == "no tag (50)"] <-
  "tag missing (50)"
levels(test$code.notes)[levels(test$code.notes) == "under litter (70)"] <-
  NA
levels(test$code.notes)[levels(test$code.notes) == "under treefall (80)"] <-
  NA
levels(test$code.notes)[levels(test$code.notes) == "under branchfall (90)"] <-
  NA
levels(test$code.notes)[levels(test$code.notes) == "dead not on list (100)"] <-
  "dead (2)"
levels(test$code.notes)[levels(test$code.notes) == "2x in field (200)"] <-
  NA
levels(test$code.notes)[levels(test$code.notes) == "dead, yr unknown (300)"] <-
  "dead (2)"
levels(test$code.notes)[levels(test$code.notes) == "90, 10 (two codes)"] <-
  NA
test <- droplevels(test)
summary(test$code.notes)

######################################################
# because all years for all plants are recorded - including
# before they appeared and after they died - this  is to help
# delete all the rows before a seedling is born or after a plant dies.
# the column 'code2' is only seedling or dead

# test$code2<-test$code.notes
# test$code2[(test$code2 != "sdlg (1)") & (test$code2 != "dead (2)")] <- NA
# test$code2<-droplevels(test$code2)
# levels(test$code2)
# summary(test)



# # ungroup(test) %>% select(ht) %>% filter(ht>0) %>% tally()
# test<-test %>% filter(ht>0 | shts>0|code.notes=="sdlg (1)"|code.notes=="dead (2)"|code.notes=="plant missing (60)")
# summary(foo)
# summary(as.factor(foo$code2))
# # ungroup(foo) %>% select(ht) %>% filter(ht>0) %>% tally()
# head(foo,30)

summary(test)
summary(test$code.notes)
summary(as.factor(test$code2))
# THIS DELETES ALL UNCESSARY rowS FROM YERS BEFORE A SEEDLING EXISTED
test$code2 <- NA
test <- test %>%
  group_by(plot, tag_number) %>%
  mutate(
    code2 = as.character(code2),
    # can be avoided if key is a character to begin with
    code2 = ifelse(row_number() == 1 &
                     (!is.na(ht) | !is.na(shts)), "initial.tag.yr", code2)
  )

test$code2[test$code.notes == "sdlg (1)"] <- "initial.tag.yr"

test <- test %>% filter(cumsum(!is.na(code2)) > 0) %>%
  ungroup()
summary(as.factor(test$code2))
summary(test)



# foo<-test %>% select(tag_number, plot)
# foo<-unique(foo)
# test$code2<-as_factor(test$code2)
# foo<-test %>% filter(is.na(code2))
# summary(foo)
# summary(as.factor(foo$code2))
# !is.na(test$code2)
# # df$code2<-as.factor(df$code2)
# summary(test)
# head(test,50)

# foo2<-filter(test,code.notes=="ULY (3)")
# summary(foo2)
# summary(as.factor(foo2$code2))
############################################
# This finds any that were marked dead in a year but for whihc there are measurments of shts or ht
df <- test
df$code2 <- NA
df$code2[df$code.notes == "dead (2)"] <- "dead"
df <- df %>%
  group_by(plot, tag_number) %>%
  mutate(code2 = as.character(code2),
         # can be avoided if key is a character to begin with
         code2 = ifelse(code2 == "dead" &
                          (!is.na(ht) | !is.na(shts)), "double_check", NA)) %>%
  filter(cumsum(!is.na(code2)) > 0) %>%
  ungroup()
head(df, 20)
df <- df %>% filter(code2 == "double_check")


#THIS WILL CHECK TO SEE IF THERE ARE SOME THAT WERE REGISTERED DEAD BUT
# FOR WHICH THERE ARE ht or sht measurments in years AFTER they were marked dead

df2 <- test
df2$code2 <- NA
df2$code2[df2$code.notes == "dead (2)"] <- "dead"
df2 <- df2 %>%
  group_by(plot, tag_number) %>%
  mutate(code2 = as.character(code2), # can be avoided if key is a character to begin with
         code3 = (cumsum(lag(
           code2 == "dead" & !is.na(code2 == "dead"), default = 0
         )))) %>%
  filter(code3 > 0) %>%
  arrange(plot, tag_number, year) %>%
  ungroup()

summary(df2)
#All plamts post -dead records, including NA in ALL columnS
# write.csv(dbl.chk, "./data_clean/post_dead_records.csv",row.names = FALSE)

# df3 - keep these for review (they are the ones that are marked dead but have data after)
df3 <-
  df2 %>% filter((!is.na(ht) |
                    !is.na(shts))) %>% arrange(plot, tag_number, year) %>% select(-code3) %>% ungroup()

df3 <-
  bind_rows(df, df3) %>% select(plot, tag_number, year, ht, shts) %>% unique()

zombies_all_yrs <-
  semi_join(test, df3, by = c("plot", "tag_number")) %>% select(plot, size, tag_number, year, shts, ht, code.notes) %>% arrange(plot, size, tag_number, year)
# zombies_all_yrs<-split(zombies_all_yrs, zombies_all_yrs$tag_number)
write.csv(zombies_all_yrs, "./data_clean/zombies.csv", row.names = FALSE)

# This just prints them out with each plant separated by a row
zombies_all_yrs_new <-
  as.data.frame(lapply(zombies_all_yrs, as.character), stringsAsfactors = FALSE)
zombies_all_yrs_new <-
  head(do.call(
    rbind,
    by(zombies_all_yrs_new, zombies_all_yrs_new$tag_number, rbind, "")
  ),-1)
write.csv(zombies_all_yrs_new,
          "./data_clean/zombies_space_btwn_plants.csv",
          row.names = FALSE)



# df4 - these are the ones you can delete from test. no data after being marked "dead"
df4 <- anti_join(df2, df3, by = c("plot", "tag_number", "year"))
# you can make sure that they in fact they *are* all NA by looking over them
summary(df4)


# then delete them from the Ha survey with an anti_join
test <- anti_join(test, df4, by = c("plot", "tag_number", "year"))

rm(df, df2, df3, df4, zombies_all_yrs_new)

write.csv(test, "./data_clean/Ha_survey_with_Zombies.csv", row.names = FALSE)

test$row_col <- do.call(paste, c(test[c("row", "column")], sep = "")) 
duplicates_col <- test %>% group_by(size, plot, column,  tag_number, year) %>% filter(n()>1)
duplicates_row <- test %>% group_by(size, plot, row,  tag_number, year) %>% filter(n()>1)
duplicates_row_col <- test %>% group_by(size, plot, row_col,  tag_number, year) %>% filter(n()>1)
duplicates_row_col <- test %>% group_by(size, plot, tag_number, year) %>% filter(n()>1) %>% ungroup()
duplicates_row_col <- duplicates_row_col %>%  select(plot, tag_number) %>% unique()

dupes <-
  semi_join(test, duplicates_row_col, by = c("plot", "tag_number")) %>% select(HA.plot,plot, size, tag_number, year, row_col, shts, ht, code.notes) %>% arrange(plot, size, tag_number, row_col,year)
write.csv(dupes, "./data_clean/dupes.csv", row.names = FALSE)
