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

png("plot3.png")

par(col = "black")
plot(data$date, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
par(new = TRUE)
par(col = "red")
lines(data$date, data$Sub_metering_2, type = "l")
par(new = TRUE)
par(col = "blue")
lines(data$date, data$Sub_metering_3, type = "l")
par(new = FALSE)
par(col = "black")
legend(x = "topright",
			 legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
			 col = c("black", "red", "blue"),
			 lwd = 1)

dev.off()