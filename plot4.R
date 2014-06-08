#Read the data (assuming it's in a data directory)
household_power_consumption <- read.csv("./data/household_power_consumption.txt", sep=";")

#Convert the date.
household_power_consumption$Date<-as.Date(as.character(household_power_consumption$Date),"%d/%m/%Y")


#Subset the dates we want
hpc<-subset(household_power_consumption,Date %in% as.Date(c('2007-02-01','2007-02-02')))

#Add a datetime
hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time),format="%Y-%m-%d %H:%M:%S")

#Convert our fields to numeric
hpc$Sub_metering_1<-as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2<-as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3<-as.numeric(as.character(hpc$Sub_metering_3))
hpc$Global_active_power<-as.numeric(as.character(hpc$Global_active_power))
hpc$Voltage<-as.numeric(as.character(hpc$Voltage))
hpc$Global_reactive_power<-as.numeric(as.character(hpc$Global_reactive_power))

#open the device
png(filename="plot4.png",height=480,width=480,units="px")

#Gotta be 4 charts
par(mfrow=c(2,2))

#upper left plot
plot(hpc$DateTime,hpc$Global_active_power,type="o",pch=NA,xlab=NA,ylab="Global Active Power (kilowatts)")

#upper right
plot(hpc$DateTime,hpc$Voltage,type="o",pch=NA,xlab="datetime",ylab="Voltage")

#bottom left
plot(hpc$DateTime,hpc$Sub_metering_1,type="o",pch=NA,xlab=NA,ylab="Energy sub metering")
lines(hpc$DateTime,hpc$Sub_metering_2,col="red")
lines(hpc$DateTime,hpc$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

#bottom right
plot(hpc$DateTime,hpc$Global_reactive_power,type="o",pch=NA,xlab="datetime",ylab="Global_reactive_power")

#Close the device
dev.off()
