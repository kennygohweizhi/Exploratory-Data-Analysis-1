# Load data
data = read.table("household_power_consumption.txt", sep=";", header=TRUE)

# Convert Date variable from character to date format
data$Date2 = as.Date(data$Date, "%d/%m/%Y")

# Convert Time variable from character to time format
data$Time2 = strptime(data$Time, "%H:%M:%S")

# Subset dataset
data2 = data[data$Date2=="2007-02-01" | data$Date2=="2007-02-02" ,]

# Plot 4
par(mfrow = c(2,2))

# Plot 4a = Plot 1
plot(data2$date_time, data2$Global_active_power/1000, type="l", xlab="", ylab="Global Active Power")

# Plot 4b
plot(data2$date_time, data2$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 4c = Plot 3
plot(data2$date_time, data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data2$date_time, data2$Sub_metering_2, col = "red")
lines(data2$date_time, data2$Sub_metering_3, col = "blue")
legend("topright", lty=1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

# Plot 4d
plot(data2$date_time, data2$Global_reactive_power, type="l", xlab="", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png")
dev.off()
