## Plot 4 generator by Radomir Nowacki
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

png(filename='plot4.png')
par(mfrow=c(2,2))

plot(PlotData$DateTime,PlotData$Global_active_power,type='l',xlab='',ylab='Global Active Power')
plot(PlotData$DateTime,PlotData$Voltage,type='l',xlab='datetime',ylab='Voltage')

plot(PlotData$DateTime,PlotData$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(PlotData$DateTime,PlotData$Sub_metering_2,col='red')
lines(PlotData$DateTime,PlotData$Sub_metering_3,col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_3','Sub_metering_3'),lty=1,col=c("black", "red", "blue"))

plot(PlotData$DateTime,PlotData$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')

dev.off()