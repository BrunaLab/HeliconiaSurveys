### Heliconia Surveys Github Repository

This is the README for the cleanup, organization, and summary of the Heliconia Demographic Project data. For summaries of the data, photos of the field sites, a list of project publications, and additional information visit the [project website](https://brunalab.github.io/HeliconiaSurveys/).

## Workflow

The cleaning, validating, and organizing of the _Heliconia_ demographic data is 
done using the R script `01_create_heliconia_archive.R`. The functions in 
this script will take the user from 'raw' survey data to the csv files of 
clean and organized data that are available in Dryad. 

**The workflow is as follows:**

STEP 1: Load, correct, and organize the demographic data: The function 
`ha_data<-clean_heliconia_data()` calls several other functions found in 
the folder `code/code_cleaning`. The output is a clean csv file that is 
saved to the folder `data/data_clean`.

The functions for this process are in the folder `code/code_cleaning`.

# STEP 2: Review of the 'Clean' Data: Once you have `heliconia_data_clean.csv` 
in the `data/data_clean` folder, the function `review_heliconia_data()` will 
do a numbner of validations. Any records that are suggested for review will 
be saved as `.csv` files in the folder `data/data_review`. 

The functions for this review are in the folder `code/code_review`.

# STEP 3: Create Files for the Data Archive: 

- the function `create_dryad_file()`will create the version of the data file that is available in Dryad (the difference between this and the `heliconia_data_clean.csv` file is that we have excluded some of the redundant plot identification codes). 

- `create_plot_info_file()` will create a csv of plot-level information (Table 2 in Bruna et al., _Ecology_) 

- `create_treefall_records_file()` creates a csv with some information on
treefalls in the demographic plots

- `create_tag_changes_file()` creates a csv of all the plants whose tags 
were replaced diring the field survey (necessary only if one is reviewing 
plants history using the original data sheets) 

All of these csv files are saved to the folder `data/data_archive`. The 
functions generating them are in the folder `code/code_archive`.