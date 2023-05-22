code_marked_as_adults <- function(ha_data) {
  
  # Sometimes the survey team simply misses established plants that are in a
  # plot, perhaps because desnity is so high or it is difficult to see 
  # individuals in treefalls. This function adds a column indicating if 
  # plants were 'adults" found without a tag. 
  # In the surveys there might be coded as `ULY`,`new plant in plot` or similar.
  # 
  # Sometimes plants will also lose their tags - a branch could fall on them
  # knowing it off, or it could be lost in a treefall. These are also identified 
  # in the survey (`plant without tag`), given a new number, and also labeled as 
  # a being marked as an adult.

  ha_data <- ha_data %>%
    mutate(found_without_tag = if_else(
      code %in% c("no tag", "plant without tag", "new plant in plot", "ULY"),
      TRUE,
      # else:
      FALSE
    ))
  
  return(ha_data)
}
