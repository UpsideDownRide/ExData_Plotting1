## Plot 2 generator for Coursera Exploratory Data by Radomir Nowacki
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

png(filename='plot2.png')
plot(PlotData$DateTime,PlotData$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()      
