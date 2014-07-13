library(sqldf)
rawfile <- "c:/temp/temp/exdata-data-household_power_consumption/household_power_consumption.txt"
# 
#df <- read.table(rawfile, nrows=100, sep=";", header=T, na.strings="?")
#head(df)

d <- read.table(rawfile, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
d2 <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"),]
sqlquery <- "SELECT * from file WHERE Date = '1/1/2007' OR Date = '2/2/2007'"

df <- read.csv.sql(rawfile, sqlquery, header=TRUE, sep=";") #, na.strings="?")
summary(df)
head(df)
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
write.csv(df, file="selectedData.csv")
df2 <- read.csv("selectedData.csv", header=T, na.strings='?')

hist(df2$Global_active_power, col='red', breaks=13, main="Global Active Power", xlab="Gloabal Active Power (kilowatts)", ylab="Frequency")

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(df2$Global_active_power, col='red', xlim=c(0,6), breaks=seq(0,6, by=0.5), main="Global Active Power", xlab="Gloabal Active Power (kilowatts)", ylab="Frequency")
dev.off()
xyplot(df2$Global_active_power, df2$DateTime)
