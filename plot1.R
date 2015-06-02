## Plot 1 generator for Coursera Exploratory Data by Radomir Nowacki
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

## Filter so we only get two days we are interested in and chain to histogram

png(filename='plot1.png')
filter(elec_data,Date>='2007-02-01',Date<='2007-02-02')$Global_active_power %>%

## Histogram settings
      
hist(col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.off()      
