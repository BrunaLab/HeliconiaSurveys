
zombies <- function(test) {
  # test<-ha_long
  df2 <- test
  df2$code2 <- NA
  df2$code2[df2$code == "dead (2)"] <- "dead"
  df2 <- df2 %>%
    group_by(plot, tag_number) %>%
    mutate(code2 = as.character(code2), # can be avoided if key is a character to begin with
           code3 = (cumsum(lag(
             code2 == "dead" & !is.na(code2 == "dead"), default = 0
           )))) %>%
    filter(code3 > 0) %>%
    arrange(plot, tag_number, year) %>%
    ungroup()
  
  summary(df2)
  #All plamts post -dead records, including NA in ALL columnS
  # write.csv(dbl.chk, "./data_midway/post_dead_records.csv",row.names = FALSE)
  
  # df3 - keep these for review (they are the ones that are marked dead but have data after)
  df3 <-
    df2 %>% filter((!is.na(ht) | !is.na(shts))) %>% 
    arrange(plot, tag_number, year) %>% 
    select(-code3) %>% ungroup()
  
  df3$code2<-NULL
  
  
  # df3 <-
  #   bind_rows(df2, df3) %>% select(plot, tag_number, year, ht, shts) %>% unique()
  # 
  zombies_all_yrs <-
    semi_join(test, df3, by = c("plot", "tag_number")) %>% 
    select(plot, habitat, tag_number, row, column,year, shts, ht, code) %>% 
    arrange(habitat, plot, tag_number, year)
  # zombies_all_yrs<-split(zombies_all_yrs, zombies_all_yrs$tag_number)
  # write.csv(zombies_all_yrs, "./data_midway/zombies.csv", row.names = FALSE)
  
  # This just prints them out with each plant separated by a row
  zombies_all_yrs_new <-
    as.data.frame(lapply(zombies_all_yrs, as.character), stringsAsfactors = FALSE)
  zombies_all_yrs_new <-
    head(do.call(
      rbind,
      by(zombies_all_yrs_new, zombies_all_yrs_new$tag_number, rbind, "")
    ),-1)
  
  
  write.csv(zombies_all_yrs_new,
            "./data_midway/zombies_space_btwn_plants.csv",
            row.names = FALSE)
  
  
  
  
  # # df4 - these are the ones you can delete from test. no data after being marked "dead"
  # df4 <- anti_join(df2, df3, by = c("plot", "tag_number", "year"))
  # # you can make sure that they in fact they *are* all NA by looking over them
  # summary(df4)
  
  # 
  # # then delete them from the Ha survey with an anti_join
  # test <- anti_join(test, df4, by = c("plot", "tag_number", "year"))
  # 
  # rm(df, df2, df3, df4, zombies_all_yrs_new)
  
  
  
  return(zombies_all_yrs)
}
