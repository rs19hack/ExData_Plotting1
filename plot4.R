# Uncompress the zip file downloaded with Assignment 1 instructions. The file is in the working directory.

unzip("household_power_consumption.zip")

rawfile <- "household_power_consumption.txt"

# Read in the data from the uncompredded raw data:
d <- read.table(rawfile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Select the two days of interest, as specified in assignment instructions.

d2 <- subset(d, (d$Date == "1/2/2007") | (d$Date == "2/2/2007"))

# Add new column with POSIX dat/time format to facilitate analysis & plotting.

d2$DateTime <- strptime(paste(d2$Date, d2$Time), "%d/%m/%Y %H:%M:%S")

# Plotting the data as required in assignment for the fourth figure:

png(filename = "plot4.png", width = 480, height = 480, units = "px") #open png file for plot output.

# Create our 2x2 panel of 4 plots:
par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0)) # 2x2 panel

#add four plots one at a time
with(d2, { 
    # 
    plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
    plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
    cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(DateTime, Sub_metering_2, type="l", col="red")
    lines(DateTime, Sub_metering_3, type="l", col="blue")
    legend("topright", col=c("black","blue","red"), legend=cols, bty="n", lty=1, lwd=1, )
    plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
    }
)
dev.off() # close the png file.
