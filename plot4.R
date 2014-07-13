##Code to draw Exploratory Data Analisys Project 1 Plot 4

#dtHouseholdPowerConsumption<-read.csv2("household_power_consumption.txt")

#KeyDateTime<-strptime(paste(dtHouseholdPowerConsumption[,"Date"],dtHouseholdPowerConsumption[,"Time"]),"%d/%m/%Y %H:%M:%S")

#dtSubset<-cbind(KeyDateTime,dtHouseholdPowerConsumption)

#rm(dtHouseholdPowerConsumption)

#IniDateTime<-strptime("2007-02-01 00:00:00" , "%Y-%m-%d %H:%M:%S")
#FinDateTime<-strptime("2007-02-03 00:00:00" , "%Y-%m-%d %H:%M:%S")

#dtSelectedDates<-subset(dtSubset,KeyDateTime>=IniDateTime & KeyDateTime<FinDateTime)

#rm(dtSubset)
#rm(KeyDateTime)4

#Organize then draw 



png(filename = "plot4.png", width = 480, height = 480, units = "px" , bg="transparent")
par(mfrow=c(2,2))

hist(as.numeric(dtSelectedDates$Global_active_power)/1000,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
plot(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Global_active_power)/1000,xlab="",ylab="Global Active Powe (kilowatts)",pch=20)
plot(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Sub_metering_1),ylab="Energy sub metering",xlab="")
plot(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Global_active_power)/1000,xlab="",ylab="Global Active Powe (kilowatts)",pch=20)


dev.off()

#write.csv2(dtSelectedDates,file="Project1records.txt",quote=FALSE)