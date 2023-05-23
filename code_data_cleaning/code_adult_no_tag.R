code_adult_no_tag <- function(ha_data) {
  
  
  
  # now create the new column for all plants found without tags.
  # this includes uly, new plant without tag, etc.
  
  ha_data <- ha_data %>%
    mutate(adult_no_tag = case_when(
      code == "no tag" ~ TRUE,
      code == "plant without tag" ~ TRUE,
      code == "new plant in plot" ~ TRUE,
      code == "ULY" ~ TRUE,
      .default = FALSE
    )
    )
  
  # summary(ha_data$adult_no_tag)
  
  # uly_plants_raw <-
  #   ha_data %>%
  #   filter(adult_no_tag == TRUE) %>%
  #   arrange(notes, plot, year, tag_number) %>%
  #   select(-ht, -shts, -infl, -x_09, -y_09, -notes)
  
  
  

# uly_plants_yr <- uly_plants_raw %>%
#   group_by(year) %>%
#   tally() %>%
#   arrange((year))

# 1999 was still setting up plots, so those "uly" need to be converted to new plants
  
  
  ha_data <- ha_data %>%
    mutate(adult_no_tag = case_when(
      (adult_no_tag==TRUE & year == 1999)~FALSE,
      .default = adult_no_tag
    )
    )
  
  
  
  
  
  return(ha_data)
}
