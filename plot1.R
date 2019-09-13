# Read data (in correct format)
data <- read.table ("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Chose subset of data (see introduction to assignment)
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


##Missing values are coded as ? --> change ?!? Maybe needs to be changed later

# Plot 1
# Variable is a character variable --> needs to be changed into numeric variable
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)
#histogram
hist(data_subset$Global_active_power, 
     xlab="Global active Power (kilowatts)", 
     main="Global Active Power", 
     breaks=11, 
     col="red")

# copy to png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
