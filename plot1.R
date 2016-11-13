#Loading the Data
#read feature information
powerConsumption = read.table("~/Documents/household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?")
#remove missing values
powerConsumption <- na.omit(powerConsumption)
#convert "Date" to a date type variable
powerConsumption$Date <- as.Date(powerConsumption$Date,format = "%d/%m/%Y")
#filter down to 2007-02-01 and 2007-02-02
graphData <- subset(powerConsumption, Date == '2007-02-01'| Date == '2007-02-02')


#Create first graph
png(file="~/ExData_Plotting1/plot1.png",width=480,height=480)
hist(graphData$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()