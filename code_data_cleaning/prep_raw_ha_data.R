prep_raw_ha_data <- function(ha_data) {
  
  library(tidyverse)
  
  
  ha_data <-
    read.csv(
      "./data_raw/Hacuminata_98-09_12oct2016.csv",
      dec = ".",
      header = TRUE,
      sep = ",",
      check.names = FALSE
    )
  
  
# load the CSV file of demographic data

# convert column names to lower case
names(ha_data) <- tolower(names(ha_data))
# names(ha_data)
# some of the column names were the same for each survey year, 
# so they were made unique and then corrected

# make duplicate column names unique
names(ha_data) <- make.unique(names(ha_data), sep = "_")
# names(ha_data)

# rename columns with duplicate names
ha_data <- ha_data %>% rename(
  "habitat" = "size",
  "plant_id_07" = "plantid",
  "row_07" = "row_1",
  "column_07" = "col",
  "x_08" = "x",
  "y_08" = "y",
  "plant_id_08" = "plantid_1",
  "row_08" = "row_2",
  "column_08" = "col_1",
  "x_09" = "x_1",
  "y_09" = "y_1",
  "code_to_eb" = "notes to emilio"
)
# names(ha_data)

# correct each the data type of each column
# str(ha_data)
ha_data <-
  ha_data %>%
  mutate(across(starts_with("notes_"), as.character)) %>%
  mutate(across(starts_with("ht_"), as.double)) %>%
  mutate(column = as.character(column))


# Convert the names of the ranches to a 3 letter code
ha_data <- ha_data %>%
  mutate(ranch = str_replace_all(
    ranch,
    c("PortoAlegre" = "PAL", "Esteio-Colosso" = "EST", "Dimona" = "DIM")
  )) %>%
  # clean up the names of plots
  mutate(plot = str_replace_all(
    plot,
    c(
      "Dimona CF" = "Dimona-CF",
      "PA-CF" = "PortoAlegre-CF",
      "Cabo Frio" = "CaboFrio-CF",
      "Florestal" = "Florestal-CF"
    )
  ))

# unique(ha_data$ranch)
# unique(ha_data$plot)



# LOAD PLOT DESCRIPTORS & ADD THEM TO DEMOG DATA --------------------------


plot_info <-
  read_csv("./data_raw/heliconia_plot_descriptors.csv",show_col_types = FALSE) %>%
  select(plot_id = habitat_type...1, plot = HDP_plot_ID_no)



# add plot descriptors to demographic data
ha_data <- left_join(ha_data, plot_info, by = "plot")

# names(ha_data)
# names(plot_info)
# str(ha_data)

# delete the plot-level data from the environment
rm(plot_info)


# CLEANING UP THE DATA ----------------------------------------------------

# delete unnecessary columns
ha_data <- ha_data %>% select(
  -plant_id_07,
  -row_07,
  -column_07,
  -plant_id_08,
  -row_08,
  -column_08,
  -code_to_eb,
  -x_08,
  -y_08
)

# Convert from wide to long format

ha_data <- ha_data %>%
  pivot_longer(
    cols = starts_with(c("shts_", "ht_", "infl_", "notes_")),
    names_to = c(".value", "year"),
    names_sep = "_"
  ) %>%
  mutate(year = as.numeric(year))


return(ha_data)

}