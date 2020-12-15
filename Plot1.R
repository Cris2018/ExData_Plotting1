##Reading local files
householdata <- read.table("household_power_consumption.txt",sep = ";", header = TRUE)
head(householdata)



householdata$Date <- as.Date(householdata$Date, format = "%d/%m/%Y")
subdata <- subset(householdata, householdata$Date == "2007-02-01" | householdata$Date == "2007-02-02")

#Plot 1
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

with(subdata, hist(subdata$Global_active_power, 
                   col = "red", 
                   main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)"))

#Saving in a PNG file
dev.copy(png,"plot1.png", height = 480, width = 480)
dev.off()