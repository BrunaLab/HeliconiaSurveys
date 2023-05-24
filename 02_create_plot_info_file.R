
  library(tidyverse)
  
  
  # load the complete and clean Heliconia dataset ---------------------------
  
  
  # these are the years each fragment was isolated
  isolation <- tibble(
    "bdffp_no" = c(2107, 2108, 1104, 3114, 2206, 1202, 3209),
    "yr_isolated" = c(1984, 1984, 1980, 1983, 1984, 1980, 1983)
  ) %>%
    mutate(across(where(is.double), as.factor))
  
  # select the plot id variables
  ha_plots <- read_csv("./data_clean/heliconia_data_clean.csv") %>% 
    select(
      "plot_id",
      "habitat",
      "ranch",
      "bdffp_reserve_no"
    ) %>%
    distinct() %>%
    arrange(plot_id) %>%
    mutate(ranch = recode_factor(ranch, "PortoAlegre" = "porto alegre")) %>%
    mutate(ranch = recode_factor(ranch, "DIM" = "dimona")) %>%
    mutate(ranch = recode_factor(ranch, "PAL" = "porto alegre")) %>%
    mutate(ranch = recode_factor(ranch, "EST" = "esteio")) %>%
    mutate(habitat = recode_factor(habitat, "1-ha" = "one")) %>%
    mutate(habitat = recode_factor(habitat, "10-ha" = "ten")) %>%
    mutate(habitat = recode_factor(habitat, "CF" = "forest")) %>%
    mutate(bdffp_reserve_no = replace(bdffp_reserve_no, bdffp_reserve_no == "none", NA)) %>%
    rename(
      "bdffp_no" = "bdffp_reserve_no"
    ) %>%
    left_join(isolation)
  

# save the csv file -------------------------------------------------------

  
  
  if (!dir.exists("./data_for_dryad")){
    dir.create("./data_for_dryad")
  }else{
    print("./data_for_dryad")
  }
  
  
  write_csv(ha_plots, "./data_for_dryad/HDP_plots.csv")
