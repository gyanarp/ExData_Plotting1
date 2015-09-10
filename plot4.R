dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
finalActiveData <- as.numeric(subSet$Global_active_power)
finalReactiveData <- as.numeric(subSet$Global_reactive_power)
volt <- as.numeric(subSet$Voltage)
subMeter1 <- as.numeric(subSet$Sub_metering_1)
subMeter2 <- as.numeric(subSet$Sub_metering_2)
subMeter3 <- as.numeric(subSet$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, finalActiveData, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMeter1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, finalReactiveData, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
