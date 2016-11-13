#Loading the Data
#read feature information
powerConsumption = read.table("~/Documents/household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
#remove missing values
powerConsumption <- na.omit(powerConsumption)
#convert "Date" to a date type variable
powerConsumption$Date <- as.Date(powerConsumption$Date,format = "%d/%m/%Y")
#filter down to 2007-02-01 and 2007-02-02
graphData <- subset(powerConsumption, Date == '2007-02-01'| Date == '2007-02-02')

#Create second graph
x = paste(graphData$Date, graphData$Time)
y <- strptime(x, "%Y-%m-%d %H:%M:%S")
graphData$date_time <- y

png(file="~/ExData_Plotting1/plot2.png",width=480,height=480)
plot(graphData$date_time,graphData$Global_active_power, type = "l", xlab = ' ', ylab = "Global Active Power (kilowatts)")
dev.off()
