## Plot 4 generator for Coursera Exploratory Data by Radomir Nowacki
## Load dplyr to handle data
library(dplyr)

## Read in data

elec_data<-read.csv2('household_power_consumption.txt',stringsAsFactors=FALSE,na.strings='?')

## Convert to dplyr format for easier times

elec_data<-tbl_df(elec_data)

## Convert date data from character to date format

elec_data$Date<-as.Date(elec_data$Date,'%d/%m/%Y')

## Convert data to numeric

elec_data$Global_active_power<-as.numeric(elec_data$Global_active_power)

## Prepare data for plotting

PlotData<-filter(elec_data,Date>='2007-02-01',Date<='2007-02-02')
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
