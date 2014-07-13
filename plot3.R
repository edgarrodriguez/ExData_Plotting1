##Code to draw Exploratory Data Analisys Project 1 Plot 3

dtHouseholdPowerConsumption<-read.csv2("household_power_consumption.txt")

KeyDateTime<-strptime(paste(dtHouseholdPowerConsumption[,"Date"],dtHouseholdPowerConsumption[,"Time"]),"%d/%m/%Y %H:%M:%S")

dtSubset<-cbind(KeyDateTime,dtHouseholdPowerConsumption)

rm(dtHouseholdPowerConsumption)

IniDateTime<-strptime("2007-02-01 00:00:00" , "%Y-%m-%d %H:%M:%S")
FinDateTime<-strptime("2007-02-03 00:00:00" , "%Y-%m-%d %H:%M:%S")

dtSelectedDates<-subset(dtSubset,KeyDateTime>=IniDateTime & KeyDateTime<FinDateTime)

rm(dtSubset)
rm(KeyDateTime)

png(filename = "plot3.png", width = 480, height = 480, units = "px" , bg="transparent")

plot(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Sub_metering_1),ylab="Energy sub metering",xlab="",pch="",ylim=c(0,40))

lines(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Sub_metering_1))
lines(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Sub_metering_2),col="red",ylim=c(0,40))
lines(dtSelectedDates$KeyDateTime,as.numeric(dtSelectedDates$Sub_metering_3),col="blue",ylim=c(0,40))

## Add Legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       pch=c("_","_","_"),col=c("black","red","blue"))


dev.off()

#write.csv2(dtSelectedDates,file="Project1records.txt",quote=FALSE)
