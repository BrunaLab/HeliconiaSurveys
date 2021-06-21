
# Data validation with the pointblank package -----------------------------

#' Author: Eric Scott
#' This uses pointblank to create a data validation report.
#' In the resulting table at the end, any failing tests should have a CSV button that lets you see just the rows of data that don't pass.
#'

# Packages ----------------------------------------------------------------

library(pointblank)
library(readr)
library(here)

# Load data ---------------------------------------------------------------

ha <-
  read_csv(
    here("data_clean", "Ha_survey_with_Zombies.csv"),
    col_names = TRUE,
    cols(plot = col_character(),
         bdffp_reserve_no = col_character())
  )

# A few entries don't read in because x_09 was entered with a comma or
# semicolon instead of a decimal.
# problems(ha)
fails <- problems(ha)
fails <-
  fails %>%
  mutate(corrected = str_replace(actual, "[\\,;]", "\\."))

ha$x_09[fails$row] <- fails$corrected

# Validation --------------------------------------------------------------
# Create action levels.  Warn if 1% of rows fail and error if 5% fail.
al <-  action_levels(warn_at = 0.01, stop_at = 0.05)

# Do validation
ha %>%
  create_agent(
    actions = al
  ) %>%
  col_is_character(vars(plot, habitat, ranch, bdffp_reserve_no, row, code.notes)) %>%
  col_is_numeric(vars(HA_ID_Number, tag_number ,column, year, ht, shts, infl)) %>%
  col_vals_in_set(vars(column), 1:10) %>%
  col_vals_in_set(vars(row), LETTERS[1:10]) %>%
  col_vals_in_set(vars(habitat), c("1-ha", "CF", "10-ha")) %>%
  # check values are within reasonable range
  col_vals_between(vars(shts), 1, 20, na_pass = TRUE) %>%
  col_vals_between(vars(ht), 0, 200, na_pass = TRUE) %>%
  col_vals_between(vars(infl), 0, 3, na_pass = TRUE) %>%
  # check precision is correct
  col_vals_expr(label = "Height is measured to nearest cm", expr = ~ ht %% 1 == 0) %>%
  col_vals_expr(label = "Shoots is interger", expr = ~ shts %% 1 == 0) %>%
  col_vals_expr(label = "Number of inflorescences is integer", expr = ~ infl %% 1 == 0) %>%
  rows_distinct() %>%
  interrogate()
