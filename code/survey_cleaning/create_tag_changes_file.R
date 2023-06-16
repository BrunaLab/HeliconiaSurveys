create_tag_changes_file <- function() {
# load libraries ----------------------------------------------------------

library(tidyverse)
  
  
  # create version file -----------------------------------------------------
  # 
  # source("./code/create_version_file.R")
  # dataset<-"tag_changes"
  # create_version_file(dataset)  
  
  
# load HDP plot data ------------------------------------------------------


# This will create a df with the characteristics of heliconia demographic 
# plots and then save the df as a csv file
ha_plots<-read_csv("./data/survey_clean/HDP_plots.csv",
                   show_col_types = FALSE)
# 
# # need to add have the EB plot number as a way of joining the dataset below
# ha_plots_2 <- read_csv("./data/survey_clean/heliconia_survey_clean.csv") %>% 
#   select(
#     plot_id,
#     plot
#   ) %>%
#   distinct() 
# 
# ha_plots<-left_join(ha_plots,ha_plots_2)
# remove(ha_plots_2)


# load tag changes --------------------------------------------------------

tag_changes <-
  read.csv(
    "./data/survey_raw/tag_changes.csv",
    dec = ".",
    header = TRUE,
    sep = ",",
    check.names = FALSE
  ) %>% 
  mutate(plot_id = case_when(
    plot == "2107" ~ "FF-1",
    plot == "2108" ~ "FF-2",
    plot == "2206" ~ "FF-5",
    plot == "5756" ~ "CF-3",
    plot == "5750" ~ "CF-2",
    plot == "5751" ~ "FF-3",
    plot == "5752" ~ "FF-2",
    plot == "5753" ~ "FF-3",
    plot == "CF-CF" ~ "CF-6",
    plot == "Colosso-1" ~ "FF-3",
    plot == "Colosso-10" ~ "FF-6",
    plot == "PA CF" ~ "CF-5",
    plot == "PA-CF" ~ "CF-5",
    plot == "PA1" ~ "FF-4",
    plot == "PA-10" ~ "FF-7",
    plot == "Dim-CF" ~ "CF-4",
    plot == "Florestal" ~ "CF-1",
    TRUE ~ plot
  )) %>% 
  left_join(ha_plots,by="plot_id") %>% 
  select(-yr_isolated) %>% 
  as_tibble() %>% 
  arrange(plot,old_tag_no,year) %>% 
  relocate("ranch","habitat", "bdffp_no",.before="year") %>% 
  relocate("plot_id",.before=1) 

tag_changes<-tag_changes %>% 
  mutate(notes=case_when(
         notes !=""~ notes,
         TRUE ~ as.character(NA))
         )


# save the file -----------------------------------------------------------

if (!dir.exists("./data/survey_clean")){
  dir.create("./data/survey_clean")
}else{
  print(" ")
}

print("The file has been saved to: 'data/survey_clean/tag_changes.csv' ")

write_csv(tag_changes, "./data/survey_clean/tag_changes.csv")

}
