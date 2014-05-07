################################
##### 1. Loading the data. #####
################################

## Extracting files ##
unzip("exdata-data-household_power_consumption.zip")

## Reading extracted file ##
data1 <- read.table("household_power_consumption.txt", na.strings = "?", sep =";", header = T)

## Selecting data from the dates 2007-02-01 and 2007-02-02 ##
data1$Date = as.Date(data1$Date, format = "%d/%m/%Y")
data2 <- data1[which((data1$Date <= "2007-02-02")&(data1$Date >= "2007-02-01")),]
data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")

## Plot 1 ##
png("plot1.png", width = 480, height = 480, units = "px", bg="transparent")
hist(data2$Global_active_power, col = "#FF2500", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()

## Plot 2 ##
png("plot2.png", width = 480, height = 480, units = "px", bg="transparent")
plot(data2$DateTime, data2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

## Plot 3 ##
png("plot3.png", width = 480, height = 480, units = "px", bg="transparent")
plot(data2$DateTime, data2$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "")
lines(data2$DateTime, data2$Sub_metering_2, type = "l", col = "red")
lines(data2$DateTime, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

## Plot 4 ##
png("plot4.png", width = 480, height = 480, units = "px", bg="transparent")
par(mfrow = c(2,2))
# 1 #
plot(data2$DateTime, data2$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
# 2 #
plot(data2$DateTime, data2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
# 3 #
plot(data2$DateTime, data2$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = "")
lines(data2$DateTime, data2$Sub_metering_2, type = "l", col = "red")
lines(data2$DateTime, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
# 4 #
plot(data2$DateTime, data2$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()

















