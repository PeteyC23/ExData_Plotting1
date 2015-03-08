data <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)

data <- transform(data, Date = as.Date(Date, format = "%d/%m/%Y"))
data <- transform(data, Time = strptime(Time, format = "%H:%M:%S"))
data$concat <- paste(data$Date, data$Time,sep=" ")

png(filename="plot2.png", width = 480, height = 480)
min <- as.Date("01/02/2007", format = "%d/%m/%Y")
max <- as.Date("02/02/2007", format = "%d/%m/%Y")

timerange <- subset(data, Date >= min)
datasub <- subset(timerange, Date <= max)
plot(1:nrow(datasub), datasub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1,at=c(1,nrow(datasub)/2,nrow(datasub)), labels=c("Thu","Fri","Sat"))

dev.off()
