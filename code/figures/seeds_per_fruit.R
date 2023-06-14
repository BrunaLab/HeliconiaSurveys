
# code to calculate the number of seeds per fruit --------


# load the libraries ------------------------------------------------------


library(rfigshare)
library(tidyverse)



# pull the data from Figshare & do calculations ---------------------------

url <- fs_download(1273926, mine = FALSE, session = NULL)
# No encoding supplied: defaulting to UTF-8.

seed_data <- read_csv(url) %>% 
  as_tibble() 

names(seed_data)<-tolower(names(seed_data))
min_seeds <- min(seed_data$no_of_seeds)
max_seeds <- max(seed_data$no_of_seeds)

seed_summary <- seed_data %>% 
  summarize(mean=mean(no_of_seeds),
            sd=sd(no_of_seeds),
            n=n())

seed_summary <- seed_summary %>% 
  mutate(min=min_seeds,
         max=max_seeds)



seed_summary