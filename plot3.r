power <- read.csv("household_power_consumption.txt", 
                  sep=";", 
                  header=FALSE,
                  col.names=c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "metering_1", "metering_2", "metering_3"),
                  na.strings="?", 
                  colClasses = c("character","character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
                  skip=66637,
                  nrows=2880)
times <- strptime(paste(power$date, power$time), "%d/%m/%Y %H:%M:%S")

png("plot3.png")
plot(times, power$metering_1, type="s", ylab="Energy sub metering")
points(times, power$metering_2, type="s", col="red")
points(times, power$metering_3, type="s", col="blue")
legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()