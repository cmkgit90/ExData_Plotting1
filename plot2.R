create_plot2 <- function() {
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
	png(filename="./plot2.png")

	# plot Time x Global active power
	plot(pcon_data$Time, type="l", pcon_data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)")
	
	# close device
	dev.off()
}