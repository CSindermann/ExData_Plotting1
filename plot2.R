# Read data (in correct format)
data <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Chose subset of data (see introduction to assignment)
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


##Missing values are coded as ? --> change ?!? Maybe needs to be changed later

# Plot 2
#Need a date / time -variable
date_time <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Variable is a character variable --> needs to be changed into numeric variable
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

plot(date_time, data_subset$Global_active_power, 
     type="l",
     xlab="", 
     ylab="Global Active Power (kilowatts)")

# copy to png file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
