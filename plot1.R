create_plot1 <- function() {
	# load data 
	pcon_data <- read.table("./household_power_consumption.txt", header = TRUE,sep=";", na.strings="?")
	
	# convert the Date and Time variables to Date/Time
	pcon_data$Date <- as.Date(pcon_data$Date, format="%d/%m/%Y")
	#pcon_data$Time <- strptime(pcon_data$Time, "%H:%M:%S")

	# use data from the dates 2007-02-01 and 2007-02-02
	start <- as.Date("01/02/2007","%d/%m/%Y")
	end <- as.Date("02/02/2007", "%d/%m/%Y")

	# get only the observation from the dates specified	
	pcon_data <- subset(pcon_data, Date==start | Date==end)

	# open a png device
	png(filename="./plot1.png")

	# create histogram of global active power
	hist(pcon_data$Global_active_power, col="red", axes=FALSE, xlim=c(0,6), main="Global Active Power", xlab="Global Active Power (kilowatts)")
	axis(1, at=c(0,2,4,6))
	axis(2)

	dev.off()	
}