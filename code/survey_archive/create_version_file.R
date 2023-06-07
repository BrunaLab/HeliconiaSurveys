create_version_file <- function() {
library(tidyverse)
library(semver)
current_ver  <- semver::parse_version(readLines("./data/survey_archive/version_info.txt",n = 1))

changes=readline(prompt = 'is this an updated version? (Y/N): ');

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

sink("./data/survey_archive/version_info.txt")
cat(as.character(new_ver))
cat("\n")
cat(as.character(Sys.Date()))
sink()
print("updated version file saved.")
}
# writeLines(as.character(new_ver,con=Sys.Date(),sep = "\n")), "./data/survey_archive/version_info.txt") 

# if (cron==TRUE) {
#   if (changes==TRUE) { # for cron jobs, only bump if update_data.R resulted in changed files
#     # Cron job with new data, increment minor version
#     new_ver <- semver::increment_version(current_ver, "minor", 1L)
#   }
# } else { # this is triggered by an update to Main or by a PR on a branch
#   # parse the most recent commit for version instructions 
#   
#   if (grepl("\\[no version bump\\]", commit, ignore.case = TRUE))
#   {
#     new_ver <- current_ver
#     paste("No version bump")
#   } else if (grepl("\\[major\\]", commit, ignore.case = TRUE)) {
#     new_ver <- semver::increment_version(current_ver, "major", 1L)
#     print("Bumping major version")
#   } else if (grepl("\\[minor\\]", commit, ignore.case = TRUE)) {
#     new_ver <- semver::increment_version(current_ver, "minor", 1L)
#     print("Bumping minor version")
#   } else if (grepl("\\[patch\\]", commit, ignore.case = TRUE)) {
#     new_ver <- semver::increment_version(current_ver, "patch", 1L)
#     print("Bumping patch version")
#   } else {
#     stop(paste("The final commit message in a set of changes must be tagged",
#                "with version increment information.\nOptions include",
#                "[major], [minor], [patch], and [no version bump].\n",
#                "The last commit in this set of changes is:\n",
#                commit))
#   }
# }
# 
# writeLines(as.character(new_ver), "version.txt") 
# new_ver <- semver::increment_version(current_ver, "minor", 1L)
# }
# } else { # this is triggered by an update to Main or by a PR on a branch
#   # parse the most recent commit for version instructions 
#   
#   if (grepl("\\[no version bump\\]", commit, ignore.case = TRUE))
#   {
#     new_ver <- current_ver
#     paste("No version bump")
#   } else if (grepl("\\[major\\]", commit, ignore.case = TRUE)) {
#     new_ver <- semver::increment_version(current_ver, "major", 1L)
#     print("Bumping major version")
#   } else if (grepl("\\[minor\\]", commit, ignore.case = TRUE)) {
#     new_ver <- semver::increment_version(current_ver, "minor", 1L)
#     print("Bumping minor version")
#   } else if (grepl("\\[patch\\]", commit, ignore.case = TRUE)) {
#     new_ver <- semver::increment_version(current_ver, "patch", 1L)
#     print("Bumping patch version")
#   } else {
#     stop(paste("The final commit message in a set of changes must be tagged",
#                "with version increment information.\nOptions include",
#                "[major], [minor], [patch], and [no version bump].\n",
#                "The last commit in this set of changes is:\n",
#                commit))
#   }
# }
# 
# 
# new_ver <- semver::increment_version(current_ver, "minor", 1L)
