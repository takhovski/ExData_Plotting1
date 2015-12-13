### Set the working directory to where the files are.
setwd(dir = "c:/Users/Shobeir/Desktop/data/week1/")
### Read the data and define that "?" is the NA string in this data set
### Also define that the data are separated via ";" and give the class to the coloumns
data <- read.table(file = "household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";",colClasses = c("character","character",rep("numeric",7)))
### Add a new coloumn's class from character to date.
data$DateTime <-  strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M") 
### Convert the Date coloumn's class from character to date.
data$Date <- as.Date(data$Date,format ="%d/%m/%Y")
### Subsetting the data and only selecting two days. This reduces the memory usage a lot.
data <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
# add a factor comlumn as what is the day
data$day <- as.factor(weekdays(data$DateTime,abbreviate=TRUE))
### Initially used the following line to make sure the data looks correct.
#str(data)
### activate the png device and mention the size
png("plot4.png",width = 480,height = 480)
### plot 4 plots
par(mfcol = c(2,2))
### Plotting datails
### 1st Plot
plot(y=data$Global_active_power,x=data$DateTime,type = "l",xlab = " ",ylab = "Global Active Power")
### 2nd Plot
plot(y=data$Sub_metering_1,x=data$DateTime,type = "l",xlab = " ",ylab = "Energy sub metering",col="black",ylim =c(0,40))
### Adding the second and third datasets with different color
lines(y=data$Sub_metering_2,x=data$DateTime,col="red")
lines(y=data$Sub_metering_3,x=data$DateTime,col= "blue")
### Adding legend to the graphs
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd=1,bty = "n")
### Turning off the png device.
### 3rd Plot
plot(x=data$DateTime,y=data$Voltage,xlab = "datetime",ylab = "Voltage",type="l")
### 4th Plot
plot(x=data$DateTime,y=data$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type="l")
dev.off()