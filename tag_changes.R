
# Create and save a df and file of plot characteristics --------------------

# load libraries ----------------------------------------------------------

library(tidyverse)

# create the plot characteristics file ------------------------------------


# This will create a df with the characteristics of heliconia demographic 
# plots and then save the df as a csv file
source("./code_data_cleaning/create_plot_info_file.R")
ha_plots<-create_plot_info_file(ha_data)
