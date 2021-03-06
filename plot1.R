# Uncompress the zip file downloaded with Assignment 1 instructions. The file is in the working directory.

unzip("household_power_consumption.zip")

rawfile <- "household_power_consumption.txt"

# Read in the data from the uncompressed raw data:
d <- read.table(rawfile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Select the two days of interest, as specified in assignment instructions.

d2 <- subset(d, (d$Date == "1/2/2007") | (d$Date == "2/2/2007"))

# Add new column with POSIX dat/time format to facilitate analysis & plotting.

d2$DateTime <- strptime(paste(d2$Date, d2$Time), "%d/%m/%Y %H:%M:%S")

# Create our plot of interest:

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(d2$Global_active_power, col='red', ylim=c(0,1200), main="Global Active Power", xlab="Gloabal Active Power (kilowatts)", ylab="Frequency")

dev.off()
