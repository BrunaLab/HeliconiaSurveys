library(rfigshare)
library(tidyverse)
url <- fs_download(1273926, mine = FALSE, session = NULL)
#> No encoding supplied: defaulting to UTF-8.
seed_data <- read_csv(url) %>% 
  as_tibble() %>% 
  summarize(mean=mean(No_of_seeds),
            sd=sd(No_of_seeds),
            n=n())

seed_data



