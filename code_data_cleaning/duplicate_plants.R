duplicate_plants <- function(test) {
  test$row_col <- do.call(paste, c(test[c("row", "column")], sep = "")) 
  
  
  duplicates_col <- test %>% group_by(habitat, plot, column,  tag_number, year) %>% filter(n()>1)
  duplicates_row <- test %>% group_by(habitat, plot, row,  tag_number, year) %>% filter(n()>1)
  duplicates_row_col <- test %>% group_by(habitat, plot, row_col,  tag_number, year) %>% filter(n()>1)
  duplicates_row_col <- test %>% group_by(habitat, plot, tag_number, year) %>% filter(n()>1) %>% ungroup()
  duplicates_row_col <- duplicates_row_col %>%  select(plot, tag_number) %>% unique()
  
  dupes <-
    semi_join(test, duplicates_row_col, by = c("plot", "tag_number")) %>% 
    select(plotID,plot, habitat, tag_number, year, row_col, shts, ht, code.notes) %>% 
    arrange(plot, habitat, tag_number, row_col,year)
  
  return(dupes)
  
}