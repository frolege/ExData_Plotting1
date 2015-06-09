
mydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
mydata$NewDate <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata2 <- subset(mydata, NewDate >= "2007-02-01" & NewDate <= "2007-02-02")

mydata2$Global_active_power[mydata2$Global_active_power=="?"] <- NA
mydata2$Global_active_power <- as.numeric(as.character(mydata2$Global_active_power))
hist(mydata2$Global_active_power ,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red" )
dev.copy(png, file = "plot1.png" ,height = 480, width = 480 ) 
dev.off()