## Plot 1 generator for Coursera Exploratory Data assignment 1 by Radomir Nowacki
## Load dplyr to help with handling the data
library(dplyr)

## Read the data 

meter_data<-read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE,na.strings="?")

## Convert to dplyr format

meter_data<-tbl_df(meter_data)

## Set proper formats for columns of interest

meter_data$Date<-as.Date(meter_data$Date,"%d/%m/%Y")
meter_data$Global_active_power<-as.numeric(meter_data$Global_active_power)

## Open the png file to write the histogram to

png(filename="plot1.png")

## Filter the data to 2007-02-01 and 2007-02-02 and feed to next step

filter(meter_data,Date>='2007-02-01',Date<='2007-02-02')$Global_active_power %>%

## Histogram the data
hist(col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## Close the file

dev.off()