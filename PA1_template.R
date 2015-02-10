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

#calculate average steps per 5-min interval across all days
intervalavg <- data %>%
      group_by(interval) %>%
      summarise(avg=mean(steps, na.rm=TRUE))

plot(intervalavg$interval,
     intervalavg$avg,
     type="l",
     col="purple",
     lwd=2,
     main="Average Steps For Each 5-Minute Interval",
     xlab="Average Steps",
     ylab="Interval")

#which interval is the max
max <- max(intervalavg$avg)
row <- intervalavg[intervalavg$avg == max,]

#impute the data for the na values using the average for ecah 
#5-min interval

for (i in 1:nrow(data)) {
      if (is.na(data2[i,1]) == TRUE) {
            data2[i, 1] <- intervalavg[i,2]
      }
}