##Reading local files
householdata <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)

householdata$Date <- as.Date(householdata$Date, format = "%d/%m/%Y")

subdata <- subset(householdata, householdata$Date == "2007-02-01" | householdata$Date == "2007-02-02")

#Plot 2
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subdata$Time, subdata$Global_active_power,
     type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

#Saving in a PNG file
dev.copy(png,"plot2.png", height = 480, width = 480)
dev.off()
