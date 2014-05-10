power <- read.csv("household_power_consumption.txt", 
                  sep=";", 
                  header=FALSE,
                  col.names=c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "metering_1", "metering_2", "metering_3"),
                  na.strings="?", 
                  colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                  skip=66637,
                  nrows=2880)
times <- strptime(paste(power$date, power$time), "%d/%m/%Y %H:%M:%S")

png("plot4.png",width=504,height=504,bg="transparent")
par(mfrow = c(2, 2))

plot(times, power$global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(times, power$voltage, type="l", ylab="Voltage", xlab="datetime")

plot(times, power$metering_1, type="s", ylab="Energy sub metering", xlab="")
points(times, power$metering_2, type="s", col="red")
points(times, power$metering_3, type="s", col="blue")
legend("topright", 
       bty="n",
       pch = "_", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(times, power$global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()