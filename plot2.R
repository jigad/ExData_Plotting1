#Read in the data (assuming it is in a data directory)
household_power_consumption <- read.csv("./data/household_power_consumption.txt", sep=";")

#Change date to proper format
household_power_consumption$Date<-as.Date(as.character(household_power_consumption$Date),"%d/%m/%Y")

#Subset to our two dates
hpc<-subset(household_power_consumption,Date %in% as.Date(c('2007-02-01','2007-02-02')))

#Make Global_active_power numeric
hpc$Global_active_power<-as.numeric(as.character(hpc$Global_active_power))

#Add the DateTime field
hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time),format="%Y-%m-%d %H:%M:%S")

#Open the device
png(filename="plot2.png",height=480,width=480,units="px")

#Make the plot
plot(hpc$DateTime,hpc$Global_active_power,type="o",pch=NA,xlab=NA,ylab="Global Active Power (kilowatts)")

#Close the device
dev.off()
