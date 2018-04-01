data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", colClasses=c("character","character","double", "double","double","double","double","double","numeric"), na.strings="?")
data_s<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
data_s$Date <- as.Date(data_s$Date, format = "%d/%m/%Y")
data_s$DateTime <- strptime(paste(data_s$Date, data_s$Time), format = "%Y-%m-%d %H:%M:%S")
yrange<-range(c(data_s$Sub_metering_1,data_s$Sub_metering_2,data_s$Sub_metering_3))

png("./plot4.png")

par(mfrow=c(2,2))

plot(data_s$DateTime, data_s$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(data_s$DateTime, data_s$Voltage,type="l",ylab="voltage",xlab="datetime")

plot(data_s$DateTime, data_s$Sub_metering_1,  type="l",ylim=yrange,col="black", ylab="Energy sub mtering", xlab="")
par(new=T)
plot(data_s$DateTime, data_s$Sub_metering_2,  type="l",ylim=yrange,col="red", ylab="Energy sub mtering", xlab="")
par(new=T)
plot(data_s$DateTime, data_s$Sub_metering_3,  type="l",ylim=yrange,col="blue", ylab="Energy sub mtering", xlab="")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2)

plot(data_s$DateTime, data_s$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
