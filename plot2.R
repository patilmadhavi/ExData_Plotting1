setwd("C:\\Users\\madhavi.patil\\Documents\\coursera\\exdata-data-household_power_consumption\\")
library(dplyr)
pw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,na.strings ="?" )
dt<-tbl_df(pw)
head(dt)
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
dt2<-filter(dt,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
dt2<-dt2[complete.cases(dt2),]

## Plot2- Graph of datetime vs Global Active power

png(filename="plot2.png", width=480, height=480)
plot(strptime(paste(as.Date(dt2$Date), dt2$Time),"%Y-%m-%d %H:%M:%S") , as.numeric(dt2$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()