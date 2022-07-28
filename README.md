# Google-Data-Analytics-Capstone

Author: Gayathiri Rathinasabapathi </br>

1: Synopsis
-----------

This capstone project is to use the knowledge from Google Data Analytics courses to answer business questions coming from bike-share service while using supporting evidence to persuade stakeholders & executive while the decisions have to be made. </br>

The data set is located in the [dataset link](https://divvy-tripdata.s3.amazonaws.com/index.html) to download.</br>

The description and instruction can be referred from this [documentation link](https://d3c33hcgiwev3.cloudfront.net/aacF81H_TsWnBfNR_x7FIg_36299b28fa0c4a5aba836111daad12f1_DAC8-Case-Study-1.pdf?Expires=1636329600&Signature=fosweeuKEsyIJLTMV5mLDBxvxIPCQ3BeqWSi~VTbRNMdYhvG4gpADXf3LhhkYATpdC3aavxzuc-GQMx5nBwj8YKKlDZkjTmkxn9i76M3Sm7udxs09ptL544LwkUwJv2J7W54T~UMWqpjNtpFFsoKtrcYsI8sgq2SesM5-rC2nCQ_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A). </br>

The published R-Markdown file is in [this link](https://rpubs.com/hsc251/Google_Capstone_Track1)


2: Ask
------------------

### 2.1: Identify the questions

Based on the situation from statistics coming from the data gathered, the following three questions will be addressed for the future marketing program: </br>

1. How do annual members and casual riders use Cyclistic bikes differently? </br>
2. Why would casual riders buy Cyclistic annual memberships? </br>
3. How can Cyclistic use digital media to influence casual riders to become members? </br>

When looking at the 3 questions above, the business deliverable will be impelmented based on the analysis results between casual/members while trying understand the trends behind before giving necessary recommendation. </br>

Throughout this capstone project, all execution will be done with R-Programming for data gathering, data cleaning and summarizing the visuals. </br>

3: Prepare
------------------

### 3.1: Data Preparation.

The analysis period occurred between 2021 July to 2022 June, this 1 year span data will be applied to analyze the trend between casual customers and members. </br>

The data from 2021 July and 2021 June are all stored in different csv files, which can be found in [here](https://divvy-tripdata.s3.amazonaws.com/index.html) </br>

The following code will summarize which R-packages this analysis have applied for </br>

```r
library(tidyverse)
library(lubridate)
library(ggplot2)
library(stats)
library(dplyr)
```
</br>

Once the packages have been loaded, the following command will be applied to load the monthly data while verifying each month's data have the same attribute names. </br>

*Remark: The csv files were pre-downloaded to the working directory, so the loading data will just be directly coming from the file source* </br>

```r
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
```
</br>

After loading the data, it's time to process and clean the data before visualizing them </br>.

4: Process
------------------

### 4.1: Verify Data Structure & Combine all in One

The following command will verify the structure of each month's database, then redefine the nature of each data attribute before combining into the whole year's data frame prior to analysis. </br>

```r
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

</br>


### 4.2: Data Clean Up and Conversion
After summarizing the 1 year span data as a complete data frame and removed unnecessary columns, this section will clean up the missing datas while converting the necessary dates into the designated formats before visualizing the plotting. </br>

*Remark: The calculated ride length will be consumed in seconds* </br>

```r
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

nrow(alltrips2)

## Records for trips that started or ended at DIVVY CASSETTE REPAIR MOBILE STATION or 
## HUBBARD ST BIKE CHECKING (LBS-WH-TEST) were removed as these are administrative stations.

alltrips2<- alltrips2[!(alltrips2$start_station_name == "DIVVY CASSETTE REPAIR MOBILE STATION" 
                            | alltrips2$start_station_name == "HUBBARD ST BIKE CHECKING (LBS-WH-TEST)" 
                            | alltrips2$start_station_name == "WATSON TESTING DIVVY" 
                            | alltrips2$end_station_name == "DIVVY CASSETTE REPAIR MOBILE STATION" 
                            | alltrips2$end_station_name == "HUBBARD ST BIKE CHECKING (LBS-WH-TEST)" 
                            | alltrips2$end_station_name == "WATSON TESTING DIVVY"),]
nrow(alltrips2)


## Remove the NA values to get a more precise data summary
alltrips2 <- na.omit(alltrips2)
```
</br>

5: Analyze
------------------

### 5.1: Summarizing the Analysis

The following command will summarize based on either the membership types and associated weekdays for different membership types. </br>

```r
## Order the weekdays structure for confirmation
alltrips2$day_of_week <- ordered(alltrips2$day_of_week, levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

## Summary based on the customer types
customer_summary <- alltrips2 %>%
  group_by(member_casual) %>%
  summarize(avg_length = mean(ride_length), median_length = median(ride_length), max_length = max(ride_length), min_length = min(ride_length))

## Summary based on the weekday types while splitting the customer types
weekday_summary <- alltrips2 %>%
  group_by(day_of_week, member_casual) %>%  
  summarize(avg_length = mean(ride_length), median_length = median(ride_length), max_length = max(ride_length), min_length = min(ride_length))
```
</br>


### 5.2: Results
The results are as follows by customer type </br>

Customer Type | Avg Ride Length (seconds) | Med Ride Length (seconds) | Max Ride Length (seconds) | Min Ride Length (seconds)
--- | --- | --- | --- | ---
Casual | 1584 | 943 | 86362 | 0
Member | 769 | 562 | 86128 | 0
</br>

The results are as follows by casual customers by weekdays </br>
Weekday | Avg Ride Length (seconds) | Med Ride Length (seconds) | Max Ride Length (seconds) | Min Ride Length (seconds)
--- | --- | --- | --- | ---
Sunday | 1804 | 1096 | 86315 | 0
Monday | 1638 | 955 | 86155 | 0
Tuesday | 1404 | 814 | 86274 | 0
Wednesday | 1363 | 813 | 86247 | 0
Thursday | 1399 | 829 | 86215 | 0
Friday | 1479 | 892 | 86329 | 0
Saturday | 1731 | 1064 | 86362 | 0
</br>

The results are as follows by member customers by weekdays </br>
Weekday | Avg Ride Length (seconds) | Med Ride Length (seconds) | Max Ride Length (seconds) | Min Ride Length (seconds)
--- | --- | --- | --- | ---
Sunday | 878 | 632 | 78819 | 0
Monday | 746 | 78819 | 83627 | 0
Tuesday | 717 | 531 | 84338 | 0
Wednesday | 726 | 539 | 84908 | 0
Thursday | 735 | 545 | 85272 | 0
Friday | 752 | 554 | 86128 | 0
Saturday | 869 | 632 | 85023 | 0
</br>

### 5.3: Visualization
This section will demonstrate how to plot and visualize the findings for the graphs </br>

```r
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
</br>

Please refer to the following charts for the visualization: </br>

Number of Rides per Weekday Comparison </br>

![](https://github.com/R-Gayathiri/Google-Data-Analytics-Capstone/blob/main/ride_count.jpeg)

Ride Duration Average per Weekday Comparison </br>
![](https://github.com/hsc251/Google_Data_Analytics/blob/main/capstone/ridetime_avg.jpg)

6: Share
------------------

### 6.1: Summary Pitch

Based on the summaries and visuals, the following conclusions can be made.

1. Members and Casual customers do behave different, one of the biggest significant difference is that the casual rider's average ride duration is significantly greater than the average of the member customers.
2. Members have tendency to ride more frequent during the weekdays, while the casual riders ride more frequent during the weekend by the counts.

After seeing this trend, perhaps the following strategy can be implemented for the casual riders to buy memberships.

1. Have a cheaper rate of charge for the casual riders during the weekdays for them to persuade the change for being a member cyclist.
2. Or use the more you ride, the cheaper you get approach to encourage casual riders for the membership approach so they can pay at a fixed rate. 
