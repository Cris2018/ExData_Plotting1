##Reading local files
householdata <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

householdata$Date <- as.Date(householdata$Date, format = "%d/%m/%Y")

subdata <- subset(householdata, householdata$Date == "2007-02-01" | householdata$Date == "2007-02-02")

#Plot 3
with(subdata, plot(Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(subdata,lines(Time,Sub_metering_1))
with(subdata,lines(Time,Sub_metering_2,col="red"))
with(subdata,lines(Time,Sub_metering_3,col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Saving in a PNG file
dev.copy(png,"plot3.png", height = 480, width = 480)
dev.off()
