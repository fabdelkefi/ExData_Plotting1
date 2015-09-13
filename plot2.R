
householdElectPowerData <- read.table("household_power_consumption.txt", 
                                      sep = ";", header = TRUE, na.strings = "?")
householdElectPowerSubsetData <- householdElectPowerData[householdElectPowerData$Date %in% c("1/2/2007","2/2/2007") ,]

datetimeCol <- strptime(paste(householdElectPowerSubsetData$Date, 
                              householdElectPowerSubsetData$Time, sep=" "), "%d/%m/%Y %T")
globalActivePower <- as.numeric(householdElectPowerSubsetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetimeCol, globalActivePower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()