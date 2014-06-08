#Read in the data (assuming it is in a data directory)
household_power_consumption <- read.csv("./data/household_power_consumption.txt", sep=";")

#Change date to proper format
household_power_consumption$Date<-as.Date(as.character(household_power_consumption$Date),"%d/%m/%Y")

#Subset to the two dates we're interested in
hpc<-subset(household_power_consumption,Date %in% as.Date(c('2007-02-01','2007-02-02')))

#Change Global_active_power values to numeric
hpc$Global_active_power<-as.numeric(as.character(hpc$Global_active_power))

#Open the png device
png(filename="plot1.png",height=480,width=480,units="px")

#Make the histogram
hist(as.numeric(hpc$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#Shut the device
dev.off()
