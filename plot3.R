setwd('C:\\Users\\ycheng\\Documents\\R tutorial\\ExData_Plotting1')
library('sqldf')

inputFile<-read.csv2('household_power_consumption.txt', sep=";", 
                     colClasses=c('character', 'character', 'character', 'character', 'character', 'character', 'character', 'character', 'character'),
                     header =T, na.strings='?')

data<-subset(inputFile, inputFile$Date %in% c("1/2/2007", "2/2/2007"))

data[, 3:9]<-sapply(data[, 3:9], as.numeric)

data$actualTime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
par(mar=c(2, 2, 1, 1))
plot(data$actualTime, data$Sub_metering_1, type='n', ylab='Energy sub metering')
points(data$actualTime, data$Sub_metering_1, type='l', col='black')
points(data$actualTime, data$Sub_metering_2, type='l', col='red')
points(data$actualTime, data$Sub_metering_3, type='l', col='blue')

legend("top",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         col=c('black', 'red', 'blue'),xjust=1, cex=1, lty=1, bty="n")
dev.copy(png, file='plot3.png', w=480, h=480)
dev.off()