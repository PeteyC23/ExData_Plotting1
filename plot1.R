getwd()
#load data into R
data <- read.table("household_power_consumption.txt", na.strings="?", sep=";", header=TRUE)

#transform date and time to match graph
data <- transform(data, Date = as.Date(Date, format = "%d/%m/%Y"))
data <- transform(data, Time = strptime(Time, format = "%H:%M:%S"))

#Call the png function and file characteristics
png(filename="plot1.png", width = 480, height = 480)

# set the time range
min <- as.Date("01/02/2007", format = "%d/%m/%Y")
max <- as.Date("02/02/2007", format = "%d/%m/%Y")
timerange <- subset(data, Date >= min)
datasub <- subset(timerange, Date <= max)

#plot the data and send to wd
hist(datasub$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red", xlim=range(0:6))
dev.off()

