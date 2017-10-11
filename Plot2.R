library(lattice)
exdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
exdata$dateTime <- strptime(paste(exdata$Date, exdata$Time), "%d/%m/%Y %H:%M:%S")
exdataSubset <- subset(exdata, 
                       dateTime >= strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") 
                        & dateTime <= strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S"))
windows(480,480)
plot(exdataSubset$dateTime, exdataSubset$Global_active_power, type = "l", col = "black",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.copy2pdf(file="Plot2.pdf")
dev.off()

                  