#Read the data (assuming it's in a data directory)
household_power_consumption <- read.csv("./data/household_power_consumption.txt", sep=";")

#Fix the date
household_power_consumption$Date<-as.Date(as.character(household_power_consumption$Date),"%d/%m/%Y")

#Subset to the two dates we're interested in
hpc<-subset(household_power_consumption,Date %in% as.Date(c('2007-02-01','2007-02-02')))

#Change all the Sub_metering_X values to numeric
hpc$Sub_metering_1<-as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2<-as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3<-as.numeric(as.character(hpc$Sub_metering_3))

#Add the DateTime variable
hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time),format="%Y-%m-%d %H:%M:%S")

#Open the device and plot
png(filename="plot3.png",height=480,width=480,units="px")
plot(hpc2$DateTime,hpc2$Sub_metering_1,type="o",pch=NA,xlab=NA,ylab="Energy sub metering")
lines(hpc2$DateTime,hpc2$Sub_metering_2,col="red")
lines(hpc2$DateTime,hpc2$Sub_metering_3,col="blue")

#Add me a legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

#Shut the device
dev.off()
