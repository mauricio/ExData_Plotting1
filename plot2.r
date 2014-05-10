power <- read.csv("household_power_consumption.txt", 
                  sep=";", 
                  header=FALSE,
                  col.names=c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "metering_1", "metering_2", "metering_3"),
                  na.strings="?", 
                  colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                  skip=66637,
                  nrows=2880)
times <- strptime(paste(power$date, power$time), "%d/%m/%Y %H:%M:%S")
png("plot2.png",width=504,height=504,bg="transparent")
plot(times, power$global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()