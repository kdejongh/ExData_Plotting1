#! /usr/bin/env RScript

#install.packages(c("plyr", "lubridate"))

library(plyr)
library(lubridate)

loadData <- function(fileName) {
    txtFile <- paste(fileName, ".txt", sep="")
    if (!file.exists(txtFile)) {
        zipFile <- paste(fileName, ".zip", sep="")
        unzip(zipFile);
    }
    data <- read.csv2(txtFile)
    data <- mutate(data,
                   Date=dmy(Date),
                   Time=hms(Time))
    
    data <- mutate(subset(data, data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02")),
                   Global_active_power=as.numeric(as.character(Global_active_power)),
                   Global_reactive_power=as.numeric(as.character(Global_reactive_power)),
                   Voltage=as.numeric(as.character(Voltage)),
                   Global_intensity=as.numeric(as.character(Global_intensity)),
                   Sub_metering_1=as.numeric(as.character(Sub_metering_1)),
                   Sub_metering_2=as.numeric(as.character(Sub_metering_2)),
                   Sub_metering_3=as.numeric(as.character(Sub_metering_3)))
    return(data)
}
