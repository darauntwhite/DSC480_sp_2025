## Read data

## Change the working directory and file paths as appropriate

setwd("/Users/daraun/DSC480")

library(tidyverse)
library(dplyr)

# Actual data files
events <- read.csv("/Users/daraun/Downloads/2025_02_18_utilization_events.csv")
report <- read.csv("/Users/daraun/Downloads/2025_02_18_utilization_report.csv")

# Toy data files- these have the row values for each column shuffled separately.
#events <- read_csv("events_toy.csv")
#report <- read_csv("report_toy.csv")


## A bit of cleaning
reports_full <- report %>%
  mutate(across(contains("timestamp"), ~as.POSIXct(.x, format = "%Y-%m-%d %H:%M:%S"))) %>%
  mutate(across(contains("timestamp"), ~as_date(.x))) %>%
  rename_with(~str_replace(., "timestamp", "date"), contains("timestamp")) %>%
  mutate(across(event_type, ~ str_replace(.x, " ", "_"))) |>
  mutate(across(event_type, ~as.factor(.x)))
glimpse(reports_full)

events_full <- events %>%
  mutate(across(contains("timestamp"), ~as.POSIXct(.x, format = "%Y-%m-%d %H:%M:%S"))) %>%
  mutate(across(contains("timestamp"), ~as_date(.x))) %>%
  rename_with(~str_replace(., "timestamp", "date"), contains("timestamp")) %>%
  mutate(across(event_type, ~ str_replace(.x, " ", "_"))) |>
  mutate(across(event_type, ~as.factor(.x)))
glimpse(events_full)

library(dplyr)
library(lubridate)



