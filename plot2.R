setwd('C:\\Users\\ycheng\\Documents\\R tutorial\\ExData_Plotting1')
library('sqldf')

inputFile<-read.csv2('household_power_consumption.txt', sep=";", 
                     colClasses=c('character', 'character', 'character', 'character', 'character', 'character', 'character', 'character', 'character'),
                     header =T, na.strings='?')

data<-subset(inputFile, inputFile$Date %in% c("1/2/2007", "2/2/2007"))

data[, 3:9]<-sapply(data[, 3:9], as.numeric)

data$actualTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

plot(data$actualTime, data$Global_active_power, type='l', xlab='', ylab='Global Active Power(kilowatts)')
dev.copy(png, file='plot2.png', w=480, h=480)
dev.off()