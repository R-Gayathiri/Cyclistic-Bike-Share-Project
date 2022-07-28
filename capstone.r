---
title: "Google Data Analytics Capstone Report"
author: "Gayathiri Rathinasabapathi"
date: "7/27/2022"
output: html_document
---

# Synopsis

This capstone project is to use the knowledge from Google Data Analytics courses to answer business questions coming from bike-share service while using supporting evidence to persuade stakeholders & executive while the decisions have to be made.

The data can be download in the link below:
https://divvy-tripdata.s3.amazonaws.com/index.htm


# Data Obtainment

The data was obtained from 2021 July up to 2022 June for the bike sharing service's website, and the remaining operation and result will be based on the given time frame.

Meanwhile, the original csv files were already download to the working directory. Therefore the operations would be depending on where users download the file to.

This section will load the required library, load in the .csv data into the data frame and identify each table's format.
```{r Library Loading, message = FALSE, warning = FALSE}
library(tidyverse)
library(lubridate)
library(ggplot2)
library(stats)
library(dplyr)
```

```{r Data Loading, message = FALSE, warning = FALSE}
# Load csv file into individual data frame
jul_2021 <- read_csv("202107-divvy-tripdata.csv")
aug_2021 <- read_csv("202108-divvy-tripdata.csv")
sep_2021 <- read_csv("202109-divvy-tripdata.csv")
oct_2021 <- read_csv("202110-divvy-tripdata.csv")
nov_2021 <- read_csv("202111-divvy-tripdata.csv")
dec_2021 <- read_csv("202112-divvy-tripdata.csv")
jan_2022 <- read_csv("202201-divvy-tripdata.csv")
feb_2022 <- read_csv("202202-divvy-tripdata.csv")
mar_2022 <- read_csv("202203-divvy-tripdata.csv")
apr_2022 <- read_csv("202204-divvy-tripdata.csv")
may_2022 <- read_csv("202205-divvy-tripdata.csv")
jun_2022 <- read_csv("202206-divvy-tripdata.csv")
```

```{r Data Format Check, message = FALSE, warning = FALSE}
# Verify column names at each data frame
colnames(jul_2021)
colnames(aug_2021)
colnames(sep_2021)
colnames(oct_2021)
colnames(nov_2021)
colnames(dec_2021)
colnames(jan_2022)
colnames(feb_2022)
colnames(mar_2022)
colnames(apr_2022)
colnames(may_2022)
colnames(jun_2022)

## Verify the Structure of each data frame
str(jul_2021)
str(aug_2021)
str(sep_2021)
str(oct_2021)
str(nov_2021)
str(dec_2021)
str(jan_2022)
str(feb_2022)
str(mar_2022)
str(apr_2022)
str(may_2022)
str(jun_2022)
```


# Data Cleaning & Transformation

After the data are loaded, some of the data format were not the same for same columns. Therefore, transfer these variable time to be the same before cleaning NA items to ensure all data points are valid.

This section will also calculate the ride length based on the transformed time frame interval. The conversion will be ensure the ride length format are in seconds.

```{r Data Transform, message = FALSE, warning = FALSE}
## Rename the conflicted variables as character variables
jul_2021 <- mutate(jul_2021, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
aug_2021 <- mutate(aug_2021, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
sep_2021 <- mutate(sep_2021, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
oct_2021 <- mutate(oct_2021, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
nov_2021 <- mutate(nov_2021, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
dec_2021 <- mutate(dec_2021, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
jan_2022 <- mutate(jan_2022, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
may_2022 <- mutate(may_2022, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
jun_2022 <- mutate(jun_2022, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
feb_2022 <- mutate(feb_2022, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
mar_2022 <- mutate(mar_2022, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))
apr_2022 <- mutate(apr_2022, ride_id = as.character(ride_id), rideable_type = as.character(rideable_type), start_station_id = as.character(start_station_id),end_station_id = as.character(end_station_id))

## Stack all data as one data frame
alltrips <- bind_rows(jul_2021, nov_2021, dec_2021, jan_2022, feb_2022, mar_2022, apr_2022, may_2022, jun_2022, aug_2021, sep_2021, oct_2021)

```{R Data Clean Up, message = FALSE, warning = FALSE}
## Inspect the dimension of data
colnames(alltrips)
nrow(alltrips)
dim(alltrips)
head(alltrips)
tail(alltrips)
str(alltrips)
summary(alltrips)


## Convert POSI Dates as date format
alltrips$date <- as.Date(alltrips$started_at)
alltrips$month <- format(as.Date(alltrips$date), "%m")
alltrips$day <- format(as.Date(alltrips$date), "%d")
alltrips$year <- format(as.Date(alltrips$date), "%Y")
alltrips$day_of_week <- format(as.Date(alltrips$date), "%A")

## Calculate Ride Length
alltrips$ride_length <- difftime(alltrips$ended_at, alltrips$started_at)

## Recheck Updated Structure
str(alltrips)

## Convert ride length from factor to numeric for calculation
is.factor(alltrips$ride_length)
alltrips$ride_length <- as.numeric(as.character(alltrips$ride_length))

## Verify the character type is numeric
is.numeric(alltrips$ride_length)

## Records with missing fields start_station, end_station, start/end lat/long fields were removed.
alltrips2 <- alltrips[!(is.na(alltrips$start_station_id) | is.na(alltrips$end_station_id) 
                             | is.na(alltrips$ride_id) | is.na(alltrips$rideable_type) 
                             | is.na(alltrips$started_at) | is.na(alltrips$ended_at) 
                             | is.na(alltrips$end_lat) | is.na(alltrips$end_lng)),]

## Records for trips that started or ended at DIVVY CASSETTE REPAIR MOBILE STATION or 
## HUBBARD ST BIKE CHECKING (LBS-WH-TEST) were removed as these are administrative stations.

alltrips2<- alltrips2[!(alltrips2$start_station_name == "DIVVY CASSETTE REPAIR MOBILE STATION" 
                            | alltrips2$start_station_name == "HUBBARD ST BIKE CHECKING (LBS-WH-TEST)" 
                            | alltrips2$start_station_name == "WATSON TESTING DIVVY" 
                            | alltrips2$end_station_name == "DIVVY CASSETTE REPAIR MOBILE STATION" 
                            | alltrips2$end_station_name == "HUBBARD ST BIKE CHECKING (LBS-WH-TEST)" 
                            | alltrips2$end_station_name == "WATSON TESTING DIVVY"),]

## Remove the NA values to get a more precise data summary
alltrips2 <- na.omit(alltrips2)
```

# Data Analysis

This section will order the weekdays as required sequence, meanwhile summarizing the data 

```{R Preliminary Analysis, echo = FALSE, warning = FALSE}
## Order the weekdays as the typical weekday sequence
alltrips2$day_of_week <- ordered(alltrips2$day_of_week, levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

## Records for trips less than 60 seconds (false starts) or longer than 24 hours were removed. 
## Bikes out longer than 24 hours are considered stolen and the rider is charged for a replacement.

alltrips2 <- alltrips2[!(alltrips2$ride_length<60 | alltrips2$ride_length>86400),]

## Summarize the data based on the customer type
customer_summary <- alltrips2 %>%
  group_by(member_casual) %>%
  summarize(avg_length = mean(ride_length), median_length = median(ride_length), max_length = max(ride_length), min_length = min(ride_length))

## Summarize the data based on the combination of weekdays and customer type
weekday_summary <- alltrips2 %>%
  group_by(day_of_week, member_casual) %>%  
  summarize(avg_length = mean(ride_length), median_length = median(ride_length), max_length = max(ride_length), min_length = min(ride_length))
```

```{R Data Plotting, echo = FALSE, warning = FALSE}
## Data Wrangling for the summaries within weekdays and number of rides
alltrips2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%
  arrange(member_casual, weekday)
  geom_col(position = "dodge")

## Plot weekday's ride count by membership type
alltrips2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") + 
  ggtitle("E-Bike Memebrship Type's Ride Count Summary") +
  labs (x = "Weekdays", y = "# of Rides")
  ggsave("ride_count.jpg", width = 2000, height = 1000, units = c("px"))

##  Plot weekday's average duration
alltrips2 %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%
  arrange(member_casual, weekday) %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge") +
  ggtitle("E-Bike Memebrship Type's Ride Duration Average") +
  labs (x = "Weekdays", y = "Ride Duration (seconds)")
  ggsave("ridetime_avg.jpg", width = 2000, height = 1000, units = c("px"))
```

# Summary
Based on the visual display and the data, the following conclusion can be made for the recommendation associated with the observed trends.

1. Members and Casual customers do behave different, one of the biggest significant difference is that the casual rider's average ride duration is significantly greater than the average of the member customers.
2. Members have tendency to ride more frequent during the weekdays, while the casual riders ride more frequent during the weekend by the counts.

After seeing this trend, perhaps the following strategy can be implemented for the casual riders to buy memberships.

1. Have a cheaper rate of charge for the casual riders during the weekdays for them to persuade the change for being a member cyclist.
2. Or use the more you ride, the cheaper you get approach to encourage casual riders for the membership approach so they can pay at a fixed rate. 