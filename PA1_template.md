# Reproducible Research: Peer Assessment 1

Reproducible Research: Peer Assessment 1
========================================

This file will download data from rdpengs Github account, process the data into usable form and then answer several quesions. This assignment makes use of data from a personal activity monitoring device. This device collects data at 5 minute intervals through out the day. The data consists of two months of data from an anonymous individual collected during the months of October and November, 2012 and include the number of steps taken in 5 minute intervals each day.  

The questions we will address are:
1. What is the average number of steps taken per day
2. What is the average daily activity pattern
3. Are their differences in activity patterns between weekdays and weekends


## Loading and preprocessing the data
I've forked the Github repo RepData_PeerAssessment1 from rdpeng to obtain the data. First, I'll unzip the file activity.zip and load the data into an R data frame named 'data' and take a quick peek at the file.


```r
setwd("~/DataScienceCoursera/ReproRes/RepData_PeerAssessment1")
print(date())
```

```
## [1] "Mon Feb 09 17:43:28 2015"
```

```r
unzip("activity.zip", exdir=".")
data <- read.csv("activity.csv", header=T)
summary(data)
```

```
##      steps                date          interval     
##  Min.   :  0.00   2012-10-01:  288   Min.   :   0.0  
##  1st Qu.:  0.00   2012-10-02:  288   1st Qu.: 588.8  
##  Median :  0.00   2012-10-03:  288   Median :1177.5  
##  Mean   : 37.38   2012-10-04:  288   Mean   :1177.5  
##  3rd Qu.: 12.00   2012-10-05:  288   3rd Qu.:1766.2  
##  Max.   :806.00   2012-10-06:  288   Max.   :2355.0  
##  NA's   :2304     (Other)   :15840
```


```r
str(data)
```

```
## 'data.frame':	17568 obs. of  3 variables:
##  $ steps   : int  NA NA NA NA NA NA NA NA NA NA ...
##  $ date    : Factor w/ 61 levels "2012-10-01","2012-10-02",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ interval: int  0 5 10 15 20 25 30 35 40 45 ...
```
## What is mean total number of steps taken per day?



## What is the average daily activity pattern?



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
