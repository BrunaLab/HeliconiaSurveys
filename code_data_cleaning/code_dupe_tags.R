code_dupe_tags <- function(ha_data) {
  
  # ha_data$row_col <- do.call(paste, c(ha_data[c("row", "column")], sep = ""))
  
  duplicates <- ha_data %>% 
    group_by(habitat, plot, tag_number, year) %>% 
    filter(n()>1) %>% 
    ungroup() %>% 
    select(plot, tag_number) %>% 
    unique() %>% 
    ungroup()
  
  
  duplicates$tag_number <- as.numeric(duplicates$tag_number)
  duplicates$duplicate_tag <- "duplicate tag number"
  
  
# 
#   duplicates <- 
#     semi_join(ha_data, duplicates, by = c("plot", "tag_number")) %>% 
#     select(plot_id,plot, habitat,  plant_id,   tag_number, year, row,column, shts, ht, code) %>% 
#     arrange(plot, habitat, tag_number,  row,column,year) %>% # detect all the ones with decimals
#     bind_rows(ha_data %>% filter(str_detect(tag_number, "\\."))) %>% 
#     ungroup()
  
  
  #  now label the duplicates in the ha_data df
  # 
  # duplicate_tags <- duplicates %>%
  #   select(tag_number, plot) %>%
  #   group_by(tag_number, plot) %>%
  #   slice(1) %>%
  #   filter(tag_number > 0) %>%
  #   arrange(plot)
  
  # duplicate_tags
  
  ha_data <- left_join(ha_data, duplicates,by=c("plot","tag_number"))
  # names(ha_data)
  

  

  return(ha_data)
  
}