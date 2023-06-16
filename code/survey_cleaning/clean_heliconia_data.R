clean_heliconia_data <- function() {
  # Code Overview -----------------------------------------------------------
  # Script created by Emilio M. Bruna, embruna@ufl.edu
  # Script created in R version 3.3.1

  # Load libraries ----------------------------------------------------------

  library(tidyverse)
  library(readxl)


# create version file -----------------------------------------------------
 
  source("./code/create_version_file.R")
  dataset<-"heliconia_survey_clean"
  create_version_file(dataset)

  
  # STEP 1: Load raw data and prep for cleanup ------------------------------

  # load the demog data (for all plots except PA-10)  -----------------------

  source("./code/survey_cleaning/prep_raw_ha_data.R")
  ha_data <- prep_raw_ha_data()

  # merge with the census data from PA-10 ha --------------------------------

  # The data from Porto Alegre's 10-ha fragment were in a different CSV file.
  # They were cleaned up and merged with the rest of the demographic data
  # with the function `merge_with_PA10.R`

  source("./code/survey_cleaning/merge_with_PA10.R")
  ha_data <- merge_with_PA10(ha_data)

  
  # Add a unique plant_id index number for each plant -----------------------

  # adding the plant id number here means any subsequent edits or correction
  # (now or post-publication will *not* change a plant's unique ID number.
  ha_data <- ha_data %>%
    group_by(plot, row, column, tag_number) %>%
    mutate(plant_id = cur_group_id(), .before = 1)

  

  # STEP 2: Cleanup & Corrections -------------------------------------------

  # clean-up the `codes` column ---------------------------------------------
  # The survey team often recorded observations about individual plants or
  # the conditions in plots. These were entered as numerical codes. The
  # function `clean_codes.R` converts them to text to simplify clean-up

  source("./code/survey_cleaning/cleanup_codes.R")
  ha_data <- cleanup_codes(ha_data)

  # STEP 3: Corrections to demographic data ----------------------------------------

  # corrections for each demographic plot are found in a separate function

  # Continuous Forest
  # CF-1 (aka Florestal) 
  source("./code/survey_cleaning/correct_florestal.R")
  ha_data <- correct_florestal(ha_data)

  # CF-2 (aka Esteio/Camp 41, 5750)
  source("./code/survey_cleaning/correct_5750.R")
  ha_data <- correct_5750(ha_data)

  # CF-3 (aka Esteio/Camp 41, 5756)
  source("./code/survey_cleaning/correct_5756.R")
  ha_data <- correct_5756(ha_data)

  # CF-4 (aka Dimona-CF)
  source("./code/survey_cleaning/correct_dimona_cf.R")
  ha_data <- correct_dimona_cf(ha_data)

  # CF-5 (aka Porto Alegre CF) 
  source("./code/survey_cleaning/correct_pa_cf.R")
  ha_data <- correct_pa_cf(ha_data)

  # CF-6 (aka CaboFrio-CF)
  source("./code/survey_cleaning/correct_cabofrio_cf.R")
  ha_data <- correct_cabofrio_cf(ha_data)

  # 1-ha Fragments
  # FF-1 (aka Dimona 1-ha 2107)
  source("./code/survey_cleaning/correct_2107.R")
  ha_data <- correct_2107(ha_data)

  # FF-2 (aka Dimona 1-ha 2108) 
  source("./code/survey_cleaning/correct_2108.R")
  ha_data <- correct_2108(ha_data)

  # Corrections FF-3 (aka Colosso 1-ha, 5751) -----------------------------
  source("./code/survey_cleaning/correct_5751.R")
  ha_data <- correct_5751(ha_data)

  # FF-4 (aka Porto Alegre 1-ha, 5753) 
  source("./code/survey_cleaning/correct_5753.R")
  ha_data <- correct_5753(ha_data)

  # 10-ha fragments
  # FF-5 (aka Dimona 10-ha 2206) 
  source("./code/survey_cleaning/correct_2206.R")
  ha_data <- correct_2206(ha_data)

  # FF-6 (aka Colosso 10-ha 5752) 
  source("./code/survey_cleaning/correct_5752.R")
  ha_data <- correct_5752(ha_data)

  # FF-7 (aka Porto Alegre 10-ha, 5754) 
  source("./code/survey_cleaning/correct_5754.R")
  ha_data <- correct_5754(ha_data)


  # STEP 4: data validation  ----------------------------------------

  # validation of tag numbers
  source("./code/survey_cleaning/check_tags.R")
  ha_data <- check_tags(ha_data)

  # Find and label plants found without tags ------------------------

  # Sometimes the survey team simply misses established plants ("adults" that are
  # in a plot, perhaps because density is so high or it is difficult to see
  # individuals in treefalls. Sometimes plants that were marked will also lose
  # their tags - a branch could fall on them and knock it off, or it could
  # be lost in a treefall, or someone walking though the plot might have kicked
  # it.  All of these plants are given a new tag, with a notation recorded in the
  # survey data sheet that they were an "adult" `plant without tag`, a
  # `new plant in plot`, or `ULY` (i.e., 'unmarked last year').

  # This function:
  # (1) identifies all plants flagged as 'established plants found without a tag
  # in a survey',
  # (2) creates a csv file of these plants for follow-up review,
  # (3) identifies & creates a csv file of "ULY" plants flagged in 1999, and
  # (4) removes the flag from all plants marked this way in 1999.
  # Why 1999? Plots were still being completely surveyed through 99, which is why
  # so many ULY were found in that year.
  # (5) Finally, this function creates a new column to
  # indicate if plants were `found_without_tag` using the logical TRUE/FALSE
# 
#   source("./code/survey_cleaning/check_no_tag.R")
#   ha_data <- check_no_tag(ha_data)

  # creating/validating `status` columns
  
  
  # `Infl` column is conditional: given that a plant is reproductive,
  # how many infloresences does it have? This function scans to 
  # make sure the entries are properly coded.
  
  # this function codes a plant as a new seedling in a given survey year (TRUE/FALSE)
  
  # This codes the options in the branchfall / treefall column
  
  # sometimes the survey team took recorded notes about the physiological
  # condition of plants  (e.g. resprouting, dried up). this function creates a
  # column indicating the condition of plants.
  
  
  # add column indicating if plant was found or missing in survey yr --------
  
  # add census_status (measured/missing)
  
  # This adds a column indicating the status of plants in each year's census
  # (alive, dead, missing,NA...). It's a little more complicated than it sounds;
  # see function for details. The NA plants are duplicate tag numbers, most of
  # which have no measurments of plant size
  
  
  
  source("./code/survey_cleaning/check_condition.R")
  ha_data <- check_condition(ha_data)
  
  # function checks the column of each plant in a survey year (recorded, dead, missing)
  
  source("./code/survey_cleaning/check_census_status.R")
  ha_data <- check_census_status(ha_data)



# final tweak  ------------------------------------------------------------
  ha_data <- ha_data %>% 
  arrange(row, as.numeric(column)) %>%
    mutate(subplot = paste(row, column, sep = ""))  
  
  
  # STEP 5: Save the file -------------------------------------------------

  if (!dir.exists("./data/survey_clean")) {
    dir.create("./data/survey_clean")
  } else {
    # print(" ")
    # Nothing - this is a placeholder
    
    }


  write_csv(ha_data, "./data/survey_clean/heliconia_survey_clean.csv")

  x <- "\n
    ------------------------------------------------------------------
    The raw Heliconia census data have been merged, cleaned, and
    organized. You may now proceed to prepare the dataset for
    uploading to Dryad.

    A csv file of this data is saved in the following folder:
    `data/survey_clean/heliconia_survey_clean.csv`.
    ------------------------------------------------------------------
    \n"

  writeLines(x)

  
  
  no_status<-ha_data %>% filter(is.na(census_status))
  return(ha_data)
}
