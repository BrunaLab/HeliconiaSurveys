find_dupe_tags <- function() {
  
  dupe_simplified <- ha_data %>% 
    filter(duplicate_tag=="duplicate tag number") %>% 
    select(habitat,plot_id,plot,tag_number,plant_id,row,column) %>% 
    group_by(plot,tag_number,row,column) %>% 
    slice(1) 
  
  # This just prints them out with each plant separated by a row
  if (nrow(dupe_simplified)==0) {
    
    
    
    x<-"\n
    ------------------------------------------------------------------
    There are NO duplicate tag numbers in your dataset.
    ------------------------------------------------------------------
    \n"
    
    writeLines(x)   
    
    
  } else {
    
    
    dupes_count<-dupe_simplified %>%
      group_by(habitat, plot) %>%
      summarize(n_plants = n_distinct(plant_id)) %>%
      arrange(habitat, desc(n_plants)) %>%
      filter(habitat != "") %>% 
      ungroup()
    
    
    
    
    x<-"\n
    ------------------------------------------------------------------
    Plants with identical tag numbers (i.e., `duplicate tags`) have been
    labeled in the dataset. A csv file of the plants with duplicate tags has
    been saved as `dupe_heliconia_tags.csv`. Below is a a summary of how many 
    plants with duplicate tags are in each plot.
    
    Note that plants with identical tag numbers can be distinguished in the 
    dataset by their unique 'plant_id' numbers.
    ------------------------------------------------------------------"
    
    writeLines(x)   
    
    print(dupes_count)
    
    
  }
  

# save the csv file -------------------------------------------------------

  
  if (!dir.exists("./data_review")){
    dir.create("./data_review")
  }else{
    print("./data_review")
  }

    write.csv(dupe_simplified, "./data_review/dupe_heliconia_tags.csv", row.names = FALSE)
  
  # return(ha_data)
  
}