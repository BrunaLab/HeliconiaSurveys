detect_duplicate_plants <- function(test) {
  # test<-ha_data
  test$row_col <- do.call(paste, c(test[c("row", "column")], sep = ""))
  
  
  duplicates <- test %>% group_by(habitat, plot, tag_number, year) %>% filter(n()>1)
  
  duplicates_row_col <- duplicates %>%  select(plot, tag_number) %>% unique()

  dupes <-
    semi_join(test, duplicates_row_col, by = c("plot", "tag_number")) %>% 
    select(plotID,plot, habitat,  plant_id,   tag_number, year, row,column, shts, ht, code) %>% 
    arrange(plot, habitat, tag_number,  row,column,year) %>% # detect all the ones with decimals
    bind_rows(ha_data %>% filter(str_detect(tag_number, "\\.")))
  
  dupe_simplified <- dupes %>% 
    select(plot,tag_number,plant_id,row,column) %>% 
    group_by(plot,tag_number,row,column) %>% 
    slice(1)
  
  
  write.csv(dupe_simplified, "./data_check/dupe_heliconia_tags.csv", row.names = FALSE)
  
  # This just prints them out with each plant separated by a row
  if (nrow(dupes)==0) {
    print("there are no duplicates in your dataset")
  } else {
  dupes <-
    as.data.frame(lapply(dupes, as.character), stringsAsfactors = FALSE)
  dupes <-
    head(do.call(
      rbind,
      by(dupes, dupes$tag_number, rbind, "")),-1)
  }
  
  
  # write.csv(dupes, "./data_check/dupes_heliconia.csv", row.names = FALSE)
  
  
  return(dupes)
  
}