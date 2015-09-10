dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
finalData <- as.numeric(subSet$Global_active_power)
subMeter1 <- as.numeric(subSet$Sub_metering_1)
subMeter2 <- as.numeric(subSet$Sub_metering_2)
subMeter3 <- as.numeric(subSet$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMeter1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()