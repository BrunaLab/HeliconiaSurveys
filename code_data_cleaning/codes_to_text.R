codes_to_text <- function(ha_data) {
  
  ha_data$code <- as.factor(ha_data$code)
  summary(ha_data$code)
  levels(ha_data$code)[levels(ha_data$code) == "1"] <-  "sdlg"
  levels(ha_data$code)[levels(ha_data$code) == "ULY"] <-  "ULY"
  levels(ha_data$code)[levels(ha_data$code) == "3"] <- "ULY"
  levels(ha_data$code)[levels(ha_data$code) == "2"] <-  "dead"
  levels(ha_data$code)[levels(ha_data$code) == "4"] <-  "ULY"
  levels(ha_data$code)[levels(ha_data$code) == "5"] <-  "dead"
  levels(ha_data$code)[levels(ha_data$code) == "6"] <-  "new plant in plot"
  levels(ha_data$code)[levels(ha_data$code) == "7"] <-  "dried"
  levels(ha_data$code)[levels(ha_data$code) == "10"] <-  "resprouting"
  levels(ha_data$code)[levels(ha_data$code) == "40"] <-  "not on list"
  levels(ha_data$code)[levels(ha_data$code) == "50"] <-  "no tag"
  levels(ha_data$code)[levels(ha_data$code) == "60"] <-  "missing"
  levels(ha_data$code)[levels(ha_data$code) == "70"] <-  "under litter"
  levels(ha_data$code)[levels(ha_data$code) == "80"] <-  "under treefall"
  levels(ha_data$code)[levels(ha_data$code) == "90"] <-  "under branchfall"
  levels(ha_data$code)[levels(ha_data$code) == "100"] <-  "dead and not on list"
  levels(ha_data$code)[levels(ha_data$code) == "200"] <-  "2x in field"
  levels(ha_data$code)[levels(ha_data$code) == "300"] <-  "dead"
  levels(ha_data$code)[levels(ha_data$code) == "1, 200 "] <-  "sdlg"
  levels(ha_data$code)[levels(ha_data$code) == ""] <- NA
  
  
  
  # unique(ha_data$code)
  # 
  # CLEAN UP CODES FROM PA10
  ha_data$notes <-as.character(NA)
  ha_data$code<-as.character(ha_data$code)
  ha_data$code<-trimws(ha_data$code)
  ha_data <- ha_data %>%
    mutate(notes = if_else(code == "not on list. must be313","is it 133?", notes)) %>% 
    mutate(notes = if_else(code == "1 new infl + 1 old infl","1 new infl + 1 old infl", notes)) %>% 
    mutate(notes = if_else(code == "not on list. must be96","is it 96?", notes)) %>% 
    mutate(notes = if_else(code == "1 old infl","1 old infl", notes)) %>% 
    mutate(notes = if_else(code == "2 old infl","2 old infl", notes)) %>% 
    mutate(notes = if_else(code == "2 old infls","2 old infl", notes)) %>% 
    mutate(notes = if_else(code == "3 old infls","2 old infl", notes)) %>% 
    mutate(notes = if_else(code == "actualkly in c8","in c8", notes)) %>% 
    mutate(notes = if_else(code == "actually  B5","in b5", notes)) %>% 
    mutate(notes = if_else(code == "actually  A6","in a6", notes)) %>% 
    mutate(notes = if_else(code == "should be c5","in c5", notes)) %>% 
    mutate(notes = if_else(code == "this number belongs to a pvc in a6","this no belongs to pvc in a6", notes)) %>% 
    mutate(notes = if_else(code == "pvc stake not on list","pvc stake not on list", notes)) %>% 
    mutate(notes = if_else(code == "its in C2","its in C2", notes)) %>% 
    mutate(notes = if_else(code == "e E6","its in e6", notes)) %>% 
    mutate(notes = if_else(code == "3 old infl","2 old infl", notes)) %>% 
    mutate(notes = if_else(code == "horrible treefall in plot","horrible treefall in plot", notes)) %>% 
    mutate(notes = if_else(code == "treefall in plot","treefall in plot", notes)) %>% 
    mutate(notes = if_else(code == "horrible treefall in plot, can barely make it in","horrible treefall in plot, can barely make it in", notes)) %>% 
    mutate(notes = if_else(code == "lots of small branchfalls in plot","lots of small branchfalls in plot", notes)) %>% 
    mutate(notes = if_else(code == "plot is 50% treefall","plot is 50% treefall", notes)) %>% 
    mutate(notes = if_else(code == "trefall","trefall", notes)) %>% 
    mutate(code = if_else(code=="dead","dead", code)) %>% 
    
    mutate(code = if_else(code == "under trunk","under treefall", code)) %>% 
    mutate(code = if_else(code == "under treefall","under treefall", code)) %>% 
    mutate(code = if_else(code == "under fallen trunk","under treefall", code)) %>% 
    mutate(code= na_if(code, "under trunk")) %>%
    mutate(code= na_if(code, "under treefall")) %>%
    mutate(code= na_if(code, "under fallen trunk")) %>%
    mutate(code = if_else(code == "under branch" | code == "under branch), must have lost tag",
                          "under branchfall", code)) %>% 
    mutate(code= na_if(code, "under branch")) %>%
    mutate(code= na_if(code, "under branch, must have lost tag")) %>%
    mutate(code = if_else(code == "not on list","not on list", code)) %>% 
    mutate(code= na_if(code, "not on list")) %>% 
    mutate(code = if_else(code == "missing","missing", code)) %>% 

    mutate(code = if_else(code== "ULY?","ULY", code)) %>% 
    mutate(code= na_if(code, "ULY?")) %>% 
    mutate(code = if_else(code== "not on list. must be313","not on list", code)) %>% 
    mutate(code = if_else(code== "not on list. must be96","not on list", code)) %>% 
    mutate(code= na_if(code, "not on list. must be313")) %>% 
    mutate(code= na_if(code, "not on list. must be96")) %>% 
    mutate(code= na_if(code, "must be one of missing")) %>% 
    mutate(code = if_else(code== "Dead, Not on List","dead and not on list", code)) %>% 
    mutate(code= if_else(code == "dead, not on list","dead and not on list", code)) %>% 
    mutate(code= na_if(code, "Dead, Not on List")) %>% 
    mutate(code= na_if(code, "dead, not on list")) %>% 
    mutate(code= na_if(code, "could be one of missing")) %>% 
    mutate(code= na_if(code, "could be 1333")) %>% 
    mutate(code= na_if(code, "could be 378")) %>% 
    mutate(code= na_if(code, "could be 680?")) %>% 
    mutate(code= na_if(code, "must have lost tag")) %>% 
    mutate(code= na_if(code, "1 new infl + 1 old infl")) %>% 
    mutate(code= na_if(code, "1 old infl")) %>% 
    mutate(code= na_if(code, "2 old infl")) %>% 
    mutate(code= na_if(code, "2 old infls")) %>%
    mutate(code= na_if(code, "3 old infls")) %>%
    mutate(code= na_if(code, "actualkly in c8")) %>%
    mutate(code= na_if(code, "actually  B5")) %>%
    mutate(code= na_if(code, "actually in A6")) %>% 
    mutate(code= na_if(code, "should be c5")) %>%
    mutate(code= na_if(code, "this number belongs to a pvc in a6")) %>%
    mutate(code = if_else(code == "pvc stake not on list","not on list", code)) %>% 
    mutate(code= na_if(code, "pvc stake not on list")) %>%
    mutate(code= na_if(code, "its in C2")) %>%
    mutate(code= na_if(code, "e E6")) %>%
    mutate(code= na_if(code, ", must have lost tag")) %>%
    mutate(code= na_if(code, "3 old infl")) %>% 
    mutate(infl = if_else(infl==0 & code == "1 new infl" , 1L, infl)) %>% 
    mutate(code= na_if(code,"1 new infl")) %>% 
    mutate(code= na_if(code, "horrible treefall in plot")) %>%
    mutate(code= na_if(code, "treefall in plot")) %>%
    mutate(code= na_if(code, "horrible treefall in plot, can barely make it in")) %>%
    mutate(code= na_if(code, "lots of small branchfalls in plot")) %>%
    mutate(code= na_if(code, "plot is 50% treefall")) %>%
    mutate(code= na_if(code, "trefall")) 
  
    ha_data$code<-trimws(ha_data$code)

  ha_data$code<-as.character(ha_data$code)

  return(ha_data)
}