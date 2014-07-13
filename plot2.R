read.household.power.consuption <- function(file = "household_power_consumption.txt"){
	data <- read.table(file,
										 header = TRUE,
										 sep = ";",
										 na.strings = "?")
	date.strings <- paste(data$Date, data$Time)
	date <- strptime(date.strings, "%d/%m/%Y %H:%M:%S")
	data <- cbind(date, data[,3:9])
	data[data$date > strptime("2007-02-01", "%Y-%m-%d") & data$date < strptime("2007-02-03", "%Y-%m-%d"),]
}

data <- read.household.power.consuption()

png("plot2.png")

plot(data$date,
		 data$Global_active_power,
		 type = "l",
		 xlab = "",
		 ylab = "Global Active Power (kilowatts)")

dev.off()