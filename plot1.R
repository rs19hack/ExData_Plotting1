rawfile <- "household_power_consumption.txt"

d <- read.table(rawfile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

d2 <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"),]

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(d2$Global_active_power, col='red', ylim=c(0,1200), main="Global Active Power", xlab="Gloabal Active Power (kilowatts)", ylab="Frequency")

dev.off()
