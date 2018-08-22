
##REad table ubication C:\Users\Maria.Posadas\Desktop\explarotary analysis 1

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
head(data)
## Format date to Type Date, 
data$Date <-as.Date(data$Date, "%d/%m/%Y")

## Tidy data, clean. Filter period 2007-02-01 and 2007-02-02 and complete observation
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
data <- data[complete.cases(data),]

## Combine Date and Time 
dateTime <- paste(data$Date, data$Time)
dateTime <- setNames(dateTime, "DateTime")
data <- data[ ,!(names(data) %in% c("Date","Time"))]

## Add to data DateTime column
data<- cbind(dateTime, data)

## Format dateTime Column
data$dateTime <- as.POSIXct(dateTime)
head(data)