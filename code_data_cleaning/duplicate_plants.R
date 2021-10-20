duplicate_plants <- function(test) {
  # test<-ha_data
  test$row_col <- do.call(paste, c(test[c("row", "column")], sep = "")) 
  
  
  duplicates_col <- test %>% group_by(habitat, plot, column, HA_ID_Number, tag_number, year) %>% filter(n()>1)
  duplicates_row <- test %>% group_by(habitat, plot, row,  HA_ID_Number,tag_number, year) %>% filter(n()>1)
  duplicates_row_col <- test %>% group_by(habitat, plot, row_col, HA_ID_Number,   tag_number, year) %>% filter(n()>1)
  duplicates_row_col <- test %>% group_by(habitat, plot, HA_ID_Number,    tag_number, year) %>% filter(n()>1) %>% ungroup()
  duplicates_row_col <- duplicates_row_col %>%  select(plot, HA_ID_Number,   tag_number) %>% unique()
  
  dupes <-
    semi_join(test, duplicates_row_col, by = c("plot", "tag_number")) %>% 
    select(plotID,plot, habitat,  HA_ID_Number,   tag_number, year, row_col, shts, ht, code) %>% 
    arrange(plot, habitat, tag_number,   HA_ID_Number,  row_col,year)
  
  
  dupe_simplified <- dupes %>% 
    select(plot,   HA_ID_Number, tag_number,row_col) %>% 
    group_by(plot,tag_number,row_col) %>% 
    slice(1)
  write.csv(dupe_simplified, "./data_midway/dupes_heliconia_numbers.csv", row.names = FALSE)
  
  # This just prints them out with each plant separated by a row
  dupes <-
    as.data.frame(lapply(dupes, as.character), stringsAsfactors = FALSE)
  dupes <-
    head(do.call(
      rbind,
      by(dupes, dupes$tag_number, rbind, "")
    ),-1)
  
  
  write.csv(dupes, "./data_midway/dupes_heliconia.csv", row.names = FALSE)
  
  
  return(dupes)
  
}