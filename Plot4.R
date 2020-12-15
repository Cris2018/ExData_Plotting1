##Reading local files
householdata <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

householdata$Date <- as.Date(householdata$Date, format = "%d/%m/%Y")

subdata <- subset(householdata, householdata$Date == "2007-02-01" | householdata$Date == "2007-02-02")

#Plot 4
par(mfrow = c(2,2))

with(subdata, plot(Time, Global_active_power,
                   type = "l",
                   xlab = "", ylab = "Global Active Power (kilowatts)"))

with(subdata, plot(Time, Voltage,
                   type = "l",
                   ylab = "Voltage"))

with(subdata, plot(Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(subdata,lines(Time,Sub_metering_1))
with(subdata,lines(Time,Sub_metering_2,col="red"))
with(subdata,lines(Time,Sub_metering_3,col="blue"))
legend("topright", lty=c(1,1), bty = "n", cex = .5, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(subdata, plot(Time, Global_reactive_power,
                   type = "l",
                   ylab = "Global_reactive_power"))

#Saving in a PNG file
dev.copy(png,"plot4.png", height = 480, width = 480)
dev.off()
