correct_2206 <- function(ha_data) {
  suppressMessages({
    
# 270 ---------------------------------------------------------------------
    # 270 was on the edge of 2 plots with branchfalls and hence was 
    # recorded in diff locations in diff years. Put in B10
    ha_data$shts[ha_data$plot == 2206 & 
                   ha_data$year == 2006 & 
                   ha_data$tag_number == 270] <- 1
    ha_data$ht[ha_data$plot == 2206 & 
                 ha_data$year == 2006 & 
                 ha_data$tag_number == 270] <- 15
    ha_data$code[ha_data$plot == 2206 & 
                   ha_data$year == 2006 & 
                   ha_data$tag_number == 270] <- "under branchfall"

    # delete the one in C10
    omit270 <- ha_data %>% filter(plot == 2206 &
      tag_number == 270 &
      row == "C" &
      column == 10)
    ha_data <- anti_join(ha_data, omit270)
    rm(omit270)


# 201 ---------------------------------------------------------------------
    # Correcting NOL code
    ha_data <- ha_data %>%
      mutate(code = replace(code, plot == 2206 & 
                              year == 2005 & 
                              tag_number == 201, NA)) %>%
      mutate(code = replace(code, plot == 2206 &
                              year == 2004 & 
                              tag_number == 201, "sdlg")) %>%
      mutate(shts = replace(shts, plot == 2206 & 
                              year == 2004 & 
                              tag_number == 201, 1)) %>%
      mutate(ht = replace(ht, plot == 2206 & 
                            year == 2004 & 
                            tag_number == 201, 19))

# 7/70/45/25 in 2003 ------------------------------------------------------

    # 7, 70, 45, 25: Some survey confusion in 2003
    # in 2002 there a note that Osmaildo dropped tag for 45 so it was marked
    # with new tag no. 25 BUT in 2004-2006 45 was measured in c3 
    # (later remapped to c2 in 06) AND in 2002 70 was a seedling, 
    # it measured in 03, and missing after.
    # I think the sequence of events is as follows:

    # 25 was on ground in 2003, so height should be NA.
    # This is the only correction needed for 35
    ha_data <- ha_data %>%
      mutate(ht = replace(ht, plot == 2206 & 
                            year == 2003 & 
                            tag_number == 25, NA))

    # 70 is at the base of 7. The measurement for 70 in 2003 is actually 70
    ha_data <- ha_data %>%
      mutate(shts = replace(shts, plot == 2206 & 
                              year == 2003 & 
                              tag_number == 7, 2)) %>%
      mutate(ht = replace(ht, plot == 2206 & 
                            year == 2003 & 
                            tag_number == 7, 58)) %>%
      mutate(infl = replace(infl, plot == 2206 & 
                              year == 2003 & 
                              tag_number == 7, 1))

    # 70 was mismeasured in missing in 2003 and missing in 2004. I think the tag
    # was lost, and when the 45 tag was found it was stuck onto what was 
    # originally 70. Easiest fix is to add sdlg year data to 45, then delete 70
    ha_data <- ha_data %>%
      mutate(shts = replace(shts, plot == 2206 &
                              year == 2003 & 
                              tag_number == 45, 1)) %>%
      mutate(ht = replace(ht, plot == 2206 & 
                            year == 2003 & 
                            tag_number == 45, 14)) %>%
      mutate(code = replace(code, plot == 2206 & 
                              year == 2003 &
                              tag_number == 70, "sdlg"))

    omit70 <- ha_data %>% filter(plot == 2206 & tag_number == 70)
    
    ha_data <- anti_join(ha_data, omit70)
    
    rm(omit70)
    
# delete rows with year == 2007 -------------------------------------------

    # DELETE ALL ROWS WITH 2007 (no survey that year)
    delete2007 <- ha_data %>% filter(plot == 2206 & year == 2007)
    
    ha_data <- anti_join(ha_data, delete2007)
    
    rm(delete2007)
    
  })

  return(ha_data)
}
