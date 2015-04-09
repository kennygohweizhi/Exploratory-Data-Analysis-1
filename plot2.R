# Load data
data = read.table("household_power_consumption.txt", sep=";", header=TRUE)

# Convert Date variable from character to date format
data$Date2 = as.Date(data$Date, "%d/%m/%Y")

# Convert Time variable from character to time format
data$Time2 = strptime(data$Time, "%H:%M:%S")

# Subset dataset
data2 = data[data$Date2=="2007-02-01" | data$Date2=="2007-02-02" ,]

# Plot 2
plot(data2$date_time, data2$Global_active_power/1000, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()
