# Load data
data = read.table("household_power_consumption.txt", sep=";", header=TRUE)

# Convert Date variable from character to date format
data$Date2 = as.Date(data$Date, "%d/%m/%Y")

# Subset dataset
data2 = data[data$Date2=="2007-02-01" | data$Date2=="2007-02-02" ,]

# Create Date-Time variable
date_time = paste(data2$Date2, data2$Time)
data2$date_time = strptime(date_time, "%Y-%m-%d %H:%M:%S")

# Plot 1
data2$Global_active_power = as.numeric(data2$Global_active_power)
hist(data2$Global_active_power/1000, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
