##loading data
setwd("~/DataScienceCoursera/ReproRes/RepData_PeerAssessment1")
print(sysdate())
#"Sun Feb 08 22:16:15 2015"
unzip("activity.zip", exdir=".")
data <- read.csv("activity.csv", header=T)

#processing data
library(dplyr)
library(tidyr)

data2[,2] <- as.Date(data2[,2], "%Y%m%d")

data2 <- data %>%
      group_by(interval) %>%
      summarise(avg=mean(steps, na.rm=TRUE))
