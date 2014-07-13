# Uncompress the zip file downloaded with Assignment 1 instructions. The file is in the working directory.

unzip("household_power_consumption.zip")

rawfile <- "household_power_consumption.txt"

# Read in the data from the uncompredded raw data:
d <- read.table(rawfile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Select the two days of interest, as specified in assignment instructions.

d2 <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"),]

# Add new column with POSIX dat/time format to facilitate analysis & plotting.

d2$DateTime <- strptime(paste(d2$Date, d2$Time), "%d/%m/%Y %H:%M:%S")

# Create our plot of interest:

png(filename = "plot2.png", width = 480, height = 480, units = "px")

with(d2, plot(DateTime, as.numeric(Global_active_power), type="l", main="", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
