## Plot 3 generator by Radomir Nowacki
## Load dplyr 

library(dplyr)

## Read in data

meter_data<-read.csv2("household_power_consumption.txt",stringsAsFactors = FALSE,na.strings = "?")

## convert

meter_data<-tbl_df(meter_data)

## Clean up data

meter_data$Date<-as.Date(meter_data$Date,"%d/%m/%Y")
meter_data$Global_active_power<-as.numeric(meter_data$Global_active_power)

## Select data 

PlotData<-filter(meter_data,Date>='2007-02-01',Date<='2007-02-02')
PlotData$DateTime<-strptime(paste(PlotData$Date,PlotData$Time),'%Y-%m-%d %H:%M:%S')

## Create the plot

png(filename='plot3.png')

## Main plot

plot(PlotData$DateTime,PlotData$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')

## Add lines
lines(PlotData$DateTime,PlotData$Sub_metering_2,col='red')
lines(PlotData$DateTime,PlotData$Sub_metering_3,col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_3','Sub_metering_3'),lty=1,lwd=2.5,col=c("black", "red", "blue"))

dev.off()