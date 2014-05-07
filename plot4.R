setwd('C:\\Users\\ycheng\\Documents\\R tutorial\\ExData_Plotting1')
library('sqldf')

inputFile<-read.csv2('household_power_consumption.txt', sep=";", 
                     colClasses=c('character', 'character', 'character', 'character', 'character', 'character', 'character', 'character', 'character'),
                     header =T, na.strings='?')

data<-subset(inputFile, inputFile$Date %in% c("1/2/2007", "2/2/2007"))

data[, 3:9]<-sapply(data[, 3:9], as.numeric)

data$actualTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2, 2), mar=c(5.1,4.5,3,2.1),  oma=c(0,0,0,0))
plot(data$actualTime, data$Global_active_power, type='l', xlab='', ylab='Global Active Power(kilowatts)')
plot(data$actualTime, data$Voltage, type='l', xlab='datetime', ylab='Voltage')
plot(data$actualTime, data$Sub_metering_1, type='n', xlab='', ylab='Energy sub metering')
points(data$actualTime, data$Sub_metering_1, type='l', col='black')
points(data$actualTime, data$Sub_metering_2, type='l', col='red')
points(data$actualTime, data$Sub_metering_3, type='l', col='blue')

legend("top",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col=c('black', 'red', 'blue'),xjust=1, cex=.9, lty=1, bty="n")

plot(data$actualTime, data$Global_reactive_power, type='h', xlab='datetime', ylab='Global_reactive_power')
dev.copy(png, file='plot4.png', w=480, h=480)
dev.off()