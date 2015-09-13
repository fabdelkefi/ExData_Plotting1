
householdElectPowerData <- read.table("household_power_consumption.txt", 
                                      sep = ";", header = TRUE, na.strings = "?")
householdElectPowerSubsetData <- householdElectPowerData[householdElectPowerData$Date %in% c("1/2/2007","2/2/2007") ,]

datetimeCol <- strptime(paste(householdElectPowerSubsetData$Date, 
                              householdElectPowerSubsetData$Time, sep=" "), "%d/%m/%Y %T")
globalActivePower <- as.numeric(householdElectPowerSubsetData$Global_active_power)
globalReactivePower <- as.numeric(householdElectPowerSubsetData$Global_reactive_power)
voltage <- as.numeric(householdElectPowerSubsetData$Voltage)
subMetering1 <- as.numeric(householdElectPowerSubsetData$Sub_metering_1)
subMetering2 <- as.numeric(householdElectPowerSubsetData$Sub_metering_2)
subMetering3 <- as.numeric(householdElectPowerSubsetData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetimeCol, globalActivePower, type="l", xlab="", ylab="Global Active Power", 
     cex=0.2)
plot(datetimeCol, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetimeCol, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetimeCol, subMetering2, type="l", col="red")
lines(datetimeCol, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetimeCol, globalReactivePower, type="l", xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()
