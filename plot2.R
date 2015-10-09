## Plot 2 generator for Coursera Exploratory Data assignment 1 by Radomir Nowacki
## Load dplyr to help with handling the data
library(dplyr)

## Read the data 

meter_data<-read.csv2("household_power_consumption.txt",stringsAsFactors=FALSE,na.strings="?")

## Convert to dplyr format

meter_data<-tbl_df(meter_data)

## Set proper formats for columns of interest

meter_data$Date<-as.Date(meter_data$Date,"%d/%m/%Y")
meter_data$Global_active_power<-as.numeric(meter_data$Global_active_power)

## Filter the data to 2007-02-01 and 2007-02-02

plot_data<-filter(meter_data,Date>='2007-02-01',Date<='2007-02-02')
plot_data$DateTime<-strptime(paste(plot_data$Date,plot_data$Time),'%Y-%m-%d %H:%M:%S')
      
## Plot the Data

png(filename="plot2.png")
plot(plot_data$DateTime,plot_data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()