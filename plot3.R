create_plot3 <- function() {
	# load data 
	pcon_data <- read.table("./household_power_consumption.txt", header = TRUE,sep=";", na.strings="?")
	
	# convert the Date and Time variables to Date/Time
	pcon_data$Time <- paste(pcon_data$Date, " ", pcon_data$Time)
	pcon_data$Date <- as.Date(pcon_data$Date, format="%d/%m/%Y")
	pcon_data$Time <- strptime(pcon_data$Time, "%d/%m/%Y %H:%M:%S", tz="GMT")

	# use data from the dates 2007-02-01 and 2007-02-02
	start <- as.Date("01/02/2007","%d/%m/%Y")
	end <- as.Date("02/02/2007", "%d/%m/%Y")

	# get only the observation from the dates specified	
	pcon_data <- subset(pcon_data, Date==start | Date==end)

	# open a png device
	png(filename="./plot3.png")

	# plot main data and additional series
	plot(pcon_data$Time, pcon_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
	lines(pcon_data$Time, pcon_data$Sub_metering_2, col="red")
	lines(pcon_data$Time, pcon_data$Sub_metering_3, col="blue")

	# add legend
	legend("topright", 
		 legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		 col=c("black","red","blue"), lty = c(1, 1, 1))

	# close device
	dev.off()
}