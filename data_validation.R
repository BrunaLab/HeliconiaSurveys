
# Data validation with the pointblank package -----------------------------

#' Author: Eric Scott
#' This uses pointblank to create a data validation report.
#' In the resulting table at the end, any failing tests should have a CSV button that lets you see just the rows of data that don't pass.
#'

# Packages ----------------------------------------------------------------

library(pointblank)
library(readr)
library(here)
library(dplyr)
library(stringr)

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
al_default <-  action_levels(warn_at = 0.01, stop_at = 0.05)
# Warn if any rows fail, error if 10 or more rows fail.
al_strict <- action_levels(warn_at = 1, stop_at = 10)

# Function for preconditions for some steps
calc_changes <- function(x) {
  x %>%
    group_by(HA_ID_Number) %>%
    arrange(HA_ID_Number, year) %>%
    mutate(ht_prev = lag(ht),
           shts_prev = lag(shts),
           ht_diff = ht - ht_prev,
           shts_diff = shts - shts_prev,
           ht_pc = abs(ht_diff / ht_prev),
           shts_pc = abs(shts_diff / shts_prev)) %>%
    ungroup()
}

# Do validation
ha %>%
  create_agent(
    actions = al_default
  ) %>%
  col_is_character(vars(plot, habitat, ranch, bdffp_reserve_no, row, code.notes)) %>%
  col_is_numeric(vars(HA_ID_Number, tag_number ,column, year, ht, shts, infl)) %>%
  col_vals_in_set(vars(column), 1:10) %>%
  col_vals_in_set(vars(row), LETTERS[1:10]) %>%
  col_vals_in_set(vars(habitat), c("1-ha", "CF", "10-ha"),
                  actions = al_strict) %>%
  # check values are within reasonable range
  col_vals_between(vars(shts), 1, 20, na_pass = TRUE) %>%
  col_vals_between(vars(ht), 0, 200, na_pass = TRUE,
                   actions = al_strict) %>%
  col_vals_between(vars(infl), 0, 3, na_pass = TRUE) %>%
  # check that year-to-year change is reasonable
  col_vals_lt(vars(ht_pc), 2, na_pass = TRUE,
              preconditions = ~ . %>% calc_changes(),
              label = "% ht change < 200%") %>%
  col_vals_between(vars(ht_diff), -100, 100, na_pass = TRUE,
                   preconditions = ~. %>% calc_changes(),
                   label = "Ht change < 100cm",
                   actions = al_strict) %>%
  col_vals_between(vars(shts_diff), -5, 5, na_pass = TRUE,
                   preconditions = ~. %>% calc_changes(),
                   label = "shoot number change < 5",
                   actions = al_strict) %>%
  # check precision is correct
  col_vals_expr(label = "Height is measured to nearest cm",
                expr = ~ ht %% 1 == 0, actions = al_strict) %>%
  col_vals_expr(label = "Shoots is interger",
                expr = ~ shts %% 1 == 0, actions = al_strict) %>%
  col_vals_expr(label = "Number of inflorescences is integer",
                expr = ~ infl %% 1 == 0, actions = al_strict) %>%
  rows_distinct(actions = al_strict) %>%
  interrogate()
