# Load data
data = read.table("household_power_consumption.txt", sep=";", header=TRUE)

# Convert Date variable from character to date format
data$Date2 = as.Date(data$Date, "%d/%m/%Y")

# Convert Time variable from character to time format
data$Time2 = strptime(data$Time, "%H:%M:%S")

# Subset dataset
data2 = data[data$Date2=="2007-02-01" | data$Date2=="2007-02-02" ,]

# Plot 3
plot(data2$date_time, data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data2$date_time, data2$Sub_metering_2, col = "red")
lines(data2$date_time, data2$Sub_metering_3, col = "blue")
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

dev.copy(png, file="plot3.png")
dev.off()