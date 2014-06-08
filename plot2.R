#! /usr/bin/env RScript

source("./data.R")

data <- loadData("./household_power_consumption.txt")
head(data)
summary(data)

# create a PNG file (named 'plot2.png', width 480 pixels, height 480 pixels) containing the histogramm
png(filename="./plot2.png", width=480, height=480)
par(mfrow=c(1,1), mar=c(4, 4, 1, 2))
plot(data$Date + data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
