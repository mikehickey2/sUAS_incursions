## FAA Data Clean file using a simplified NLP

library(tidyverse)
library(dplyr)

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