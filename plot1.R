### Set the working directory to where the files are.
setwd(dir = "c:/Users/Shobeir/Desktop/data/week1/")
### Read the data and define that "?" is the NA string in this data set
### Also define that the data are separated via ";" and give the class to the coloumns
data <- read.table(file = "household_power_consumption.txt",header = TRUE,na.strings = "?",sep = ";",colClasses = c("character","character",rep("numeric",7)))
### Convert the Date coloumn's class from character to date.
data$Date <- as.Date(data$Date,format ="%d/%m/%Y")
### Subsetting the data and only selecting two days. This reduces the memory usage a lot.
data <- subset(data,Date=="2007-02-01" | Date=="2007-02-02")
### change the Time column's class from character to time
data$Time <- strptime(data$Time,format ="%H:%M:%S")
### Initially used the following line to make sure the data looks correct.
# str(data)
### activate the png device and mention the size
png("plot1.png",width = 480,height = 480)
###plot the histogram and give a title's name and x axis label is corrected
hist(data$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
### close the device to have a complete image.
dev.off()