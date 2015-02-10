##loading data
setwd("~/DataScienceCoursera/ReproRes/RepData_PeerAssessment1")
print(sysdate())
#"Sun Feb 08 22:16:15 2015"
unzip("activity.zip", exdir=".")
data <- read.csv("activity.csv", header=T)

#processing data
library(dplyr)
library(tidyr)

data[,2] <- as.Date(data[,2], "%Y%m%d")

#calculatings total steps each day and making a histogram
totsteps <- data %>%
      group_by(date) %>%
      summarise(sum=sum(steps, na.rm=TRUE))

summary(totsteps)

stephist <- hist(totsteps$sum,
                 breaks=5,
                 main = "Frequency of Total Steps Per Day",
                 xlab = "Total Steps")
