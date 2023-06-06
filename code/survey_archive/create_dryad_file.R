create_dryad_file <- function(plot_version,survey_version) {

# load libraries ----------------------------------------------------------

library(tidyverse)

# load the complete and clean Heliconia survey dataset ---------------------------


ha_data<-read_csv("./data/survey_clean/heliconia_survey_clean.csv")

# organize it for Dryad format --------------------------------------------

# names(ha_data)
# head(ha_data)

ha_dryad <- ha_data %>%
  select(plot_id,
         subplot,
         plant_id,
         year,
         shts,
         ht,
         infl,
         recorded_sdlg,
         adult_no_tag,
         treefall_status,
         condition,
         census_status,
         tag_number
  ) %>%
  ungroup() 




# load the plot descriptor file -------------------------------------------

plots_dryad<-read_csv("./data/survey_clean/HDP_plots.csv")


# make any changes to plot descriptor file prior to archiving in Dryad
# v1.0.0: no changes


# file with version info --------------------------------------------------

last_update_survey<-c("last update","HDP_survey.csv",as.character(Sys.Date()),survey_version)
last_update_plots<-c("last update","HDP_plots.csv",as.character(Sys.Date()),plot_version)

version_info <- data.frame(file_name=c('HDP_plots.csv', 'HDP_survey.csv'),
                             file_version=c(plot_version,survey_version),
                             last_update=as.character(Sys.Date()),
                             stringsAsFactors=TRUE)
# version_info<-as_tibble(version_info)

# Save the files  ----------------------------------------------------------

if (!dir.exists("./data/survey_archive")){
  
  dir.create("./data/survey_archive")
  
}else{
  
  # print(" ")
}



write_csv(ha_dryad, "./data/survey_archive/HDP_survey.csv")
write_csv(plots_dryad, "./data/survey_archive/HDP_plots.csv")
print("'HDP_survey.csv' and 'HDP_plots.csv' have been saved to: 'data/survey_archive/'")

write_csv(version_info, "./data/survey_archive/version_info.csv")

# 
# write_csv(version_info_survey, "./data/survey_archive/version_info_survey.csv")
# write_csv(version_info_plots, "./data/survey_archive/version_info_plots.csv")
# 
# 
# 
# 
# version_info_plots <- data.frame(file_name=c('HDP_plots.csv'),
#                                  file_version=c(plot_version),
#                                  last_update=as.character(Sys.Date()),
#                                  stringsAsFactors=TRUE)
# 
# version_info_survey <- data.frame(file_name=c('HDP_survey.csv'),
#                                    file_version=c(survey_version),
#                                    last_update=as.character(Sys.Date()),
#                                    stringsAsFactors=TRUE)
# 
# if ((!file.exists("./data/survey_archive/version_info_plots.csv"))&
#     (!file.exists("./data/survey_archive/version_info_plots.csv"))
#     ){
#   
#   
#   write_csv(version_info_survey, "./data/survey_archive/version_info_survey.csv")
#   write_csv(version_info_plots, "./data/survey_archive/version_info_plots.csv")
#   
#   
# }else{
#   
#   
#   
#   prior_v_plots<-read_csv("./data/survey_archive/version_info_plots.csv") %>% 
#     filter(file_name=="HDP_plots.csv") %>%
#     select(file_version)
#   prior_v_plots<-as.character(prior_v_plots)
#   
#   prior_v_survey<-read_csv("./data/survey_archive/version_info_survey.csv") %>% 
#     filter(file_name=="HDP_survey.csv") %>%
#     select(file_version)
#   prior_v_survey<-as.character(prior_v_survey)
#   
#   plot_version<-as.character(plot_version)
#   survey_version<-as.character(survey_version)
#   
#   
#   plot_test<-prior_v_plots==plot_version
#   survey_test<-prior_v_survey==survey_version
#   
#   }
# 
# ifelse((plot_test), 
#         print("the current plot version number has not changed"), 
#         print("the plot version number has been updated"))
#          
# ifelse((plot_test), 
#        print(" "), 
#        write_csv(version_info_plots, "./data/survey_archive/version_info_plots.csv"))
#         
# 
# 
# 
# 
# if_else(survey_test==FALSE, 
# 5, 
#         1)
#       
#        print("the survey version number has been updated"))
# 
# ifelse((survey_test==TRUE),
#        print(" "),
#        write_csv(version_info_survey, "./data/survey_archive/version_info_plots.csv"))
# 
# 
# 
}
