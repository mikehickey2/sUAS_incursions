## FAA Data Clean file using a simplified NLP

library(tidyverse)
library(dplyr)

#This code below worked for the first observation; and 110 others. Need to fix.
incursion_data_extracted <- incursion_data %>%
  
  mutate(
  
    time = str_extract(Summary, "\\b\\d{4}[A-Z]+\\b"),
    
    altitude = str_extract(Summary, "\\b\\d+\\s*(FEET|FT)\\b"),
    
    reporter = str_extract(Summary, "\\b[A-Z]+(?=, REPORTED)"),
    
    relative_location = str_extract(Summary, "\\b[0-9.]+\\s*[NSEW]+\\s*[A-Z]+\\b"),
    
    evasive_action = str_extract(Summary, "\\b(NO)?\\s*EVASIVE ACTION TAKEN\\b"),
    
    disposition = str_extract(Summary, "\\b(PD|POLICE)\\s*NOTIFIED\\b"),
    
    report_type = str_extract(Summary, "PRELIM INFO|FINAL INFO")
  )


#created test file to isolate NA Rows to help w/ imrpoving NLP above.  

# Use is.na() on the selected columns and rowSums() to find rows with NAs
na_rows <- is.na(incursion_data_extracted$time) |
  is.na(incursion_data_extracted$altitude) |
  is.na(incursion_data_extracted$reporter) |
  is.na(incursion_data_extracted$relative_location) |
  is.na(incursion_data_extracted$evasive_action) |
  is.na(incursion_data_extracted$disposition) |
  is.na(incursion_data_extracted$report_type)

# Create a new data frame with only the rows that contain at least one NA
NA_df <- incursion_data_extracted[na_rows, ]

# Write the new data frame to a CSV file in the "output" folder
write.csv(NA_df, file = "output/NA_df.csv", row.names = FALSE)

# Print a message to confirm the file has been created
message("NA_df.csv has been created in the 'output' directory.")
