### Heliconia Demography Project Github Repository

This is the README for the cleanup, organization, and archiving of demographic survey data collected as part of the _Heliconia_ Demography Project. An overview of the 1998-2002 surveys and the associated metadata  have been published in _Ecology_ as a data paper, with the data archived in the Dryad Digital Repository. 


## Repository Overview

This repository includes the following: 

1. [Summaries](https://brunalab.github.io/HeliconiaSurveys/data_overview.html) of the demographic dataset (e.g., total number of plants, total number of plants per plot, total number of seedlings per year).
2. R Code used to:
    - process raw data files and correct / make changes to individual records [`code/survey_cleaning`](code/survey_cleaning)
    - review the clean data for anomalies, unusual records for review, etc. (`code/survey_review`)
    - prepare the version of the data to be archived at Dryad (`code/survey_archving`)
3. Data:
    - .csv files of raw data (`data/survey_raw`)
    - .csv files of clean demographic data and plot descriptors (`data/survey_clean`)
    - .csv files of any records suggested for further review (`data/survey_review`)
    - .csv files of the datasets archived at Dryad (`data/survey_archive`)
4. The [output of data validation](https://brunalab.github.io/HeliconiaSurveys/survey_validation.html) algorithms 
5. A log of [post-publication corrections or code updates](NEWS.md).
6. Lists of [HDP publications and publicly available data sets](https://github.com/BrunaLab/HeliconiaSurveys/blob/c0e2e6ca5d1013f0fff6da2cfef089bad7593ef8/docs/pubs_and_data/pubs_data.md).
7. Information and files related to surveys and data collection, scanned copies of the original datasheets (_in progress_), a list of plants for which id tags were replaced during field surveys, a records of treefalls documented while conducting the survey. A description of these records and links to download them [can be found here](docs/survey_records/survey_records.md).

<!---
This repository contains the following folders:
└── HeliconiaSurveys.
    ├── `01_create_heliconia_archive.R`
    ├── code
    │   ├── survey_archive (preparing the file to be archived at Dryad)
    │   └── survey_cleaning (cleaning & combining data from individual plots)
    │   └── survey_review (validation checks of clean data set)
    ├── data
    │   ├── survey_archive (files archived at Dryad)
    │   └── survey_clean (clean data prior to archiving)
    │   └── survey_raw (raw data files)
    │   └── survey_review (records for review following validation checks)
    ├── README.md
    ├── LICENSE
    └── .gitignore
--->



The workflow for cleaning, reviewing, and preparing the datasets archived in Dryad is described below.

## Workflow

The cleaning, validating, and organizing of the _Heliconia_ demographic survey data is 
done using the R script [`01_create_survey_archive.R`](https://github.com/BrunaLab/HeliconiaSurveys/blob/master/01_create_heliconia_archive.R). The functions in this script will take the 'raw' survey data, clean organize it, conduct a series of data validation procedures, and prepare the files to be archived at the Dryad Digital Repository. The workflow in the `01_create_survey_archive.R` script proceeds as follows:

**1. Load, correct, and organize the demographic data.** 

- The function `ha_data<-clean_heliconia_data()` calls several other functions 
found in the folder `code/survey_cleaning`. These functions include an .R script for cleaning and correcting the records for plants found in each demographic plot. 

- The function `create_plot_info_file()` will create a .csv file of plot-level descriptors 

- The function `create_treefall_records_file()` creates a .csv with some information on
treefalls in the demographic plots

- `create_tag_changes_file()` creates a csv of all the plants whose tags 
were replaced during the field survey (necessary only if one is reviewing 
the survey history of individual plants using the original data sheets) 

- The output of these functions are .csv files of 'clean' survey data, plot descriptors, treefall records, a log of tag changes saved to the folder `data/survey_clean`.


**2. Review of the 'Clean' Data.** 

- Once the file `heliconia_survey_clean.csv` has been saved to the the `data/survey_clean` folder, the function `review_heliconia_data()` will conduct a series of data validation procedures. The functions for this review are in the folder `code/survey_review`. These and other validations are also carried out using the [`pointblank`](https://rich-iannone.github.io/pointblank/) package; the results are available for review [here](https://brunalab.github.io/HeliconiaSurveys/survey_validation.html).

- Any individual plant records that are flagged for review will be saved as `.csv` files 
in the folder `data/survey_review`. They can also be downloaded as .csv files from the Data Validation page.

**3. Prepare the files to be archived at Dryad.** 

- the function `create_dryad_file()`will create .csv files of (1) plot descriptors and (2) the survey data that were archived in Dryad (NB: The demographic data file uploaded to Dryad excludes some of the redundant plot identification codes and the x-y coordinates of individual plants). The function generating and saving these files is found in the folder `code/survey_archive`.

<!---
(Table 2 in Bruna et al., _Ecology_) 
--->
- These resulting .csv files are saved to the folder `data/survey_archive`.  


## Improvements, Suggestions, & Questions

We welcome any suggestions for package improvement or ideas for features to include in future versions. If you have Issues, Feature Requests and Pull Requests, [here is how to contribute](CONTRIBUTING.md). We expect everyone contributing to the package to abide by our [Code of Conduct](CODE_OF_CONDUCT.md).

## Contributors

-   [Emilio M. Bruna](https://github.com/embruna), University of Florida
-   [Eric R. Scott](https://github.com/Aariq), University of Arizona

## Citation

Please cite both the Data Paper and Dryad Repository when using these data for research, publications, teaching, etc.

<!---
Bruna, Emilio M. et al. (2023), Data from: Demography of the understory herb _Heliconia acuminata_ in an experimentally fragmented tropical landscape, Dryad, Dataset, https://doi.org----

Bruna, Emilio M. María Uriarte, Maria Rosa Darrigo, Paulo Rubim, Cristiane F. Jurinitz, Eric R. Scott, Osmaildo Ferreira da Silva, & W. John Kress. 2023. Demography of the understory herb _Heliconia acuminata_ in an experimentally fragmented tropical landscape. Ecology XX(XX):xx-xx.
--->


