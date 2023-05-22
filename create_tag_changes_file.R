
# load libraries ----------------------------------------------------------

library(tidyverse)
# load HDP plot data ------------------------------------------------------


# This will create a df with the characteristics of heliconia demographic 
# plots and then save the df as a csv file

ha_plots<-read_csv("./data_clean/HDP_plots.csv")

# load tag changes --------------------------------------------------------

tag_changes <-
  read.csv(
    "./data_raw/tag_changes.csv",
    dec = ".",
    header = TRUE,
    sep = ",",
    check.names = FALSE
  ) %>% 
  mutate(plot = case_when(
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
  left_join(ha_plots) %>% 
  select(-yr_isolated) %>% 
  as_tibble() %>% 
  arrange(plot,old_tag_no,year) %>% 
  relocate("ranch","habitat", "bdffp_no",.before="year") 



# save the file -----------------------------------------------------------

write_csv(tag_changes, "./data_clean/tag_changes.csv")
