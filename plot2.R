rawfile <- "household_power_consumption.txt"

d <- read.table(rawfile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

d2 <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"),]

d2$DateTime <- strptime(paste(d2$Date, d2$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")

with(d2, plot(DateTime, as.numeric(Global_active_power), type="l", main="", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
