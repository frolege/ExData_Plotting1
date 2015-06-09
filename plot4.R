
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
mydata$NewDate <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
mydata2 <- subset(mydata, NewDate >= "2007-02-01" & NewDate <= "2007-02-02")

mydata2$Global_active_power[mydata2$Global_active_power=="?"] <- NA
mydata2$Global_active_power <- as.numeric(as.character(mydata2$Global_active_power))

mydata2$Global_reactive_power[mydata2$Global_reactive_power=="?"] <- NA
mydata2$Global_reactive_power <- as.numeric(as.character(mydata2$Global_reactive_power))

mydata2$Voltage[mydata2$Voltage=="?"] <- NA
mydata2$Voltage <- as.numeric(as.character(mydata2$Voltage))

mydata2$Sub_metering_1 <- as.character(mydata2$Sub_metering_1)
mydata2$Sub_metering_1[mydata2$Sub_metering_1=="?"] <- NA
mydata2$Sub_metering_1 <- as.numeric(as.character(mydata2$Sub_metering_1))

mydata2$Sub_metering_2 <- as.character(mydata2$Sub_metering_2)
mydata2$Sub_metering_2[mydata2$Sub_metering_2=="?"] <- NA
mydata2$Sub_metering_2 <- as.numeric(as.character(mydata2$Sub_metering_2))

mydata2$Sub_metering_3 <- as.character(mydata2$Sub_metering_3)
mydata2$Sub_metering_3[mydata2$Sub_metering_3=="?"] <- NA
mydata2$Sub_metering_3 <- as.numeric(as.character(mydata2$Sub_metering_3))

par(mfrow = c(2, 2), mar = c(4, 4, 4, 4), oma = c(0, 0, 0, 0))

plot(mydata2$DateTime ,mydata2$Global_active_power,ylab="Global Active Power (kilowatts)",xlab = "",type = "n")
lines(mydata2$DateTime ,mydata2$Global_active_power)

plot(mydata2$DateTime ,mydata2$Voltage,ylab="Voltage",xlab = "datetime",type = "n")
lines(mydata2$DateTime ,mydata2$Voltage)

plot(mydata2$DateTime , mydata2$Sub_metering_1,ylab="Energy Sub Metering",xlab="", type="n")
lines(mydata2$DateTime ,mydata2$Sub_metering_1, col="black")
lines(mydata2$DateTime ,mydata2$Sub_metering_2, col="red")
lines(mydata2$DateTime ,mydata2$Sub_metering_3, col="blue")
legend("topright",lty=c(1,1,1),  col = c("black", "red","blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(mydata2$DateTime ,mydata2$Global_reactive_power,ylab="Global_reactive_power",xlab = "datetime",type = "n")
lines(mydata2$DateTime ,mydata2$Global_reactive_power)
dev.copy(png, file = "plot4.png" ,height = 480, width = 480) 
dev.off()