exdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
exdata$dateTime <- strptime(paste(exdata$Date, exdata$Time), "%d/%m/%Y %H:%M:%S")
exdataSubset <- subset(exdata, 
                       dateTime >= strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") 
                        & dateTime <= strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S"))
windows(480,480)
hist(exdataSubset$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.copy2pdf(file="Plot1.pdf")
dev.off()

                  