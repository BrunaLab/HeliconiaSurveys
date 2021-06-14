PA10_duplicate_plants <- function(test) {
  test$row_col <- do.call(paste, c(test[c("row", "column")], sep = "")) 
  
  
  duplicates_col <- test %>% group_by(habitat, plot, column,  tag_number, year) %>% filter(n()>1)
  duplicates_row <- test %>% group_by(habitat, plot, row,  tag_number, year) %>% filter(n()>1)
  duplicates_row_col <- test %>% group_by(habitat, plot, row_col,  tag_number, year) %>% filter(n()>1)
  duplicates_row_col <- test %>% group_by(habitat, plot, tag_number, year) %>% filter(n()>1) %>% ungroup()
  duplicates_row_col <- duplicates_row_col %>%  select(plot, tag_number) %>% unique()
  
  dupes <-
    semi_join(test, duplicates_row_col, by = c("plot", "tag_number")) %>% 
    select(HA.plot,plot, habitat, tag_number, year, row_col, shts, ht, code.notes) %>% 
    arrange(plot, habitat, tag_number, row_col,year)
  write.csv(dupes, "./data_midway/dupes.csv", row.names = FALSE)
  
  dupe_simplified <- dupes %>% 
    select(tag_number,row_col) %>% 
    group_by(tag_number,row_col) %>% 
    slice(1)
  
  write.csv(dupe_simplified, "./data_midway/dupe_numbers.csv", row.names = FALSE)
  return(dupes)
  
}