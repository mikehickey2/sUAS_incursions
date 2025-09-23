## FAA Drone Incusrion Database data file pull request


library("tidyverse")
library("readxl")

# Define the URL for the UAS Sightings Report
# NOTE: You'll need to update this URL as the FAA releases new reports.

data_url <- "https://www.faa.gov/uas/resources/public_records/uas_sightings_report/fy25_q3.xlsx"

local_filename <- "data/raw/sightings_FY25_q3.xlsx"

download.file(data_url, local_filename, mode = "wb")

if (file.exists(local_filename)) {
  # Read the .xlsx file into a data frame
  incursion_data <- read_excel(local_filename) %>%
    select(Date, State, City, Summary)
  print("File downloaded and read successfully!")
} else {
  print("Error: The file could not be downloaded. Please check the URL and your internet connection.")
}

glimpse(incursion_data)
