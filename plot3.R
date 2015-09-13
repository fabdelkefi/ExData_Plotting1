
householdElectPowerData <- read.table("household_power_consumption.txt", 
                                      sep = ";", header = TRUE, na.strings = "?")
householdElectPowerSubsetData <- householdElectPowerData[householdElectPowerData$Date %in% c("1/2/2007","2/2/2007") ,]

datetimeCol <- strptime(paste(householdElectPowerSubsetData$Date, 
                              householdElectPowerSubsetData$Time, sep=" "), "%d/%m/%Y %T")
subMetering1 <- as.numeric(householdElectPowerSubsetData$Sub_metering_1)
subMetering2 <- as.numeric(householdElectPowerSubsetData$Sub_metering_2)
subMetering3 <- as.numeric(householdElectPowerSubsetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetimeCol, subMetering1, type="l", ylab="Energy Submetering", 
     xlab="")
lines(datetimeCol, subMetering2, type="l", col="red")
lines(datetimeCol, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
