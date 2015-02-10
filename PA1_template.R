##loading data
setwd("~/DataScienceCoursera/ReproRes/RepData_PeerAssessment1")
print(sysdate())
#"Sun Feb 08 22:16:15 2015"
unzip("activity.zip", exdir=".")
data <- read.csv("activity.csv", header=T)

#processing data
library(dplyr)
library(tidyr)

data[,2] <- as.Date(data[,2], "%Y-%m-%d")

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

for (i in 1:nrow(data2)) {
      if (is.na(data2[i,1]) == TRUE) {
            x <- data2[i,3]
            y <- filter(intervalavg, interval == x)
            data2[i,1] <- y[1,2]
      } else next
}

#create a weekeday/weekend variable and add to the data frame

data2 <- mutate(data2, day=weekdays(date))

data2[,"day"] <- gsub("Saturday", "weekend", data2$day)
data2[,"day"] <- gsub("Sunday", "weekend", data2$day)
data2[,"day"] <- gsub("Monday", "weekday", data2$day)
data2[,"day"] <- gsub("Tuesday", "weekday", data2$day)
data2[,"day"] <- gsub("Wednesday", "weekday", data2$day)
data2[,"day"] <- gsub("Thursday", "weekday", data2$day)
data2[,"day"] <- gsub("Friday", "weekday", data2$day)

byday <- data2 %>%
      group_by(day, interval) %>%
      summarise(avg=mean(steps))

#plot the results in a time-series
library(ggplot2)
qplot(interval,
      avg,
      data=byday,
      facets= . ~ day,
      geom="line")