merge_with_PA10 <- function(ha_data) {
  #=============================================================================================================#
  # Script created by Emilio M. Bruna, embruna@ufl.edu
  # Script created in R version 3.3.1
  # Code to conduct the analyses and generate the figures in:
  #
  #=============================================================================================================#
  library(tidyverse) #Data Manipulations+ggplot2
  
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
  
  # set these as a character
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
  PA10_data[cols] <- lapply(PA10_data[cols], as.character)
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
  PA10_data_2006$column<-as.character(PA10_data_2006$column)
  PA10_data_2006$infl_2006<-NA
  
  
  PA10_data_2006$tag_number[PA10_data_2006$row=="A" & 
                              PA10_data_2006$column=="3"  & 
                              is.na(PA10_data_2006$tag_number)==TRUE] <- 770 #missing on csv, 2x on form
  PA10_data_2006$tag_number[PA10_data_2006$row=="E" &
                              PA10_data_2006$column=="5" & 
                              PA10_data$shoots==1 & 
                              is.na(PA10_data_2006$tag_number)==TRUE] <- 765 #missing on csv, 2x on form
  
  
  # there were two duplicates that were causing problems with the merge, 
  # so I dealt with it here
  delete_818<-PA10_data_2006 %>% filter(tag_number==818 &
                                      ht_2006==50)
  PA10_data_2006 <- anti_join(PA10_data_2006,delete_818)
  
  delete_825<-PA10_data_2006 %>% filter(tag_number==825 &
                                          ht_2006==54)
  PA10_data_2006 <- anti_join(PA10_data_2006,delete_825)
  
  
  PA10_data<-full_join(PA10_data,PA10_data_2006,by=c("tag_number","row","column"))
  
  
  PA10_data$plot<-5754
  PA10_data$HA.plot<-"FF-7"
  PA10_data$habitat<-"10-ha"
  PA10_data$ranch<-"PortoAlegre"
  PA10_data$bdffp_reserve_no<-3209
  
  
  str(PA10_data_2006)
  PA10_data_2006$tag_number<-as.integer(PA10_data_2006$tag_number)
  
  
  ############################################################
  # DATA CLEANING
  ############################################################
  PA10_data<-PA10_data %>% select(order(colnames(.)))
  PA10_data<-PA10_data %>% relocate(c(ranch,plot,tag_number,row,column), 
                                    .after = habitat)
  PA10_data<-PA10_data %>% relocate(starts_with(c("shts_", "ht_", "infl_", "notes_")), .after = column)

  pa <- PA10_data %>%
    pivot_longer(cols = starts_with(c("shts_", "ht_", "infl_", "notes_")),
                 names_sep = "\\_",
                 names_to = c(".value", "year"))
  
  
  
  # ALL THE PLANTS WITH DUPLICATED NUMBERS
  pa_duplicate <- pa %>%
    group_by(tag_number, year) %>%
    summarize(n=n()) %>%
    filter(n>1) %>%
    arrange(desc(n))
  pa_duplicate <- unique(pa_duplicate$tag_number)
  pa_duplicate <- as.data.frame(pa_duplicate)
  names(pa_duplicate)<-"tag_number"
  pa_duplicate <- pa %>% filter(tag_number %in% pa_duplicate$tag_number)
  
  
  pa_no_dupes <- pa %>% anti_join(pa_duplicate)
  
  pa_duplicate <- pa_duplicate  %>%
    mutate(tag_number=paste(tag_number,column,sep ="."))
  
  # FIX THESE TWO DUPES 
  pa_duplicate<-pa_duplicate %>%
    filter(tag_number!="818.7") %>%
    filter(tag_number!="825.7")
  
  pa_duplicate$tag_number <- as.numeric(pa_duplicate$tag_number)
  pa <- bind_rows(pa_no_dupes,pa_duplicate)
  # summary(pa$tag_number)
  pa <- pa %>% rename("plotID"="HA.plot")
  
  
  # fix the data types as needed
  pa$year <- as.numeric(pa$year)
  pa$ht <- as.numeric(pa$ht)
  pa$plot <- as.character(pa$plot)
  pa$bdffp_reserve_no <- as.character(pa$bdffp_reserve_no)

  ######################################################
  # REARRANGE BY plot, then tag number, then year
  pa <- pa %>% arrange(row,column,tag_number, year)
 
  #return:
  bind_rows(ha_data,pa)

}