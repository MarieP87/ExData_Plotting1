## Reading extracted file ##
data1 <- read.table("household_power_consumption.txt", na.strings = "?", sep =";", header = T)

## Selecting data from the dates 2007-02-01 and 2007-02-02 ##
data1$Date = as.Date(data1$Date, format = "%d/%m/%Y")
data2 <- data1[which((data1$Date <= "2007-02-02")&(data1$Date >= "2007-02-01")),]
data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")

## Plot 2 ##
png("plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data2$DateTime, data2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()