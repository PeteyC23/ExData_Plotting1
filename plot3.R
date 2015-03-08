data <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)

data <- transform(data, Date = as.Date(Date, format = "%d/%m/%Y"))
data <- transform(data, Time = strptime(Time, format = "%H:%M:%S"))
data$concat <- paste(data$Date, data$Time,sep=" ")

png(filename="plot2.png", width = 480, height = 480)
min <- as.Date("01/02/2007", format = "%d/%m/%Y")
max <- as.Date("02/02/2007", format = "%d/%m/%Y")

timerange <- subset(data, Date >= min)
datasub <- subset(timerange, Date <= max)

plot(1:nrow(datasub), datasub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", xaxt="n")
axis(1,at=c(1,nrow(datasub)/2,nrow(datasub)), labels=c("Thu","Fri","Sat"))
lines(1:nrow(datasub), datasub$Sub_metering_2,col="red")
lines(1:nrow(datasub), datasub$Sub_metering_3,col="blue")
legend("topright", pch="-", col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

