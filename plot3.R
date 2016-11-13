#Loading the Data
#read feature information
powerConsumption = read.table("~/Documents/household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
#remove missing values
powerConsumption <- na.omit(powerConsumption)
#convert "Date" to a date type variable
powerConsumption$Date <- as.Date(powerConsumption$Date,format = "%d/%m/%Y")
#filter down to 2007-02-01 and 2007-02-02
graphData <- subset(powerConsumption, Date == '2007-02-01'| Date == '2007-02-02')

#create datetime
x = paste(graphData$Date, graphData$Time)
y <- strptime(x, "%Y-%m-%d %H:%M:%S")
graphData$date_time <- y

#Create third graph
png(file="~/ExData_Plotting1/plot3.png",width=480,height=480)
plot(graphData$date_time,graphData$Sub_metering_1,type='l',xlab = '',ylab = 'Energy sub metering')
lines(graphData$date_time,graphData$Sub_metering_2,type='l',col = 'red')
lines(graphData$date_time,graphData$Sub_metering_3,type='l',col = 'blue')
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col = c('black','red','blue'),lty = c(1,1,1))
dev.off()