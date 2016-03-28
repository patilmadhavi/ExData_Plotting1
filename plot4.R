setwd("C:\\Users\\madhavi.patil\\Documents\\coursera\\exdata-data-household_power_consumption\\")
library(dplyr)
pw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,na.strings ="?" )
dt<-tbl_df(pw)
head(dt)
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
dt2<-filter(dt,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
dt2<-dt2[complete.cases(dt2),]

## Plot-4: 4 plots

png(filename="plot4.png", width=480, height=480)
par(mfcol = c(2,2))
##Plot 1  Graph of datetime vs Global Active power
plot(strptime(paste(as.Date(dt2$Date), dt2$Time),"%Y-%m-%d %H:%M:%S") , as.numeric(dt2$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power")

##Plot 2 Graph of datetime vs Sub metering information (1,2,3)
plot(strptime(paste(as.Date(dt2$Date), dt2$Time),"%Y-%m-%d %H:%M:%S") , as.numeric(dt2$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(strptime(paste(as.Date(dt2$Date), dt2$Time),"%Y-%m-%d %H:%M:%S") , as.numeric(dt2$Sub_metering_2),type = "l",col ="red")
lines(strptime(paste(as.Date(dt2$Date), dt2$Time),"%Y-%m-%d %H:%M:%S") , as.numeric(dt2$Sub_metering_3),type = "l",col ="blue")
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Plot 3 Graph of datetime vs Voltage
plot(strptime(paste(as.Date(dt2$Date), dt2$Time),"%Y-%m-%d %H:%M:%S") , as.numeric(dt2$Voltage), type = "l", xlab = "datetime", ylab = "voltage")

##Plot 4 Graph of datetime vs Global_reactive_power
plot(strptime(paste(as.Date(dt2$Date), dt2$Time),"%Y-%m-%d %H:%M:%S") , as.numeric(dt2$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global reactive power")

dev.off()