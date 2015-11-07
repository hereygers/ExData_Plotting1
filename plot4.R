## Following code generates the plot4 from the file household_power_comsumption.txt as png file
##
## prerequisite is that this file needs to be in the working directory
##

## read in the whole file
hpc  <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")

## convert Date Column to Date type
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

## Keep only the relevant Days to examine
hpc <- subset(hpc, Date=="2007-02-01" | Date=="2007-02-02")

## Convert Time Column
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")

## setting locale English (I have to do this otherwise I get Day abbreviations in German)
Sys.setlocale("LC_TIME", "English")

png(file="plot4.png")

par(mfrow=c(2,2))

## Generate plot 4-1
plot(hpc$Time,hpc$Global_active_power, type="l", xlab="" ,ylab="Global Active Power")

## Generate plot 4-2
plot(hpc$Time,hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Generate Plot 4-3

plot(hpc$Time,hpc$Sub_metering_1, type="n", xlab="" ,ylab="Energy sub metering")
lines(hpc$Time,hpc$Sub_metering_1, type="l")
lines(hpc$Time,hpc$Sub_metering_2, type="l", col="red")
lines(hpc$Time,hpc$Sub_metering_3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1) ,col=c("black","red","blue"))


## Generate plot 4-4
plot(hpc$Time,hpc$Global_reactive_power, type="l", xlab="datetime" , ylab="Global_reactive_power")

dev.off()



