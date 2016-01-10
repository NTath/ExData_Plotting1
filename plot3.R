
#Set working directory
setwd("E:/My Study/Exploratory Data Analysis/Data")

#Read 5 rows of Data
myTable <- read.table("household_power_consumption.txt", 
           header = TRUE, sep=";", na.strings = "?", nrows = 5)

#Create classes so to use them read the whole data faster
myClasses <- sapply(myTable, class)

#Read all the Data
myTable <- read.table("household_power_consumption.txt", 
                      header = TRUE, sep=";", na.strings = "?", 
                      colClasses = myClasses, comment.char = "")

#Convert Date and Time
myTable$Date <- as.Date(myTable$Date , "%d/%m/%Y")
myTable$Time <- strptime(paste(myTable$Date, myTable$Time),  "%Y-%m-%d %H:%M:%S")


myTable <- myTable[myTable$Date=="2007-02-01" | myTable$Date=="2007-02-02", ]


#Create Plot 3
png("plot3.png", width = 480, height = 480)
Sys.setlocale(category = "LC_ALL", locale = "english")
par(mar=c(5,4,3,1), oma=c(0,1,0,2))
plot(myTable$Time,myTable$Sub_metering_1,
     type="n", ylab = "Energy sub metering", xlab = "")
legend("topright", lty=1,col=c("Black", "Red", "Blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(myTable$Time,myTable$Sub_metering_1, col="Black")
lines(myTable$Time,myTable$Sub_metering_2, col="Red")
lines(myTable$Time,myTable$Sub_metering_3, col="Blue")

#close device
dev.off()


