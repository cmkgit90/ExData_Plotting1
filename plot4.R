create_plot4 <- function() {
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
	png(filename="./plot4.png")

	# indicate that there will be 4 graphs
	par(mfrow=c(2,2))
	par(mar=c(4,4,2,2))

	# 1st graph: plot Time x Global active power
	plot(pcon_data$Time, type="l", pcon_data$Global_active_power, xlab="", ylab="Global Active Power")

	# 2nd graph: plot Time x Voltage
	plot(pcon_data$Time, type="l", pcon_data$Voltage, xlab="datetime", ylab="Voltage")

	# 3rd graph: plot sub_metering series
	plot(pcon_data$Time, pcon_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
	lines(pcon_data$Time, pcon_data$Sub_metering_2, col="red")
	lines(pcon_data$Time, pcon_data$Sub_metering_3, col="blue")
	legend("topright", bty="n",
		 legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		 col=c("black","red","blue"), lty = c(1, 1, 1))

	# 4th graph:
	plot(pcon_data$Time, type="l", pcon_data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power")

	# close device
	dev.off()
}