find_dupe_tags <- function(ha_data) {
  
  ha_data$row_col <- do.call(paste, c(ha_data[c("row", "column")], sep = ""))
  
  
  duplicates <- ha_data %>% group_by(habitat, plot, tag_number, year) %>% filter(n()>1)
  
  duplicates_row_col <- duplicates %>%  select(plot, tag_number) %>% unique()

  dupes <-
    semi_join(ha_data, duplicates_row_col, by = c("plot", "tag_number")) %>% 
    select(plotID,plot, habitat,  plant_id,   tag_number, year, row,column, shts, ht, code) %>% 
    arrange(plot, habitat, tag_number,  row,column,year) %>% # detect all the ones with decimals
    bind_rows(ha_data %>% filter(str_detect(tag_number, "\\.")))
  
  dupe_simplified <- dupes %>% 
    select(plot,tag_number,plant_id,row,column) %>% 
    group_by(plot,tag_number,row,column) %>% 
    slice(1)
  
  # This just prints them out with each plant separated by a row
  if (nrow(dupes)==0) {
    print("there are no duplicates in your dataset")
  } else {
    
    
    dupes_count<-dupes %>%
      group_by(habitat, plot) %>%
      summarize(N_plants = n_distinct(plant_id)) %>%
      arrange(habitat, desc(N_plants)) %>%
      filter(habitat != "")
    
    
    write.csv(dupe_simplified, "./data_check/dupe_heliconia_tags.csv", row.names = FALSE)
    
    
    x<-"\n
    ------------------------------------------------------------------
    Plants with identical tag numbers (i.e., `duplicate tags`) have been
    labeled in the dataset. A csv file of the plants with duplicate tags has
    been saved as `dupe_heliconia_tags.csv`. Below is a a summary of how many 
    plants with duplicate tags are in each plot.
    
    Note that plants with identical tag numbers can be distinguished in the 
    dataset by their unique 'plant_id' numbers.
    ------------------------------------------------------------------
    \n."
    
    writeLines(x)   
    
    print(dupes_count)
    
    #  now label the duplicates in the 
    
    duplicate_tags <- dupes %>%
      select(tag_number, plot) %>%
      group_by(tag_number, plot) %>%
      slice(1) %>%
      filter(tag_number > 0) %>%
      arrange(plot)
    duplicate_tags
    
    duplicate_tags$tag_number <- as.numeric(duplicate_tags$tag_number)
    duplicate_tags$duplicate_tag <- "duplicate tag number"
    ha_data <- left_join(ha_data, duplicate_tags)
    # names(ha_data)
    # 
    
    
    
    
  }
  

  return(ha_data)
  
}