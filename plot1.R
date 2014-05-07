## Reading extracted file ##
data1 <- read.table("household_power_consumption.txt", na.strings = "?", sep =";", header = T)

## Selecting data from the dates 2007-02-01 and 2007-02-02 ##
data1$Date = as.Date(data1$Date, format = "%d/%m/%Y")
data2 <- data1[which((data1$Date <= "2007-02-02")&(data1$Date >= "2007-02-01")),]
data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%Y-%m-%d %H:%M:%S")

## Plot 1 ##
png("plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(data2$Global_active_power, col = "#FF2500", main = "Global Active Power", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()