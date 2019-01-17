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


#########################################
#  Nest data import and selection
#########################################

# Step 1: load the CSV files and save as dataframe
heliconia_clean <-
  read.csv(
    "./data_clean/Hacuminata_98-09_12oct2016_clean.csv",
    dec = ".",
    header = TRUE,
    sep = ",",
    check.names = FALSE
  )

# ha_data<-rowid_to_column(ha_data, "HA_ID_Number")



total_plants_per_plot <- heliconia_clean %>% group_by(size,plot) %>% summarise(count = n_distinct(tag_number)) %>% arrange(count)
write.csv(total_plants_per_plot, "./output/total_plants_per_plot.csv", row.names = FALSE)

plants_per_plot_per_year <- heliconia_clean %>% group_by(size,plot,year) %>% summarise(count = n_distinct(tag_number)) %>% arrange(size,plot,year,count)
write.csv(plants_per_plot_per_year, "./output/plants_per_plot_per_year.csv", row.names = FALSE)

