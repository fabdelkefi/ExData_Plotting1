
householdElectPowerData <- read.table("household_power_consumption.txt", 
                                      sep = ";", header = TRUE, na.strings = "?")
householdElectPowerData$Date <- as.Date(householdElectPowerData$Date, format="%d/%m/%Y")
householdElectPowerData$Time <- strptime(householdElectPowerData$Time, format="%T")

dataToUse <- subset(householdElectPowerData, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot1.png", width=480, height=480, units="in", res=300)
hist(dataToUse$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()