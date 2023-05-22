standardize_tag_numbers <- function(ha_data) {
  
# some of the duplicates were identified in the dataset with decimals (e.g.,
# 224.1 and 224.2 were plants with duplicate tag numbers 224. This function
# removes those decimals and standardizes tag numbers.
  
# round down the duplicate tag numbers that have decimals 
# (note the the plant_ids for these plants are unique)
ha_data$tag_number <- floor(ha_data$tag_number)
ha_data$tag_number <- as.integer(ha_data$tag_number)

# return(dupes)
return(ha_data)

}