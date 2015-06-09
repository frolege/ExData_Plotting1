
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
mydata$NewDate <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
mydata2 <- subset(mydata, NewDate >= "2007-02-01" & NewDate <= "2007-02-02")

mydata2$Global_active_power[mydata2$Global_active_power=="?"] <- NA
mydata2$Global_active_power <- as.numeric(as.character(mydata2$Global_active_power))
plot(mydata2$DateTime ,mydata2$Global_active_power,type="n",ylab="Global Active Power (kilowatts)")
lines(mydata2$DateTime ,mydata2$Global_active_power)
dev.copy(png, file = "plot2.png" ,height = 480,  width = 480)
dev.off()