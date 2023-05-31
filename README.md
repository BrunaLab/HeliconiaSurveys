### Heliconia Demography Project Github Repository

This is the README for the cleanup, organization, and archiving of data sets collected as part of the _Heliconia_ Demographic Project. The core data set is demographic surveys conducted from 1998-2008. These have been published in _Ecology_ as a Data Paper.

This repository also includes the following records: 

1. [An overview](https://brunalab.github.io/HeliconiaSurveys/) of the project, methods, and field sites;
2. Summaries of the demographic data collected
3. A list of HDP-related publications
4. Descriptions of the the HDP data sets available to users
4. Status of ongoing data validation efforts and data sets being added to the archive 

<!---
This repository contains the following folders:
└── HeliconiaSurveys.
    ├── `01_create_heliconia_archive.R`
    ├── code
    │   ├── code_archive (preparing the file to be archived at Dryad)
    │   └── code_cleaning (cleaning & combining data from individual plots)
    │   └── code_review (validation checks of clean data set)
    ├── data
    │   ├── survey_archive (files archived at Dryad)
    │   └── survey_clean (clean data prior to archiving)
    │   └── survey_raw (raw data files)
    │   └── survey_review (records for review following validation checks)
    ├── README.md
    ├── LICENSE
    └── .gitignore
--->



The workflow for preparing these data is described below.

## Workflow

The cleaning, validating, and organizing of the _Heliconia_ demographic survey data is 
done using the R script `01_create_heliconia_archive.R`, located in the root directory. The functions in this script will take the 'raw' survey data and convert it to the .csv file of clean and organized data that have been archived at the Dryad Data Repository. 

**The workflow is as follows:**

***STEP 1: Load, correct, and organize the demographic data.*** 

- The function `ha_data<-clean_heliconia_data()` calls several other functions 
found in the folder `code/code_cleaning`. The output is a clean csv file that is 
saved to the folder `data/survey_clean`.

- The functions used in the data-cleaning process are in the folder `code/code_cleaning`. Each plot's demographic records are cleaned using a separate R script.

***STEP 2: Review of the 'Clean' Data.*** 

- Once the file `heliconia_survey_clean.csv` has been saved to the the `data/survey_clean` folder, the function `review_heliconia_data()` will do a number of validations. 
Any records that are suggested for review will be saved as `.csv` files 
in the folder `data/survey_review`. 

- The functions for this review are in the folder `code/code_review`.

- These and other validations are also carried out using the pointblank packkage and are available for review [here]()

***STEP 3: Create Files for the Data Archive.*** 

- the function `create_dryad_file()`will create the version of the data file that is available in Dryad (the difference between this and the `heliconia_survey_clean.csv` file is that we have excluded some of the redundant plot identification codes). 

- `create_plot_info_file()` will create a csv of plot-level information (Table 2 in Bruna et al., _Ecology_) 

- `create_treefall_records_file()` creates a csv with some information on
treefalls in the demographic plots

- `create_tag_changes_file()` creates a csv of all the plants whose tags 
were replaced diring the field survey (necessary only if one is reviewing 
plants history using the original data sheets) 

- All of these csv files are saved to the folder `data/survey_archive`. The 
functions generating them are in the folder `code/code_archive`.


