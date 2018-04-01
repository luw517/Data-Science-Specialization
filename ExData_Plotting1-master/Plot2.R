data<-read.table("household_power_consumption.txt",header=TRUE,sep=";", colClasses=c("character","character","double", "double","double","double","double","double","numeric"), na.strings="?")
data_s<-subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
data_s$Date <- as.Date(data_s$Date, format = "%d/%m/%Y")
data_s$DateTime <- strptime(paste(data_s$Date, data_s$Time), format = "%Y-%m-%d %H:%M:%S")
head(data_s$DateTime)
plot(data_s$DateTime, data_s$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

