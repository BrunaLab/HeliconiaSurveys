correct_2107 <- function(ha_data) {
  
# Plant 237 in D6 is actually 337. The actual 237 is in C8
ha_data$tag_number[ha_data$plot == 2107 &
                     ha_data$row == "D" &
                     ha_data$column == 6 &
                     ha_data$tag_number == 237] <- 337

# ha_data %>% filter((tag_number==68 | tag_number==275), bdffp_reserve_no==2107) %>% 
#   select(year, shts, ht, infl) %>% 
#   pivot_wider(names_from=tag_number, values_from=shts:infl) %>% 
#   mutate()

# tags 68/275
# source <- which(ha_data$tag_number == 68 & ha_data$bdffp_reserve_no == "2107")
# destination <- which(ha_data$tag_number == 275 & ha_data$bdffp_reserve_no == "2107")
# ha_data[c(destination, source), 49:53] <- rbind(ha_data[source, 49:53], rep(NA, 4))

# Updating Codes 
# Plant 228: code say 'dead (2)' in 2006, should be missing (60)
ha_data$code[ha_data$plot == 2107 &
               ha_data$year == 2006 &
               ha_data$tag_number == 228] <- "missing (60)"

# Plant 282: code say 'dead (2)' in 2006, should be missing (60)
ha_data$code[ha_data$plot == 2107 &
               ha_data$year == 2006 &
               ha_data$tag_number == 282] <- "missing (60)"

return(ha_data)
}


