find_no_tags <- function(ha_data) {
  
  
  
  # 1999 was still setting up plots, so those "uly" need to be converted to new plants
  
  
  ha_data <- ha_data %>%
    mutate(adult_no_tag = case_when(
      (adult_no_tag == TRUE & year == 1999) ~ FALSE,
      .default = adult_no_tag
    ))
  
  
  
  tagless_plants <-
    ha_data %>%
    filter(adult_no_tag == TRUE) %>%
    arrange(notes, plot, year, tag_number) %>%
    select(-ht, -shts, -infl, -x_09, -y_09, -notes)




  # tagless_plants_yr <- tagless_plants_raw %>%
  #   group_by(year) %>%
  #   tally() %>%
  #   arrange((year))

  if (nrow(tagless_plants) == 0) {
    x <- "\n
    ------------------------------------------------------------------
    Your dataset has NO 'adult' (i.e., established) plants that were
    found in the plots without a tag.
    ------------------------------------------------------------------
    \n"

    writeLines(x)
  } else {
    
    tagless_summary <- tagless_plants %>%
      group_by(habitat, plot) %>%
      tally() %>%
      arrange(desc(n))
    
    x <- "\n
    ------------------------------------------------------------------
    There were 'adult' plants (i.e., larger, established individuals) 
    found without a tag during during one or more field surveys. 
    A csv file of these plants has been saved to:
    `data/data_review/adult_heliconia_no_tag.csv`
    
    A summary of how many of these plants were in each plot is:"

    writeLines(x)

    print(tagless_summary)
    
    y <- "\n
    ------------------------------------------------------------------"
    writeLines(y)
    
    # Save the files ----------------------------------------------------------

    if (!dir.exists("./data/data_review")) {
      dir.create("./data/data_review")
    } else {
      # print(" ")
      # placeholder - does nothing
    }



    write_csv(tagless_plants, "./data/data_review/adult_heliconia_no_tag.csv")
  }
}


# ULY Review  --------------------------------------------------


# These are the ULY plants marked after 1999 (by which time plots had been
# surveyed quite a bit and so would expect very few
# ULYs_post99 <-
#   ha_data %>%
#   filter(code == "no tag" | code == "ULY" | code == "new plant in plot") %>%
#   filter(year > 1999) %>%
#   arrange(notes, plot, year, tag_number) %>%
#   select(-infl, -x_09, -y_09)
#
# # mean(ULYs_post99$shts,na.rm=TRUE)
# # range(ULYs_post99$shts,na.rm=TRUE)
# # mean(ULYs_post99$ht,na.rm=TRUE)
# # range(ULYs_post99$ht,na.rm=TRUE)
#
# # plot(ULYs_post99$shts,ULYs_post99$ht)
# # write_csv(ULYs_post99, "./data_check/tagless_plants_post1999.csv")
# #
# # Summary of the post-1999 ULYs
# # ULYs_post99_summary <- ULYs_post99 %>%
# #   # group_by(plot, year, row, column) %>%
# #   # group_by(plot, year) %>%
# #   group_by(plot) %>%
# #   summarize(n = n()) %>%
# #   arrange(desc(n))
#
#
#
#
# # summary((ha_data$found_without_tag))
# # summary((as.factor(ha_data$code)))
# # unique(ha_data$found_without_tag)
#
#
# # Remove the ULY code from plants in 1999
#
#
#
# x<-"\n
#   ------------------------------------------------------------------
#   This function also identifies all 'ULY plants' found in surveys conducted
#   after 1999, by which time it was unlikely a plant had actually been missed
#   in previous years.
#
#   A csv file of all 'uly plants' marked *after* the 1999 survey has
#   been saved as `ULYs_post99.csv`.
#
#   A summary of how many of these plants were identified per plot is below.
#
#   **The ULY tag was removed from the post-1999 plants.**
#   They should be reviewed and coded as new, plants that lost tags, etc.
#
#   ------------------------------------------------------------------
#   \n"
#
# writeLines(x)
#
# print(uly_)
# }
