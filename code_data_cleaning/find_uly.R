find_uly <- function(ha_data) {
  uly_plants <-
    ha_data %>%
    filter(code == "no tag" | code == "ULY" | code == "new plant in plot") %>%
    arrange(notes, plot, year, tag_number) %>%
    select(-ht, -shts, -infl, -x_09, -y_09, -notes)



  # This just prints them out with each plant separated by a row
  if (nrow(uly_plants) == 0) {
    
    
    x<-"\n
    ------------------------------------------------------------------
    There are no 'ULY' plants in your dataset.
    ------------------------------------------------------------------
    \n"
    
    writeLines(x)   
  
  } else {
    
    
    x<-"\n
    ------------------------------------------------------------------
    This function returns a summary of how many 'ULY Plants' are 
    found in each demographic plot (this is also printed below). 
    
    A csv file of all ULY Plants remaining in your dataset has 
    been saved as `uly_heliconia.csv`
    ------------------------------------------------------------------
    \n"
    
    writeLines(x)   
    
    
    
    uly_summary <- uly_plants %>%
      group_by(habitat, plot) %>%
      tally() %>%
      arrange(n)

    print(uly_summary)
    
    # summary(as.factor(ULY$code == ULY$notes))

    write_csv(uly_plants, "./data_check/uly_heliconia.csv")
  }

  # return(dupes)
  return(uly_summary)
}
