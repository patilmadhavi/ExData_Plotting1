setwd("C:\\Users\\madhavi.patil\\Documents\\coursera\\exdata-data-household_power_consumption\\")
library(dplyr)
pw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,na.strings ="?" )
dt<-tbl_df(pw)
head(dt)
dt$Date <- as.Date(dt$Date, format="%d/%m/%Y")
dt2<-filter(dt,Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))

## Plot1- histogram of Global Active Power
gloactpw <- as.numeric(dt2$Global_active_power)
png(filename="plot1.png", width=480, height=480)
hist(x = gloactpw,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency"
)
dev.off()