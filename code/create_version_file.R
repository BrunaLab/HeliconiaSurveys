create_version_file <- function(dataset) {
library(tidyverse)
# library(semver)

# identify which dataset is being versioned -------------------------------


  if (dataset==("HDP_survey")|dataset==("HDP_plots")){
  file_name<-paste("./data/survey_archive/",dataset,"_version_info.txt",sep="")
  }else if(
    dataset==("heliconia_survey_clean")|
    dataset==("plots")|
    dataset==("tag_changes")|
    dataset==("plot_treefalls")|
    dataset==("plant_damage")){
  file_name<-paste("./data/survey_clean/",dataset,"_version_info.txt",sep="")
  }
    
    

# create version file if it doesn't exist ---------------------------------


  if (!file.exists(as.character(file_name))){
    
    sink(as.character(file_name))
    cat(as.character("1.0.0"))
    cat("\n")
    cat(as.character(Sys.Date()))
    sink()
    print("new version file saved.")
    
    
  }else{

    current_ver  <- semver::parse_version(readLines(file_name,n = 1))
    changes=readline(prompt = paste(dataset,': is this an updated version? (Y/N): '));
    
  
if (grepl("N",changes,ignore.case = TRUE)){
  new_ver <- current_ver
  print("No version bump")
}else if(grepl("Y",changes,ignore.case = TRUE)){
  bump_type = readline(prompt = "is this change 'major', 'minor', or patch? : ");
  if(grepl("major",bump_type,ignore.case = TRUE)){
    
    new_ver <- semver::increment_version(current_ver, "major", 1L)
    print("Bumping major version")
  
  }else if(grepl("minor",bump_type,ignore.case = TRUE)){ 
    new_ver <- semver::increment_version(current_ver, "minor", 1L)
    print("Bumping minor version")
  }else if (grepl("patch",bump_type,ignore.case = TRUE)){
    new_ver <- semver::increment_version(current_ver, "patch", 1L)
    print("Bumping patch version")
  }
}else{
  print("ERROR: please enter 'major', 'minor', or 'patch'.")
  }

# file_conn = file("./data/survey_archive/version_info.txt")
# writeLines(as.character(new_ver,Sys.Date()), file_conn)
# close(file_conn)

sink(file_name)
cat(as.character(new_ver))
cat("\n")
cat(as.character(Sys.Date()))
sink()
print("updated version file saved.")
  }

}

# Modeled on version_bump from weecology Portal Data package
# https://github.com/weecology/PortalData/blob/main/version_bump.R
