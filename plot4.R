rawfile <- "household_power_consumption.txt"

d <- read.table(rawfile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

d2 <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"),]

d2$DateTime <- strptime(paste(d2$Date, d2$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px")

with(d2, {plot(DateTime, Sub_metering_1, type = "l", main = "", ylab = "Energy sub metering", xlab = "")
     lines(DateTime, Sub_metering_2,col="red")
     lines(DateTime, Sub_metering_3,col="blue")
     legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), col=c("black","red","blue"))
     }
)
dev.off()
