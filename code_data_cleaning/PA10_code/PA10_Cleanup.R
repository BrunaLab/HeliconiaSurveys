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
# CORRECTIONS TO THE DATASET
############################################################
# 
# # track down these marked and mapped in 07/08
# #look for them in plant_id_07 for plants 1609 and 1629
# filter(PA10_data, tag_number==1705 & plot==5756) 
# filter(PA10_data, tag_number==1710 & plot==5756)
# 
# # FIx 
# PA10_data$plant_id_07[PA10_data$plot=="2107" & PA10_data$plant_id_07=="228" & PA10_data$tag_number=="288"] <- "288" #incorrectly wrote down 228 when first marked
# PA10_data$infl_2007[PA10_data$plot=="5756" & PA10_data$tag_number=="403"] <- NA # incorrectly recorded as 10 when entered
# 
# # fix 68/275
# source<-which(PA10_data$tag_number==68 & PA10_data$bdffp_reserve_no=="2107")
# destination<-which(PA10_data$tag_number==275 & PA10_data$bdffp_reserve_no=="2107")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))
# 
# # fix 129/311
# source<-which(PA10_data$tag_number==129 & PA10_data$bdffp_reserve_no=="2107")
# destination<-which(PA10_data$tag_number==311 & PA10_data$bdffp_reserve_no=="2107")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))
# 
# #fix 1338/1398
# source<-which(PA10_data$tag_number==1338 & PA10_data$bdffp_reserve_no=="1501")
# destination<-which(PA10_data$tag_number==1398 & PA10_data$bdffp_reserve_no=="1501")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))
# 
# #fix 154/390
# source<-which(PA10_data$tag_number==154 & PA10_data$bdffp_reserve_no=="1104")
# destination<-which(PA10_data$tag_number==390 & PA10_data$bdffp_reserve_no=="1104")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))
# 
# #fix 364/337
# source<-which(PA10_data$tag_number==264 & PA10_data$bdffp_reserve_no=="1104")
# destination<-which(PA10_data$tag_number==337 & PA10_data$bdffp_reserve_no=="1104")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))
# 
# #fix 431/480
# source<-which(PA10_data$tag_number==431 & PA10_data$plot=="5756")
# destination<-which(PA10_data$tag_number==480 & PA10_data$plot=="5756")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))
# 
# #fix
# destination<-which(PA10_data$tag_number==1629 & PA10_data$plot=="5756")
# PA10_data[destination, 49:53] <-NA
# 
# #fix
# destination<-which(PA10_data$tag_number==1609 & PA10_data$plot=="5756")
# PA10_data[destination, 49:53] <-NA
# 
# # fix
# source<-which(PA10_data$tag_number==551 & PA10_data$plot=="5756")
# destination<-which(PA10_data$tag_number==1678 & PA10_data$plot=="5756")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))
# 
# # fix
# source<-which(PA10_data$tag_number==1231 & PA10_data$plot=="5756")
# destination<-which(PA10_data$tag_number==1714 & PA10_data$plot=="5756")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))
# 
# # fix
# source<-which(PA10_data$tag_number==1864 & PA10_data$plot=="5756")
# destination<-which(PA10_data$tag_number==1684 & PA10_data$plot=="5756")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))
# PA10_data[c(destination,source), 45:48] <- rbind(PA10_data[source, 45:48], rep(NA, 4))
# PA10_data[which(PA10_data$tag_number==1864 & PA10_data$plot=="5756"),]<-NA
# 
# # fix
# PA10_data[which(PA10_data$tag_number==310 & PA10_data$plot=="5751"),49]<-NA
# 
# #fix 176/199
# source<-which(PA10_data$tag_number==199 & PA10_data$plot=="5753")
# destination<-which(PA10_data$tag_number==176 & PA10_data$plot=="5753")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))
# 
# # fix 218/298
# source<-which(PA10_data$tag_number==218 & PA10_data$plot=="5753")
# destination<-which(PA10_data$tag_number==298 & PA10_data$plot=="5753")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))


# which(colnames(PA10_data)=="plant_id_07")
# 
# filter(PA10_data, tag_number==347)
# filter(PA10_data, tag_number==275 & plot==2107)
# filter(PA10_data, tag_number==298 & plot==5753)
# 
# source<-which(PA10_data$tag_number==218 & PA10_data$plot=="5753")
# destination<-which(PA10_data$tag_number==298 & PA10_data$plot=="5753")
# PA10_data[c(destination,source), 49:53] <- rbind(PA10_data[source, 49:53], rep(NA, 4))



############################################################
# DATA CLEANING
############################################################


# SELECT THE columnS NEEDED
PA10_data <-
  PA10_data %>% select(
"HA.plot",
"plot",
"habitat",
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
"ht_1998",
"ht_1999",
"ht_2000",
"ht_2001",
"ht_2002",
"ht_2003",
"ht_2004",
"ht_2005",
"ht_2006",
"infl_1998",
"infl_1999",
"infl_2000",
"infl_2001",
"infl_2002",
"infl_2003",
"infl_2004",
"infl_2005",
"infl_2006",
"notes_1998",
"notes_1999",
"notes_2000",
"notes_2001",
"notes_2002",
"notes_2003",
"notes_2004",
"notes_2005",
"notes_2006"
)
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
  pa_long_no_dupes <-pa_long_no_dupes %>%  pivot_wider(names_from = var, values_from = value)
  
  pa_long_duplicate<-pa_long_duplicate  %>% 
    mutate(tag_number=paste(tag_number,row,column,sep ="-")) 
  
  #TODO: FIX THESE TWO DUPES
  pa_long_duplicate_fix<-pa_long_duplicate %>% 
    filter(tag_number=="818-B-7" | tag_number=="825-B-7")   
  pa_long_duplicate<-pa_long_duplicate %>% 
    filter(tag_number!="818-B-7") %>% 
    filter(tag_number!="825-B-7") %>% 
    pivot_wider(names_from = var, values_from = value) 
  
  
  pa_long_no_dupes$tag_number<-as.character(pa_long_no_dupes$tag_number)
  pa_long<-bind_rows(pa_long_no_dupes,pa_long_duplicate)
  
# ######################################################
# # fix the data types as needed
names(pa_long)
pa_long$year <- as.numeric(as.character(pa_long$year))
range(pa_long$year)
pa_long$plot<-as.factor(pa_long$plot)


# CLARIFY THE CODES
pa_long$notes <- as.factor(pa_long$notes)
summary(pa_long$notes)
levels(pa_long$notes)[levels(pa_long$notes) == "1"] <-
  "sdlg (1)"
levels(pa_long$notes)[levels(pa_long$notes) == "ULY"] <-
  "ULY (3)"
levels(pa_long$notes)[levels(pa_long$notes) == "3"] <- "ULY (3)"
levels(pa_long$notes)[levels(pa_long$notes) == "2"] <-
  "dead (2)"
levels(pa_long$notes)[levels(pa_long$notes) == "4"] <-
  "uly? (4)"
levels(pa_long$notes)[levels(pa_long$notes) == "5"] <-
  "dead above ground (5)"
levels(pa_long$notes)[levels(pa_long$notes) == "6"] <-
  "new plant in plot (6)"
levels(pa_long$notes)[levels(pa_long$notes) == "7"] <-
  "dried (7)"
levels(pa_long$notes)[levels(pa_long$notes) == "10"] <-
  "resprouting (10)"
levels(pa_long$notes)[levels(pa_long$notes) == "40"] <-
  "not on list (40)"
levels(pa_long$notes)[levels(pa_long$notes) == "50"] <-
  "no tag (50)"
levels(pa_long$notes)[levels(pa_long$notes) == "60"] <-
  "plant missing (60)"
levels(pa_long$notes)[levels(pa_long$notes) == "70"] <-
  "under litter (70)"
levels(pa_long$notes)[levels(pa_long$notes) == "80"] <-
  "under treefall (80)"
levels(pa_long$notes)[levels(pa_long$notes) == "90"] <-
  "under branchfall (90)"
levels(pa_long$notes)[levels(pa_long$notes) == "100"] <-
  "dead not on list (100)"
levels(pa_long$notes)[levels(pa_long$notes) == "200"] <-
  "2x in field (200)"
levels(pa_long$notes)[levels(pa_long$notes) == "300"] <-
  "dead, yr unknown (300)"
levels(pa_long$notes)[levels(pa_long$notes) == "1, 200 "] <-
  "sdlg (1)"
levels(pa_long$notes)[levels(pa_long$notes) == ""] <- NA
summary(pa_long$notes)


#######
# There are a bunch of codes that are long strings of text and need to 
# be corrected. In addition, some of the rows are actually notes about
# the treefalls in plots that should go into the treefall notes file
# select the column of codes. This is all plants in the "pa_long" df - not just the ones with codes that need to be fixed 
# tag.no<-subset(pa_long,select=tag_number)

# codes_to_fix<-na.omit(bind_cols(tag.no,notes))
# rm(tag.no,codes)

pa_long$notes<-trimws(pa_long$notes)


pa10_checks<-pa_long %>% filter(notes=="should be c5"|
                                       notes=="this number belongs to a pvc in a6"|
                                       notes=="pvc stake not on list"|
                                       notes=="its in C2"|
                                       notes=="dead, not on list"|
                                       notes=="e E6"|
                                       notes==", must have lost tag"|
                                       notes=="3 old infl"|
                                       notes=="actually in A6"|
                                       notes=="was not on list, could it be 313"|
                                       notes=="was not on list, could it be 96"|
                                       notes=="was not on list, could it be 1333"|
                                       notes=="was not on list, could it be 378"|
                                       notes=="was not on list, could it be 680"|
                                       notes=="Dead, Not on List"|
                                       notes==", must have lost tag"|
                                       notes=="1 new infl + 1 old infl"|
                                       notes=="1 old infl"|
                                       notes=="2 old infl"|
                                       notes=="2 old infls"|
                                       notes=="3 old infl"|
                                       notes=="actualkly in c8"|
                                       notes=="actually  B5"|
                                       notes=="actually in A6")

# TODO: 
# 382-C-6	should be c5
# 46-B-4	this number belongs to a pvc in a6
# 46-E-6	pvc stake not on list
# 272	its in C2
# 770-A-3	dead, not on list
# 243	e E6
# 817-B-7	, must have lost tag
# 245	3 old infl
# 854	actually in A6
# 318-D-5 was not on list, could it be 313
# 98 was not on list, could it be 96
# 836-D-1	was not on list, could it be 1333
# 835-E-4	was not on list, could it be 378
# 812-D-9	was not on list, could it be 680
# 770-A-3 Dead, Not on List
# 817-B-7	, must have lost tag
# 171	1 new infl + 1 old infl
# 134	1 old infl
# 88	2 old infl
# 816-C-3	2 old infls
# 245	3 old infl
# 780	actualkly in c8
# 845	actually  B5
# 854	actually in A6



pa_long <- pa_long %>%
  mutate(infl = if_else(is.na(infl) & notes == "1 new infl","1", infl)) %>% 
  mutate(notes= na_if(notes,"1 new infl")) %>% 
  mutate(notes == "dead","dead (2)", notes) %>% 
  mutate(notes= na_if(notes, "dead")) %>% 
  mutate(notes == "sdlg","sdlg (1)", notes) %>% 
  mutate(notes= na_if(notes, "sdlg")) %>% 
  mutate(notes == "under trunk","under treefall (80)", notes) %>% 
  mutate(notes == "under treefall","under treefall (80)", notes) %>% 
  mutate(notes == "under fallen trunk","under treefall (80)", notes) %>% 
  mutate(notes= na_if(notes, "under trunk")) %>%
  mutate(notes= na_if(notes, "under treefall")) %>%
  mutate(notes= na_if(notes, "under fallen trunk")) %>%
  mutate((notes == "under branch" | notes == "under branch, must have lost tag"),
         "under treefall (90)", notes) %>% 
  mutate(notes= na_if(notes, "under branch")) %>%
  mutate(notes= na_if(notes, "under branch, must have lost tag")) %>%
  mutate(notes == "not on list","not on list (40)", notes) %>% 
  mutate(notes= na_if(notes, "not on list")) %>% 
  mutate(notes == "missing","plant missing (60)", notes) %>% 
  mutate(notes= na_if(notes, "missing")) %>% 
  mutate(notes == "ULY?","ULY (3)", notes) %>% 
  mutate(notes= na_if(notes, "ULY?")) %>% 
  mutate(notes == "not on list. must be313","not on list (40)", notes) %>% 
  mutate(notes == "not on list. must be96","not on list (40)", notes) %>% 
  mutate(notes= na_if(notes, "not on list. must be313")) %>% 
  mutate(notes= na_if(notes, "not on list. must be96")) %>% 
  mutate(notes= na_if(notes, "must be one of missing")) %>% 
  mutate(notes == "Dead, Not on List","dead not on list (100)", notes) %>% 
  mutate(notes == "dead, not on list","dead not on list (100)", notes) %>% 
  # mutate(notes= na_if(notes, "Dead, Not on List")) %>% 
  # mutate(notes= na_if(notes, "dead, not on list")) %>% 
  mutate(notes= na_if(notes, "could be one of missing")) %>% 
  mutate(notes= na_if(notes, "could be 1333")) %>% 
  mutate(notes= na_if(notes, "could be 378")) %>% 
  mutate(notes= na_if(notes, "could be 680?")) %>% 
  mutate(notes= na_if(notes, "must have lost tag")) %>% 
  mutate(notes= na_if(notes, "1 new infl + 1 old infl")) %>% 
  mutate(notes= na_if(notes, "1 old infl")) %>% 
  mutate(notes= na_if(notes, "2 old infl")) %>% 
  mutate(notes= na_if(notes, "2 old infls")) %>%
  mutate(notes= na_if(notes, "3 old infls")) %>%
  mutate(notes= na_if(notes, "actualkly in c8")) %>%
  mutate(notes= na_if(notes, "actually  B5")) %>%
  mutate(notes= na_if(notes, "actually in A6")) %>% 
  mutate(notes= na_if(notes, "should be c5")) %>%
  mutate(notes= na_if(notes, "this number belongs to a pvc in a6")) %>%
  mutate(notes= na_if(notes, "pvc stake not on list")) %>%
  mutate(notes= na_if(notes, "pvc stake not on list")) %>%
  mutate(notes= na_if(notes, "its in C2")) %>%
  mutate(notes= na_if(notes, "e E6")) %>%
  mutate(notes= na_if(notes, ", must have lost tag")) %>%
  mutate(notes= na_if(notes, "3 old infl")) 

codes_to_fix<-pa_long %>% select(tag_number,notes) %>% 
  drop_na() %>% distinct(notes,.keep_all = TRUE) %>% 
  arrange(notes) # make a summary table of all the different codes in the PA10 dataset 

str(codes_to_fix)

# 
# # These are codes that need to be fixed. will save as a csv for review.
# # codes_to_fix<-rowid_to_column(codes_to_fix, "Code_ID_Number")
# write_csv(codes_to_fix,"./data_midway/PA10_codes_to_fix_2021.csv")
# 



# 
# 
# PA10_checks <- data.frame(
#   tag_number=c(46,
#                88,
#                98,
#                134,
#                171,
#                243,
#                245,
#                272,
#                318,
#                371,
#                382,
#                770,
#                780,
#                812,
#                813,
#                816,
#                832,
#                835,
#                836,
#                845),
#   notes=c("this number belongs to a pvc in a6",
#           "2 old infl ",
#           "not on list. must be96",
#           "1 old infl",
#           "1 new infl + 1 old infl",
#           "e E6",
#           "3 old infl",
#           "its in C2","not on list. must be313","1 new infl",
#                "should be c5","dead, not on list","actualkly in c8","could be 680?",
#                "actually in A6","2 old infls","could be one of missing",
#                "could be 378","could be 1333","actually  B5")
# )
# PA10_checks<-read.csv("./data_raw/PA10_plants_to_fix.csv")
# PA10_checks$notes<-as.character(PA10_checks$notes)
# PA10_checks$count<-NULL
# PA10_checks$new_code<-NULL
# pa_long$notes<-as.character(pa_long$notes)
# PA10_code_corrs$new_code<-as.character(PA10_code_corrs$new_code)
# summary(PA10_checks)
# 
# # This will give you the plants that need review (position, error, 2x, etc) by matching their code with the code in "pa_long" df 
# PA10_checks<-inner_join(pa_long,PA10_checks,by="tag_number") %>% arrange(tag_number)
# PA10_checks$notes.y<-NULL
# write_csv(PA10_checks,"./data_midway/PA10_Check_and_Fix.csv")
# # Delete them out from "pa_long" dataframe, correct them, then re bind them to the pa_long dataframe
# pa_long<-anti_join(pa_long,PA10_checks,by="tag_number")
# colnames(PA10_checks)


######################################################
# REARRANGE BY plot, then tag number, then year
pa_long <- pa_long %>% arrange(row,column,tag_number, year)
head(pa_long, 20)


######3
# HERE NEED FIX AND REINSERT THEN TO pa_long 

# PA10_checks$infl[PA10_checks$tag_number==88 & PA10_checks$year==2005 & PA10_checks$row=="A"] <- 2
# PA10_checks$notes.x[PA10_checks$tag_number==88 & PA10_checks$year==2006 & PA10_checks$row=="A"] <- NA
# PA10_checks$notes.x[PA10_checks$tag_number==98 & PA10_checks$year==2006 & PA10_checks$row=="E"] <- NA
# PA10_checks$infl[PA10_checks$tag_number==134 & PA10_checks$year==2005 & PA10_checks$row=="A"] <- 1
# PA10_checks$notes.x[PA10_checks$tag_number==134 & PA10_checks$year==2006 & PA10_checks$row=="A"] <- NA
# PA10_checks$infl[PA10_checks$tag_number==171 & PA10_checks$year==2005 & PA10_checks$row=="B"] <- 1
# PA10_checks$infl[PA10_checks$tag_number==171 & PA10_checks$year==2006 & PA10_checks$row=="B"] <- 1
# PA10_checks$notes.x[PA10_checks$tag_number==171 & PA10_checks$year==2006 & PA10_checks$row=="B"] <- NA
# PA10_checks$notes.x[PA10_checks$tag_number==243 & PA10_checks$year==2006 & PA10_checks$row=="E"] <- NA
# PA10_checks$infl[PA10_checks$tag_number==245 & PA10_checks$year==2005 & PA10_checks$row=="A"] <- 3
# PA10_checks$notes.x[PA10_checks$tag_number==245 & PA10_checks$year==2006 & PA10_checks$row=="A"] <- NA
# PA10_checks$notes.x[PA10_checks$tag_number==272  & PA10_checks$year==2006 & PA10_checks$row=="C"] <- NA
# PA10_checks$tag_number[PA10_checks$tag_number==318 & PA10_checks$column==5 & PA10_checks$row=="D"] <- "318X"
# # PA10_checks<-PA10_checks %>% filter(!(tag_number==318 & PA10_checks$row=="D"))
# PA10_checks$infl[PA10_checks$tag_number==371 & PA10_checks$year==2006 & PA10_checks$row=="A"] <- 1
# PA10_checks$notes.x[PA10_checks$tag_number==371 & PA10_checks$year==2006 & PA10_checks$row=="A"] <- NA
# PA10_checks$column[PA10_checks$tag_number==382 & PA10_checks$column==5.875 & PA10_checks$row=="C"] <- 5
# PA10_checks$ht[PA10_checks$tag_number==382 & PA10_checks$column==5 & PA10_checks$year==2006] <- 70
# PA10_checks$shts[PA10_checks$tag_number==382 & PA10_checks$column==5 & PA10_checks$year==2006] <- 6
# PA10_checks<-PA10_checks %>% filter(!(tag_number==382 & row=="C" & column==6))
# PA10_checks$shts[PA10_checks$tag_number==770 & PA10_checks$column==3 & PA10_checks$row=="A" & PA10_checks$year==2005] <- 1
# PA10_checks$ht[PA10_checks$tag_number==770 & PA10_checks$column==3 & PA10_checks$row=="A" & PA10_checks$year==2005] <- 8
# PA10_checks$notes.x[PA10_checks$tag_number==770 & PA10_checks$column==3 & PA10_checks$row=="A" & PA10_checks$year==2005] <- "sdlg (1)"
# PA10_checks<-PA10_checks %>% filter(!(tag_number==770 & row=="A" & column==5))
# PA10_checks$notes.x[PA10_checks$tag_number==780 & PA10_checks$column==7 & PA10_checks$row=="C" & PA10_checks$year==2006] <- NA
# PA10_checks$column[PA10_checks$tag_number==780 & PA10_checks$column==7 & PA10_checks$row=="C" & PA10_checks$year==2006] <- 8
# PA10_checks<-PA10_checks %>% filter(!(tag_number==780 & row=="C" & column==7))
# PA10_checks$column[PA10_checks$tag_number==780 & PA10_checks$column==7.25 & PA10_checks$row=="C"] <- 8
# PA10_checks$notes.x[PA10_checks$tag_number==812 & PA10_checks$column==9 & PA10_checks$row=="D" & PA10_checks$year==2006] <- NA
# PA10_checks$tag_number[PA10_checks$tag_number==812 & PA10_checks$column==9 & PA10_checks$row=="D"] <- "812X"
# PA10_checks$tag_number[PA10_checks$tag_number==813 & PA10_checks$column==9 & PA10_checks$row=="A"] <- "813X"
# PA10_checks$notes.x[PA10_checks$tag_number==813 & PA10_checks$column==5 & PA10_checks$row=="A" & PA10_checks$year==2006] <- NA
# PA10_checks$infl[PA10_checks$tag_number==816 & PA10_checks$column==3 & PA10_checks$row=="C" & PA10_checks$year==2005] <- 2
# PA10_checks$notes.x[PA10_checks$tag_number==816 & PA10_checks$column==3 & PA10_checks$row=="C" & PA10_checks$year==2006] <- NA
# PA10_checks$notes.x[PA10_checks$tag_number==816 & PA10_checks$column==8 & PA10_checks$row=="A" & PA10_checks$year==2006] <- NA
# PA10_checks$tag_number[PA10_checks$tag_number==816 & PA10_checks$column==8 & PA10_checks$row=="A"] <- "816X"
# PA10_checks$notes.x[PA10_checks$tag_number==832 & PA10_checks$column==4 & PA10_checks$row=="A" & PA10_checks$year==2006] <- NA
# PA10_checks$tag_number[PA10_checks$tag_number==832 & PA10_checks$column==4 & PA10_checks$row=="A"] <- "832X"
# PA10_checks$notes.x[PA10_checks$tag_number==835 & PA10_checks$column==4 & PA10_checks$row=="E" & PA10_checks$year==2006] <- NA
# PA10_checks$tag_number[PA10_checks$tag_number==835 & PA10_checks$column==4 & PA10_checks$row=="E"] <- "835X"
# PA10_checks$notes.x[PA10_checks$tag_number==836 & PA10_checks$column==1 & PA10_checks$row=="D" & PA10_checks$year==2006] <- NA
# PA10_checks$tag_number[PA10_checks$tag_number==836 & PA10_checks$column==1 & PA10_checks$row=="D"] <- "836X"
# PA10_checks$notes.x[PA10_checks$tag_number==845 & PA10_checks$year==2006 & PA10_checks$row=="B"] <- NA
# PA10_checks<- PA10_checks %>% arrange(tag_number,row,column,year) %>% rename(notes=notes.x)
# 


############################################################
# BRING THE ONES YOU CORRECTED BACK IN
############################################################
# 
# # PA10_checks$tag_number<- gsub("X",".2",PA10_checks$tag_number)  # there appear to be some duplicates
# PA10_checks$tag_number<- gsub("X","",PA10_checks$tag_number)  # there appear to be some duplicates
# PA10_checks$tag_number<- as.numeric(PA10_checks$tag_number)
# pa_long<-bind_rows(pa_long,PA10_checks)
# pa_long$tag_number<-as.factor(pa_long$tag_number)
# write_csv(PA10_checks,"./data_midway/PA10_Check_and_Fix_fixed.csv")
# pa_long

#TODO:
# Need to add 2006 seedling notations
# Figure out plant 46
# Need to add 1997 data
# Remove all the ones with NA tag numbers in pa_long

pa_long$HA.plot<-as.factor(pa_long$HA.plot)
pa_long$ranch<-as.factor(pa_long$ranch)
pa_long$habitat<-as.factor(pa_long$habitat)
pa_long$notes<-as.factor(pa_long$notes)
pa_long$column<-as.factor(pa_long$column)
which(pa_long$row=="NA")
summary(pa_long)
# ############################################################
# # ADD A UNIQUE ID NUMBER FOR EACH PLANT
# ############################################################
# 
# pa_long<-rowid_to_column(pa_long, "HA_ID_Number")
# 
# 

############################################
############################################
# DATA CORRECTION
############################################
############################################
# 
# pa_long$notes[pa_long$plot=="5753" & pa_long$tag_number=="108" & pa_long$year==2005] <- NA

summary(pa_long)

######################################################
# PULL OUT THE 'Miscellaneous observations' AND PUT THEM IN A DIFFERENT CSV FILE
# 
# MISC_OBS <-
#   pa_long %>% filter(
# notes == "dried (7)" |
#   notes == "under litter (70)" |
#   notes == "2x in field (200)" |
#   notes == "under branchfall (90)" |
#   notes == "resprouting (10)" |
#   notes == "under treefall (80)" |
#   notes == "90, 10 (two codes)"
#   ) %>%
#   arrange(plot, year, tag_number) %>% select(-ht, -shts, -infl)
# 
# write.csv(MISC_OBS, "./output/misc_observations_PA10.csv", row.names = FALSE)



######################################################
# MAKE A NEW CSV FILE OF THE plants that were not on the survey list
# but had a tag on them, so they were marked in a previous year.  Not sure why -
# could have been someone forgot to call it out. They are useful because they
# are a true mortality (had a tag, now dead), or were alive in past year

# Not_on_SurveyList <-
#   pa_long %>% filter(notes == "not on list (40)" |
# notes == "dead not on list (100)")
# write.csv(Not_on_SurveyList,
#   "./data_midway/Not_on_SurveyList_PA10.csv",
#   row.names = FALSE)


# ######################################################
# # DELETE THE MISC OBSERVATIONS FROM THAT column
# # THEN MAKE THEM CONSISTENT
# levels(pa_long$notes)[levels(pa_long$notes) == "uly? (4)"] <-
#   "ULY (3)"
# levels(pa_long$notes)[levels(pa_long$notes) == "dead above ground (5)"] <-
#   "dead (2)"
# levels(pa_long$notes)[levels(pa_long$notes) == "new plant in plot (6)"] <-
#   "ULY (3)"
# levels(pa_long$notes)[levels(pa_long$notes) == "dried (7)"] <-
#   NA
# levels(pa_long$notes)[levels(pa_long$notes) == "resprouting (10)"] <-
#   NA
# levels(pa_long$notes)[levels(pa_long$notes) == "not on list (40)"] <-
#   NA
# levels(pa_long$notes)[levels(pa_long$notes) == "no tag (50)"] <-
#   "tag missing (50)"
# levels(pa_long$notes)[levels(pa_long$notes) == "under litter (70)"] <-
#   NA
# levels(pa_long$notes)[levels(pa_long$notes) == "under treefall (80)"] <-
#   NA
# levels(pa_long$notes)[levels(pa_long$notes) == "under branchfall (90)"] <-
#   NA
# levels(pa_long$notes)[levels(pa_long$notes) == "dead not on list (100)"] <-
#   "dead (2)"
# levels(pa_long$notes)[levels(pa_long$notes) == "2x in field (200)"] <-
#   NA
# levels(pa_long$notes)[levels(pa_long$notes) == "dead, yr unknown (300)"] <-
#   "dead (2)"
# levels(pa_long$notes)[levels(pa_long$notes) == "90, 10 (two codes)"] <-
#   NA
# 
# 
# 
# pa_long <- droplevels(pa_long)
# summary(pa_long$notes)

# correction of zombie plants ---------------------------------------------
# # These need to the code changed from "dead "to "missing"
# pa_long$notes[pa_long$tag_number==1376 & pa_long$year==2005] <- "plant missing (60)"
# pa_long$notes[pa_long$tag_number==748 & pa_long$year==2005] <- "plant missing (60)"
# pa_long$notes[pa_long$tag_number==303 & pa_long$year==2005] <- "plant missing (60)"
# pa_long$notes[pa_long$tag_number==855 & pa_long$year==2005] <- "plant missing (60)"
# pa_long$notes[pa_long$tag_number==198 & pa_long$year==2005] <- "plant missing (60)"
# pa_long$notes[pa_long$tag_number==121 & pa_long$year==2005] <- "plant missing (60)"
# pa_long$notes[pa_long$tag_number==879 & pa_long$year==2005] <- "plant missing (60)"
# pa_long$notes[pa_long$tag_number==911 & pa_long$year==2005] <- "plant missing (60)"

# these are the rows to remove (blank years after a plant died)

# first change th tag number is main master file to numeric
pa_long$tag_number<-as.numeric(levels(pa_long$tag_number))[pa_long$tag_number]

# 
# # These following will be removed with an antijoin
# 
# zombie_rows_to_del <- data.frame(
#   tag_number = c(39,39,39,39,110,110,110,180,180,180,180,184,184,184,185,185,
#                  192,192,209,209,209,209,221,221,221,223,223,238,238,238,238,
#                  250,250,250,250,250,250,280,280,280,280,280,283,283,283,283,
#                  283,336,336,336,336,354,354,354,354,354,354,354,362,362,366,
#                  366,366,386,386,386,386,386,386,419,419,419,419,419,419,420,
#                  420,420,420,420,422,422,422,422,422,422,430,430,431,431,431,
#                  431,431,431,436,436,449,449,449,449,449,459,459,459,459,459,
#                  459,460,460,460,460,468,468,468,468,468,469,469,469,474,474,
#                  474,474,474,478,478,478,478,478,480,480,481,481,481,482,482,
#                  482,482,482,488,488,488,488,488,489,489,489,492,492,492,492,
#                  496,496,496,496,496,496,499,499,499,515,515,515,515,515,515,
#                  540,540,540,540,540,554,554,554,554,554,554,633,633,633,634,
#                  634,645,645,649,649,649,664,664,669,669,669,670,670,680,680,
#                  683,683,683,683,683,684,684,684,684,684,704,704,704,716,716,
#                  716,776,776,785,785,785,795,795,797,797,894,894,902,902,902,
#                  918,918,918,924,924,924,927,931,931,931,945,945,945,946,946,
#                  946,947,947,947,949,949,949,949,949,954,954,956,963,963,963,
#                  971,971,978,978,978,982,982,982,988,988,991,991,991,991,997,
#                  997,997,1306,1306,1306,1317,1317,1317,1337,1337,1352,1352,1352,
#                  1353,1353,1364,1364,1364,1364,1384,1384,1388,1400,1400,1400,
#                  1400,823,823,823,823,824,824,824,824,120,120,120  ),    
#   year = c(2003,2004,2005,2006,2004,2005,2006,2003,2004,2005,2006,2004,2005,
#            2006,2005,2006,2005,2006,2003,2004,2005,2006,2004,2005,2006,2005,
#            2006,2003,2004,2005,2006,2001,2002,2003,2004,2005,2006,2002,2003,
#            2004,2005,2006,2002,2003,2004,2005,2006,2003,2004,2005,2006,2000,
#            2001,2002,2003,2004,2005,2006,2005,2006,2004,2005,2006,2001,2002,
#            2003,2004,2005,2006,2001,2002,2003,2004,2005,2006,2002,2003,2004,
#            2005,2006,2001,2002,2003,2004,2005,2006,2005,2006,2001,2002,2003,
#            2004,2005,2006,2005,2006,2002,2003,2004,2005,2006,2001,2002,2003,
#            2004,2005,2006,2003,2004,2005,2006,2002,2003,2004,2005,2006,2004,
#            2005,2006,2002,2003,2004,2005,2006,2002,2003,2004,2005,2006,2005,
#            2006,2004,2005,2006,2002,2003,2004,2005,2006,2002,2003,2004,2005,
#            2006,2004,2005,2006,2003,2004,2005,2006,2001,2002,2003,2004,2005,
#            2006,2004,2005,2006,2001,2002,2003,2004,2005,2006,2002,2003,2004,
#            2005,2006,2001,2002,2003,2004,2005,2006,2004,2005,2006,2005,2006,
#            2005,2006,2004,2005,2006,2005,2006,2004,2005,2006,2005,2006,2005,
#            2006,2002,2003,2004,2005,2006,2002,2003,2004,2005,2006,2004,2005,
#            2006,2004,2005,2006,2005,2006,2004,2005,2006,2005,2006,2005,2006,
#            2005,2006,2004,2005,2006,2004,2005,2006,2004,2005,2006,2006,2004,
#            2005,2006,2004,2005,2006,2004,2005,2006,2004,2005,2006,2002,2003,
#            2004,2005,2006,2005,2006,2006,2004,2005,2006,2005,2006,2004,2005,
#            2006,2004,2005,2006,2005,2006,2003,2004,2005,2006,2004,2005,2006,
#            2004,2005,2006,2004,2005,2006,2005,2006,2004,2005,2006,2005,2006,
#            2003,2004,2005,2006,2005,2006,2006,2003,2004,2005,2006,2004,2005,
#            2005,2006,2004,2005,2005,2006,2004,2005,2006  )
# )

# # ok, remnove them!
# pa_long <- anti_join(pa_long,zombie_rows_to_del)



# 
# # Need to change all the ones where a plant is dead but size was recorded as "0"
# pa_long <- pa_long %>% 
#   mutate(shts = ifelse((shts == 0 & ht == 0 & notes== "dead (2)"), 
#                        NA, shts)) %>% 
#   mutate(ht = ifelse((shts == 0 & ht == 0 & notes== "dead (2)"), 
#                      NA, ht)) %>% 
#   mutate(infl = ifelse((shts == 0 & ht == 0 & notes== "dead (2)"), 
#                        NA, infl))
# 




# FIXES LEFT TO DO --------------------------------------------------------
# 
# 
# what happened to the data for 120? did it get lost in a tag switch?
# 5754	10-ha	120	1998	NA	NA	NA	
# 5754	10-ha	120	1999	NA	NA	NA	
# 5754	10-ha	120	2000	NA	NA	NA	
# 5754	10-ha	120	2001	NA	NA	NA	
# 5754	10-ha	120	2002	NA	NA	NA	
# 5754	10-ha	120	2003	0	0	dead (2)	
# 
# 
# These are weird duplicates
# 5754	10-ha	823	2006	2	39	ULY (3)	*** THIS IS A WEIRD DUPLICATE 
# 5754	10-ha	824	2006	1	29	ULY (3)	*** THIS IS A WEIRD DUPLICATE 



############################################
# This finds any that were marked dead in a year but for whihc there are measurments of shts or ht
source("./code_data_cleaning/marked_dead_but_measured.R")
df<-marked_dead_but_measured(pa_long)

#THIS WILL CHECK TO SEE IF THERE ARE SOME THAT WERE REGISTERED DEAD BUT
# FOR WHICH THERE ARE ht or sht measurments in years AFTER they were marked dead
# returns 'pa_long', saves csv of things to check
source("./code_data_cleaning/zombies.R")
pa_long<-zombies(pa_long)

source("./code_data_cleaning/duplicate_plants.R")
dupes<-duplicate_plants(pa_long)
write.csv(dupes, "./data_midway/dupes_PA10.csv", row.names = FALSE)
dupe_simplified <- dupes %>% 
  select(tag_number,row_col) %>% 
  group_by(tag_number,row_col) %>% 
  slice(1)
write.csv(dupe_simplified, "./data_midway/dupe_numbers_PA10.csv", row.names = FALSE)

write.csv(pa_long, "./data_midway/PA10_survey_with_Zombies.csv", row.names = FALSE)
