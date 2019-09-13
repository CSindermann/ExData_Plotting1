# Read data (in correct format)
data <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Chose subset of data (see introduction to assignment)
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


##Missing values are coded as ? --> change ?!? Maybe needs to be changed later

# Plot 4
#Need a date / time -variable
date_time <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Variables are character variables --> need to be changed into numeric variables
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)
data_subset$Sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
data_subset$Sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
data_subset$Voltage <- as.numeric(data_subset$Voltage)
data_subset$Global_reactive_power <- as.numeric(data_subset$Global_reactive_power)

par(mfrow=c(2,2))
plot(date_time, data_subset$Global_active_power, 
     type="l",
     xlab="", 
     ylab="Global Active Power (kilowatts)")

plot(date_time, data_subset$Voltage, 
     type="l",
     xlab="datetime", 
     ylab="Voltage")

plot(date_time, data_subset$Sub_metering_1, 
     type="l",
     xlab="", 
     ylab="Energy sub metering")
lines(date_time, data_subset$Sub_metering_2, type="l", col="red")
lines(date_time,data_subset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(date_time, data_subset$Global_reactive_power, 
     type="l",
     xlab="datetime", 
     ylab="Global_reactive_power")


# copy to png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

