##Code to draw Exploratory Data Analisys Project 1 Plot 4

dtHouseholdPowerConsumption<-read.csv2("household_power_consumption.txt")

KeyDateTime<-strptime(paste(dtHouseholdPowerConsumption[,"Date"],dtHouseholdPowerConsumption[,"Time"]),"%d/%m/%Y %H:%M:%S")

dtSubset<-cbind(KeyDateTime,dtHouseholdPowerConsumption)

rm(dtHouseholdPowerConsumption)

IniDateTime<-strptime("2007-02-01 00:00:00" , "%Y-%m-%d %H:%M:%S")
FinDateTime<-strptime("2007-02-03 00:00:00" , "%Y-%m-%d %H:%M:%S")

dtSelectedDates<-subset(dtSubset,KeyDateTime>=IniDateTime & KeyDateTime<FinDateTime)

rm(dtSubset)
rm(KeyDateTime)


png(filename = "plot4.png", width = 480, height = 480, units = "px" , bg="transparent")
par(mfrow=c(2,2))

#Plot1
plot(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Global_active_power)/1000,xlab="",ylab="Global Active Power",pch="")
lines(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Global_active_power)/1000)

#Plot2
plot(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Voltage)/10,xlab="datetime",ylab="Voltage",pch="",ylim=c(80,250))
lines(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Voltage)/10)

#Plot3

plot(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Sub_metering_1),ylab="Energy sub metering",xlab="",pch="",ylim=c(0,40))

lines(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Sub_metering_1))
lines(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Sub_metering_2),col="red",ylim=c(0,40))
lines(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Sub_metering_3),col="blue",ylim=c(0,40))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       pch=c("_","_","_"),col=c("black","red","blue"))


#Plot4
plot(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Global_reactive_power)/1000,xlab="datetime",ylab="Global_reactive_power",pch=20)
lines(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Global_reactive_power)/1000)

dev.off()

#write.csv2(dtSelectedDates,file="Project1records.txt",quote=FALSE)
