# Heliconia Demography Project

## Repository Overview

This repository is for the cleanup, organization, and archiving of demographic survey data collected as part of the _Heliconia_ Demography Project. An overview of the 1998-2002 surveys and the associated metadata  have been published in _Ecology_ as a data paper, with the data archived in the Dryad Digital Repository. 

This repository includes the following: 

1. **R Code** used to:
    - process raw data files and correct / make changes to individual records [(`code/survey_cleaning`)](code/survey_cleaning)
    - review the clean data for anomalies, unusual records for review, etc. [(`code/survey_review`)](code/survey_review)
    - prepare the version of the data to be archived at Dryad [(`code/survey_archive`)](code/survey_archive)
    
2. **Data:**
    - .csv files of raw data [(`data/survey_raw`)](data/survey_raw)
    - .csv files of clean demographic data and plot descriptors [(`data/survey_clean`)](data/survey_clean)
    - .csv files of any records suggested for further review [(`data/survey_review`)](data/survey_review)
    - .csv files of the datasets archived at Dryad [(`data/survey_archive`)](data/survey_archive).  
    
3. [**Data validation algorithms and their output**](https://brunalab.github.io/HeliconiaSurveys/survey_validation.html) algorithms 

4. [**Summaries of the demographic data**](https://brunalab.github.io/HeliconiaSurveys/data_overview.html) (e.g., total number of plants, total number of plants per plot, total number of seedlings per year).

5. [**A log of post-publication updates and corrections**](NEWS.md).

6. [**HDP Publications and publicly available data sets**](docs/pubs_and_data/pubs_data.md).

7. [**Methodological information and records**](docs/survey_records/survey_records.md), including scanned copies of the original datasheets (_in progress_), a list of plants for which id tags were replaced during field surveys, a records of treefalls documented while conducting the survey. A description of these records and links to download them .



## Workflow

The cleaning, validating, organizing, and preparing the archive version of the _Heliconia_ demographic survey data is done with two R scripts:

### 1. Correct, organize, & review the data with `01_clean_survey_data.R`

The functions in [`01_clean_survey_data.R`](/01_clean_survey_data.R) will consolidate the 'raw' survey data, clean it, organize it in tidy form, and conduct a series of validation procedures.

- The function `ha_data<-clean_heliconia_data()` calls several other functions 
found in the folder [`code/survey_cleaning`](code/survey_cleaning). These functions include an .R script for cleaning and correcting the records for plants found in each demographic plot. 

- The function [`create_plot_info_file()`](code/survey_cleaning/create_plot_info_file.R) will create a .csv file of plot-level descriptors 

- The function [`create_treefall_records_file()`](code/survey_cleaning/create_treefall_records_file.R) creates a .csv with some information on
treefalls in the demographic plots

- [`create_tag_changes_file()`](code/survey_cleaning/create_tag_changes_file.R) creates a csv of all the plants whose tags 
were replaced during the field survey (necessary only if one is reviewing 
the survey history of individual plants using the original data sheets) 

- The output of these functions are .csv files of 'clean' survey data, plot descriptors, treefall records, a log of tag changes saved to the folder [`data/survey_clean`](data/survey_clean).

Once the file `heliconia_survey_clean.csv` has been saved to the the [`data/survey_clean`](data/survey_clean) folder, the function [`review_heliconia_data()`](code/survey_review/review_heliconia_data.R) conducts a series of data validation procedures to flag any records to review before preparing the files to be archived at the Dryad Digital Repository. 

- The functions for this review are in the folder [`code/survey_review`](code/survey_review). 

- These and other validations are also carried out using the [`pointblank`](https://rich-iannone.github.io/pointblank/) package; the output of which is available for review [here](https://brunalab.github.io/HeliconiaSurveys/survey_validation.html).

- Any individual plant records that are flagged for review by `review_heliconia_data()` will be saved as `.csv` files in the folder [`data/survey_review`](data/survey_review). They can also be downloaded as .csv files from the Data Validation page.

### 2. Prepare the files for archiving at Dryad with `02_create_survey_archive.R`.

The function in [`02_create_survey_archive.R`](/02_create_survey_archive.R) will prepare the version of the 'clean' survey data and file of plot descriptors that are archived in Dryad. 

- When doing so, the user will be asked if this is an updated version of the data set, and if so, if the version is a `major`, `minor`, or `patch` update (see ['Frictionless Standards'](https://specs.frictionlessdata.io/patterns/#data-package-version)). 

- the function [`create_dryad_file()`](code/survey_archive/create_dryad_file.R) will then create .csv files of (1) plot descriptors and (2) the survey data that were archived in Dryad (NB: The demographic data file uploaded to Dryad excludes some of the redundant plot identification codes and the x-y coordinates of individual plants). The function generating and saving these files is found in the folder [`code/survey_archive`](code/survey_archive), as is the [`create_version_file.R`](code/survey_archive/create_version_file.R) script used toupdate the `version_info.txt` file.



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

If you wish to cite this repository, please cite as follows:



@misc{BrunaSurveys2023,  
  author = {Bruna, E.M., Eric R. Scott},  
  title = {Heliconia Demography Project},  
  year = {2023},  
  publisher = {GitHub},  
  journal = {GitHub repository},  
  note = {data v1.0.0.},  
  url={https://github.com/BrunaLab/HeliconiaSurveys}  
}  

