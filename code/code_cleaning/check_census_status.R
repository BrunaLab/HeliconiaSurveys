check_census_status <- function(ha_data) {
  # unique(ha_data$code)
  ha_data <- ha_data %>%
    mutate(census_status = case_when(
      (ht >= 0 | shts >= 0 | infl > 0) ~ "measured", # anything with a measurement is alive
      code == "sdlg" ~ "measured", # new seedlings are alive, even if no ht or sht measurment
      code %in% c("dead", "dead and not on list") ~ "dead", # anything dead is dead
      # code %in% c("sdlg","no tag","plant_no_tag", "ULY","new plant in plot") ~ "new",
      code == "missing" ~ "missing", # in some years plants were marked missing
      TRUE ~ NA_character_ # anything not measured or marked "missing", "dead" or "seedling" is NA
    )) %>%
    group_by(plot, plant_id) %>%
    # fill in the rows down. Any "missing will be recorded as missing until
    # they bump up against another category (dead, measured). Dead will be
    # filled in as dead until the last year of census
    fill(census_status, .direction = "down") %>%
    arrange(plot, plant_id, year)

  # Now keep only those alive, missing, and the first year marked dead
  ha_measured <- ha_data %>% filter(census_status == "measured")
  ha_missing <- ha_data %>% filter(census_status == "missing")
  ha_na <- ha_data %>% filter(is.na(census_status))
  ha_na <- ha_na %>% filter(!is.na(duplicate_tag))
  ha_dead <- ha_data %>%
    filter(census_status == "dead") %>%
    arrange(plot, plant_id, year) %>%
    group_by(plot, plant_id) %>%
    filter(row_number() == 1)

  ha_data <- bind_rows(ha_measured, ha_na, ha_dead, ha_missing) %>%
    arrange(plot, plant_id, year)


  # Some that were NA in all measurements but were duplicate tag numbers weren't getting marked
  # as NA instead of missing in census_status so this takes care of that
  ha_data <- ha_data %>%
    mutate(
      census_status = case_when(
        census_status == "measured" &
          is.na(ht) &
          is.na(shts) &
          is.na(infl) &
          is.na(code) &
          is.na(duplicate_tag) ~ "missing",
        TRUE ~ census_status
      ) # anything not measured or marked "missing", "dead" or "seedling" is NA
    )

  ## The ones under treefalls coming back "measured"
  ha_data <- ha_data %>%
    mutate(
      census_status = case_when(
        is.na(ht) &
          is.na(shts) &
          is.na(infl) &
          census_status == "measured" &
          (treefall_status == "under treefall" |
            treefall_status == "under branchfall") ~ "missing",
        TRUE ~ census_status
      ) # anything not measured or marked "missing", "dead" or "seedling" is NA
    )

  # unique(ha_data$census_status)


  # this gets any left that were coming back as "missing" even after marked "dead"
  ha_data <-
    ha_data %>%
    group_by(plant_id) %>%
    mutate(
      blank_yr_delete = if_else(lag(census_status, 1) == "dead", "delete", NA_character_),
      .before = "code"
    ) %>%
    fill(blank_yr_delete, .direction = "down") %>%
    filter(is.na(blank_yr_delete) == TRUE) %>%
    select(-blank_yr_delete) %>%
    ungroup()



  # Once all these columns have been added, can delete the notations from the
  # `code` column and make any final changes to the codes


  ha_data <- ha_data %>%
    mutate(code = replace(code, code == "dead", NA)) %>%
    mutate(code = replace(code, code == "dried", NA)) %>%
    mutate(code = replace(code, code == "under branchfall", NA)) %>%
    mutate(code = replace(code, code == "under branchfall, resprouting", NA)) %>%
    mutate(code = replace(code, code == "under litter", NA)) %>%
    mutate(code = replace(code, code == "under treefall", NA)) %>%
    mutate(code = replace(code, code == "resprouting", NA)) %>%
    mutate(code = replace(code, code == "missing", NA)) %>%
    mutate(code = replace(code, code == "2x in field", NA)) %>%
    mutate(code = replace(code, code == "sdlg", NA)) %>%
    mutate(code = case_when(
      code == "resprouting" ~ "resprouting",
      code == "dried" ~ "dried",
      code == "ULY" ~ "ULY",
      code == "new plant in plot" ~ "ULY",
      code == "not on list" ~ "NOL",
      code == "dead and not on list" ~ "NOL",
      TRUE ~ code
    )) %>%
    mutate(treefall_status = case_when(
      treefall_status == "under branchfall" ~ "branch",
      treefall_status == "under treefall" ~ "tree",
      treefall_status == "under litter" ~ "litter",
      TRUE ~ treefall_status
    ))

  return(ha_data)
}
