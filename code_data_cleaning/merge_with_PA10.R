merge_with_PA10 <- function(test) {
  PA10 <- read_csv("./data_midway/PA10_wide_to_join.csv")
  
  # PA10 <- PA10 %>% rename("plotID"="HA.plot")
  str(test$column)
  PA10$column <-as.factor(PA10$column)
  PA10$plot <-as.factor(PA10$plot)
  PA10$year <-as.character(PA10$year)
  PA10$bdffp_reserve_no <-as.factor(PA10$bdffp_reserve_no)
  PA10$column <-as.factor(PA10$column)
  
  test2 <- bind_rows(test,PA10)
  
  
  # add a unique id number for the PA10
  # max_ha_id<-max(test$HA_ID_Number,na.rm=TRUE)
  test3 <- test2 %>%
    group_by(plotID,tag_number) %>%
    mutate(HA_ID_Number = ifelse(is.na(HA_ID_Number), cur_group_id(),HA_ID_Number))
  return(test3)
}