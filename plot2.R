## Following code generates the plot2 from the file household_power_comsumption.txt as png file
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

## Generate Plot 2
png(file="plot2.png")
plot(hpc$Time,hpc$Global_active_power, type="l", xlab="" ,ylab="Global Active Power (kilowatts)")
dev.off()
