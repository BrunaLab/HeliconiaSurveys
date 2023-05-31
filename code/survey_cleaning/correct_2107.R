correct_2107 <- function(ha_data) {
  
  suppressMessages({
# 275/68 ------------------------------------------------------------------
  # 2008 data for 275 incorrectly entered as 68
  # add to 275
ha_data$shts[ha_data$plot == 2107 &
               ha_data$tag_number == 275 & 
               ha_data$year == 2008] <- 3

  
ha_data$ht[ha_data$plot == 2107 &
               ha_data$tag_number == 275 & 
               ha_data$year == 2008] <- 36

  # remove from 68
ha_data$shts[ha_data$plot == 2107 &
               ha_data$tag_number == 68 &
               ha_data$year == 2008] <- NA

ha_data$ht[ha_data$plot == 2107 &
             ha_data$tag_number == 68 &
             ha_data$year == 2008] <- NA



# 311/129 -----------------------------------------------------------------
  # 2008 data for 311 incorrectly entered as 129
  # add to 311
ha_data$shts[ha_data$plot == 2107 &
               ha_data$tag_number == 311 & 
               ha_data$year == 2008] <- 2

ha_data$ht[ha_data$plot == 2107 &
             ha_data$tag_number == 311 & 
             ha_data$year == 2008] <- 20

  # remove from 129
ha_data$shts[ha_data$plot == 2107 &
               ha_data$tag_number == 129 &
               ha_data$year == 2008] <- NA

ha_data$ht[ha_data$plot == 2107 &
             ha_data$tag_number == 129 &
             ha_data$year == 2008] <- NA


# 337/237 -----------------------------------------------------------------
  # 237 in D6 is actually 337. Actual 237 is in C8
ha_data$tag_number[ha_data$plot == 2107 &
                       ha_data$row == "D" &
                       ha_data$column == 6 &
                       ha_data$tag_number == 237] <- 337

# updating codes ----------------------------------------------------------

# 228 ---------------------------------------------------------------------
  # Plant 228: code say 'dead (2)' in 2006, should be missing
ha_data$code[ha_data$plot == 2107 &
               ha_data$year == 2006 &
               ha_data$tag_number == 228] <- "missing"


# 282 ---------------------------------------------------------------------
  # Plant 282: code say 'dead (2)' in 2006, should be missing
ha_data$code[ha_data$plot == 2107 &
               ha_data$year == 2006 &
               ha_data$tag_number == 282] <- "missing"

ha_data$code[ha_data$plot == 2107 &
               ha_data$year == 2005 &
               ha_data$tag_number == 282] <- NA

ha_data$ht[ha_data$plot == 2107 &
               ha_data$year == 2005 &
               ha_data$tag_number == 282] <- NA

ha_data$shts[ha_data$plot == 2107 &
               ha_data$year == 2005 &
               ha_data$tag_number == 282] <- NA

# Incorrectly entered in 2005 ---------------------------------------------

  # 157 ---------------------------------------------------------------------
ha_data$shts[ha_data$plot == 2107 &
               ha_data$year == 2005 &
               ha_data$tag_number == 157] <- 3
ha_data$ht[ha_data$plot == 2107 &
             ha_data$year == 2005 &
             ha_data$tag_number == 157] <- 65


  # 189 ---------------------------------------------------------------------
ha_data$shts[ha_data$plot == 2107 &
               ha_data$year == 2005 &
               ha_data$tag_number == 189] <- 3
ha_data$ht[ha_data$plot == 2107 &
             ha_data$year == 2005 &
             ha_data$tag_number == 189] <- 23

# 282 ---------------------------------------------------------------------
  # 282 recorded dead in 2005 & 2006, but was either missing or true zero
ha_data<-ha_data %>%
  mutate(shts=replace(shts, plot==2107 & year==2005 & tag_number==282,0)) %>% 
  mutate(shts=replace(shts, plot==2107 & year==2006 & tag_number==282,0)) %>% 
  mutate(ht=replace(ht, plot==2107 & year==2005 & tag_number==282,0)) %>% 
  mutate(ht=replace(ht, plot==2107 & year==2006 & tag_number==282,0)) %>% 
  mutate(code=replace(code, plot==2107 & year==2006 & tag_number==282,NA)) 
  
# 222 ---------------------------------------------------------------------
  # 222 retagged as 302 in 2006 but wrong measurments typed in
ha_data<-ha_data %>% 
  mutate(shts=replace(shts, plot==2107 & year==2006 & tag_number==302, 4)) %>% 
  mutate(ht=replace(ht, plot==2107 & year==2006 & tag_number==302, 73)) %>% 
  mutate(infl=replace(infl, plot==2107 & year==2006 & tag_number==302,1))

  # delete  222
delete222 <- ha_data %>%
  filter(plot == 2107 & tag_number == 222)
ha_data <- anti_join(ha_data, delete222)
rm(delete222)

# 333 ---------------------------------------------------------------------
  # 333 was recorded in plot 2108 but is actually in 2107. 
  # Also added the missing years of data
ha_data<-ha_data %>% 
  mutate(shts=replace(shts, plot==2107 & year==2008 & tag_number==333, 2)) %>% 
  mutate(ht=replace(ht, plot==2107 & year==2008 & tag_number==333, 15)) %>% 
  mutate(code=replace(code, plot==2107 & year==2006 & tag_number==333, "sdlg")) %>%
  mutate(shts=replace(shts, plot==2107 & year==2006 & tag_number==333, 1)) %>% 
  mutate(ht=replace(ht, plot==2107 & year==2006 & tag_number==333, 11)) %>% 
  mutate(shts=replace(shts, plot==2107 & year==2007 & tag_number==333, 1)) %>% 
  mutate(ht=replace(ht, plot==2107 & year==2007 & tag_number==333, 12)) 


# 17/216 ------------------------------------------------------------------
  # 17 was retagged as 216 in 1999
ha_data<-ha_data %>%
  mutate(ht=replace(ht, plot==2107 & year==1998 & tag_number==216, 36)) %>% 
  mutate(shts=replace(shts, plot==2107 & year==1998 & tag_number==216, 2))

  # delete the 17
delete17<-ha_data %>% filter(plot==2107 & 
                              tag_number==17)
ha_data<-anti_join(ha_data,delete17)
rm(delete17)

# 25/187 ------------------------------------------------------------------
  # 25 was retagged as 187 in 1999
ha_data<-ha_data %>%
mutate(ht=replace(ht, plot==2107 & year==1998 & tag_number==187, 17)) %>% 
  mutate(shts=replace(shts, plot==2107 & year==1998 & tag_number==187, 1))

  # delete the 25
delete25<-ha_data %>% filter(plot==2107 & 
                               tag_number==25)
ha_data<-anti_join(ha_data,delete25)
rm(delete25)

})
return(ha_data)
}


