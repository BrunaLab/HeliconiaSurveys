# HDP_survey.csv and HDP_plots.csv
---

## Associated Data Paper 

The complete metadata for these data sets, including detailed descriptions of why and how the data were collected and validated, are in the following Data Paper:

Bruna,E.M., M.Uriarte, M.Rosa Darrigo, P.Rubim, C.F.Jurinitz, E.R.Scott, O.Ferreira da Silva, & W.John Kress. 2023. Demography of the understory herb _Heliconia acuminata_ (Heliconiaceae) in an experimentally fragmented tropical landscape. _Ecology_.


## Overview

This file comprises 11 years (1998-2009) of demographic data from populations of the Amazonian understory herb _Heliconia acuminata_ (LC Rich.) found at Brazil's Biological Dynamics of Forest Fragments Project (BDFFP). The dataset comprises >66,000 plant x year records of 8586 plants, including 3464 seedlings established after the first census. Seven populations were in experimentally isolated fragments (one in each of four 1-ha fragments and one in each of three 10-ha fragments), with the remaining six populations in continuous forest. Each population was in a 50xx 100 m permanent plot, with the distance between plots ranging from 500 m-60 km. The plants in each plot were censused annually, at which time we recorded, identified, marked, and measured new seedlings, identified any previously marked plants that died, and recorded the size of surviving individuals. Each plot was also surveyed 4-5 times during the flowering season to identify reproductive plants and record the number of inflorescences each produced.

This data set describes the demographic plots in which surveys were conducted (HDP_plots.csv) and the demographic survey data (HDP_survey.csv).

## Description of the data and file structure: HDP_survey.csv

- Format and storage mode: ASCII text, comma delimited. No compression scheme used.

- Header information: The first row of the file contains the variable names.

- Variables:

-- plot_id: Plot in which plant is located (values: FF1-FF7, CF1-CF6)

-- subplot: Subplot in which plant is located  (values: A1-E10 except in CF3, where F6-J10)

-- plant_id: Unique ID no. assigned to plant (values: range = 1-8660, units: number, precision: 1)

-- tag_number: Number on tag attached to plant (values: range = 1-3751, units: number, precision: 1)

-- year: Calendar year of survey (values: range = 1998-2009, units: year, precision: 1))

-- shts: No. of shoots when surveyed (values: range = 0-24, units: shoots, precision: 1, NA: data missing)

-- ht: Plant height when surveyed (values: range = 0-226, units: cm, precision: 1, NA: data missing)

-- infl: No. of inflorescences (if flowering) (values: range = 1-7, units: shoots, precision: 1, NA: data missing)

-- recorded_sdlg: New seedling (values: TRUE, FALSE)

-- adult_no_tag: Established (i.e., post-seedling) individual without tag (values: TRUE, FALSE)

-- treefall_status: Plant found under fallen tree crown, branches, or leaf litter at time of survey (values: branch = under fallen tree limbs tree = under tree crown or fallen trees litter = under accumulated leaf-litter NA = not relevant or no observation recorded)

-- census_status: Plant status in a census (values: measured = alive, measured dead = died prior to census missing = not found during census)



## Description of the data and file structure: HDP_plots.csv

- Format and storage mode: ASCII text, comma delimited. No compression scheme used.

- Header information: The first row of the file contains the variable names.

- Variables:

-- plot_id: Code used to identify a plot (Values: FF1-FF7 = plots in fragments, CF1-CF6 = plots in continuous forest)

-- habitat: Habitat in which a plot is located (Values: one = 1-ha fragment, ten = 10-ha fragment, forest = continuous forest)

-- ranch: Ranch in which a plot is located (Values: porto alegre, esteio, dimona)

-- bdffp_no: BDFFPs Reserve ID Number (Values: 1104, 1202, 1301, 1501, 2107, 2108, 2206, 3209, 3402, NA)

-- yr_isolated: for fragments, the year they were initially isolated by felling (and in some cases burning) the trees surrounding them

## Describe relationships between data files, missing data codes, other abbreviations used. Be as descriptive as possible.

- Missing values are represented with NA. 

## Sharing/Access information

- Though we welcome opportunities to collaborate with interested users, there are no restrictions on the use this data set. However, we do request that those using the data for teaching or research inform us of how they are doing so and cite the Bruna et al. Data Paper in Ecology and this Dryad archive. 

- Any publication using the data must include a BDFFP Technical Series Number in the Acknowledgments. Authors can request this series number upon the acceptance of their article by contacting the BDFFP's Scientific Coordinator or E. M. Bruna.


## Complementary Data, questions regarding the data sets, and PI Contact Information:

Project-related information, including contact information for the PIs, can be found at the HDP Github Repository ([https://github.com/BrunaLab/HeliconiaSurveys](https://github.com/BrunaLab/HeliconiaSurveys)). Questions regarding the data sets should be posted as `Issues` on the HDP Repository (https://github.com/BrunaLab/HeliconiaSurveys/issues) or referred to E. M. Bruna (embruna@ufl.edu), who will investigate and update the database as needed.  Summaries of any post-publication updates will be posted to the `NEWS.md` file of the HDP Github Repository (https://github.com/BrunaLab/HeliconiaSurveys)


## Code/Software Used to clean and validate data sets

The code that was used to clean and organize these data sets is found in the HDP Github Repository ([https://github.com/BrunaLab/HeliconiaSurveys](https://github.com/BrunaLab/HeliconiaSurveys)). Questions regarding the code should be posted as `Issues` on the HDP Repository (https://github.com/BrunaLab/HeliconiaSurveys/issues) or referred to E. M. Bruna, who will investigate and update the code as needed.  Summaries of any post-publication updates will be posted to the `NEWS.md` file of the HDP Github Repository (https://github.com/BrunaLab/HeliconiaSurveys)
