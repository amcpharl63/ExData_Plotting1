library(lattice)
exdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
exdata$dateTime <- strptime(paste(exdata$Date, exdata$Time), "%d/%m/%Y %H:%M:%S")
exdataSubset <- subset(exdata, 
                       dateTime >= strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S") 
                        & dateTime <= strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S"))
windows(480,480)
plot(exdataSubset$dateTime, exdataSubset$Sub_metering_1, type="l",
     ylab="Energy sub metering", xlab = "")
lines(exdataSubset$dateTime, exdataSubset$Sub_metering_2, col = "red")
lines(exdataSubset$dateTime, exdataSubset$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1))

dev.copy2pdf(file="Plot3.pdf")
dev.off()

                  