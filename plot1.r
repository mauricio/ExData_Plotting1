power <- read.csv("household_power_consumption.txt", 
                  sep=";", 
                  header=FALSE,
                  col.names=c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "metering_1", "metering_2", "metering_3"),
                  na.strings="?", 
                  colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                  skip=66636,
                  nrows=2880)
png("plot1.png")
hist(power$global_active_power, main="Global Active Power", xlab="Global Active Power (kilowattz)", col="red")
dev.off()