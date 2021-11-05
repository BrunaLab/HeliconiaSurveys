#=============================================================================================================#
# Script created by Emilio M. Bruna, embruna@ufl.edu
# Script created in R version 3.3.1
# Code to conduct the analyses and generate the figures in:
#
#=============================================================================================================#
library(tidyverse) #Data Manipulations+ggplo1

#  
############################################################

# import CSV files  -----------------------------------------------
PA10_data <-
  read.csv(
"./data_raw/PA10_from_Hacuminata_98-05_27may_Paul.csv",
dec = ".",
header = TRUE,
sep = ",",
check.names = FALSE
  )



############################################################
#  clean column names
############################################################
# make the column names lower case
names(PA10_data)<-tolower(names(PA10_data))

PA10_data<-PA10_data %>% select(-plot,-size,-ranch,-bdffp_reserve_no)
names(PA10_data)

#some of the columns are coming in as decimals / fractions, so round down
PA10_data$column<-floor(PA10_data$column)


############################################################
# correct the data types assigned to each 
############################################################
str(PA10_data)
# set as character

# set these as a factor
cols <-
  c(
"row",
"column",
"notes_1998",
"notes_1999",
"notes_2000",
"notes_2001",
"notes_2002",
"notes_2003",
"notes_2004",
"notes_2005"
)
PA10_data[cols] <- lapply(PA10_data[cols], factor)
str(PA10_data)


############################################################
# ADD the 2006 SURVEY
############################################################
# Import the 06 Survey
PA10_data_2006 <-
  read.csv(
"./data_raw/PA10_2006_from2006datasheets_22may.csv",
dec = ".",
header = TRUE,
sep = ",",
skip=1,
check.names = FALSE
  )
str(PA10_data_2006)
PA10_data_2006[7:12]<-NULL
colnames_2006<- c("tag_number","row","column","shts_2006","ht_2006","notes_2006")
colnames(PA10_data_2006)<-colnames_2006
PA10_data_2006$column<-as.factor(PA10_data_2006$column)
PA10_data_2006$infl_2006<-NA


PA10_data_2006$tag_number[PA10_data_2006$row=="A" & 
                            PA10_data_2006$column=="3"  & 
                            is.na(PA10_data_2006$tag_number)==TRUE] <- 770 #missing on csv, 2x on form
PA10_data_2006$tag_number[PA10_data_2006$row=="E" &
                            PA10_data_2006$column=="5" & 
                            PA10_data$shoots==1 & 
                            is.na(PA10_data_2006$tag_number)==TRUE] <- 765 #missing on csv, 2x on form


PA10_data<-full_join(PA10_data,PA10_data_2006,by=c("tag_number","row","column"))


PA10_data$plot<-5754
PA10_data$HA.plot<-"FF-7"
PA10_data$habitat<-"10-ha"
PA10_data$ranch<-"PortoAlegre"
PA10_data$bdffp_reserve_no<-3209


str(PA10_data_2006)
PA10_data_2006$column<-as.factor(PA10_data_2006$column)
PA10_data_2006$tag_number<-as.integer(PA10_data_2006$tag_number)


############################################################
# DATA CLEANING
############################################################
names(PA10_data)
PA10_data<-PA10_data %>% select(order(colnames(.)))
PA10_data<-PA10_data %>% relocate(c(ranch,plot,tag_number,row,column), .after = habitat)
PA10_data<-PA10_data %>% relocate(starts_with(c("shts_", "ht_", "infl_", "notes_")), .after = column)

# SELECT THE columnS NEEDED
# PA10_data <-
#   PA10_data %>% select(
# "HA.plot",
# "plot",
# "habitat",
# "ranch",
# "bdffp_reserve_no",
# "tag_number",
# "row",
# "column",
# "shts_1998",
# "shts_1999",
# "shts_2000",
# "shts_2001",
# "shts_2002",
# "shts_2003",
# "shts_2004",
# "shts_2005",
# "shts_2006",
# "ht_1998",
# "ht_1999",
# "ht_2000",
# "ht_2001",
# "ht_2002",
# "ht_2003",
# "ht_2004",
# "ht_2005",
# "ht_2006",
# "infl_1998",
# "infl_1999",
# "infl_2000",
# "infl_2001",
# "infl_2002",
# "infl_2003",
# "infl_2004",
# "infl_2005",
# "infl_2006",
# "notes_1998",
# "notes_1999",
# "notes_2000",
# "notes_2001",
# "notes_2002",
# "notes_2003",
# "notes_2004",
# "notes_2005",
# "notes_2006"
# )
colnames(PA10_data)

pa_long <- PA10_data %>%
  mutate(across(starts_with(c("shts_", "ht_", "infl_", "notes_")),
                as.character)) %>%
  pivot_longer(cols = starts_with(c("shts_", "ht_", "infl_", "notes_")),
               names_sep = "\\_",
               names_to = c("var", "year"))



# ALL THE PLANTS WITH DUPLICATED NUMBERS
pa_long_duplicate<-pa_long %>%
  group_by(tag_number,var,year,value) %>%
  summarize(n=n()) %>%
  filter(n>1) %>%
  arrange(desc(n))
  pa_long_duplicate<-levels(as.factor(pa_long_duplicate$tag_number))
  pa_long_duplicate<-as.data.frame(pa_long_duplicate)
  names(pa_long_duplicate)<-"tag_number"
  pa_long_duplicate<-pa_long %>% filter(tag_number %in% pa_long_duplicate$tag_number)


  pa_long_no_dupes <- pa_long %>% anti_join(pa_long_duplicate)
  pa_wide_no_dupes <-pa_long_no_dupes %>%  pivot_wider(names_from = var, values_from = value)

  pa_long_duplicate<-pa_long_duplicate  %>%
    mutate(tag_number=paste(tag_number,column,sep ="."))

 # TODO: FIX THESE TWO DUPES
  pa_long_duplicate_fix<-pa_long_duplicate %>%
    filter(tag_number=="818.7" | tag_number=="825.7")
  pa_wide_duplicate<-pa_long_duplicate %>%
    filter(tag_number!="818.7") %>%
    filter(tag_number!="825.7") %>%
    pivot_wider(names_from = var, values_from = value)


  pa_wide_no_dupes$tag_number<-as.numeric(pa_wide_no_dupes$tag_number)
  pa_wide_duplicate$tag_number<-as.numeric(pa_wide_duplicate$tag_number)
  pa_wide<-bind_rows(pa_wide_no_dupes,pa_wide_duplicate)
  summary(pa_wide$tag_number)
  pa_wide <- pa_wide %>% rename("plotID"="HA.plot")
  
  
  # fix the data types as needed
  pa_wide$year <- as.numeric(as.character(pa_wide$year))
  pa_wide$shts <- as.numeric(as.character(pa_wide$shts))
  pa_wide$ht <- as.numeric(as.character(pa_wide$ht))
  pa_wide$infl <- as.numeric(as.character(pa_wide$infl))
  pa_wide$plot <- as.factor(pa_wide$plot)
  pa_wide$plotID <- as.factor(pa_wide$plotID)
  pa_wide$ranch <- as.factor(pa_wide$ranch)
  pa_wide$bdffp_reserve_no <- as.factor(pa_wide$bdffp_reserve_no)
  pa_wide$row <- as.factor(pa_wide$row)
  # make habitat (frag size) an ordered factor
  pa_wide$habitat <- ordered(pa_wide$habitat, levels = c("1-ha", "10-ha", "CF"))
  
  ######################################################
  # REARRANGE BY plot, then tag number, then year
  pa_wide <- pa_wide %>% arrange(row,column,tag_number, year)
  head(pa_wide, 20)
  # write_csv(pa_wide, "./data_midway/PA10_wide_to_join.csv")  

  