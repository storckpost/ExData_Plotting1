

#### The first 6 lines read the data, extract the two days actually needed, and create a new variable D and T in POSIXlt format

hp<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")  ### read in the file
hpc=hp                                                                              ### rename it to cut down on chance of having to reload 
hpc$Date=as.Date(hpc$Date,"%d/%m/%Y")                                               ### put date into date format
hpco=subset(hpc,Date=="2007-02-01"|Date=="2007-02-02")                              ### get just the dates we need    
hpco$DandT=paste(hpco$Date,hpco$Time,sep=" ")                                       ### make one variable out of date and time
hpco$DandT=as.POSIXct(strptime(hpco$DandT,format="%Y-%m-%d %H:%M:%S")  )            ### turn that new variable into PSIXlt format




png("plot4.png")
par(mfrow=c(2,2))
plot(hpco$DandT,hpco$Global_active_power,type="n",xlab="",ylab="Global Active Power(kilowatts)")
lines(hpco$DandT,hpco$Global_active_power,type="l")
 plot(hpco$DandT,hpco$Voltage,type="n",ylab="Voltage",xlab="datime")
lines(hpco$DandT,hpco$Voltage)
plot(hpco$DandT,hpco$Sub_metering_1,type="n",xlab="",ylab="Energy submetering")
lines(hpco$DandT,hpco$Sub_metering_3,type="l",col="blue")
lines(hpco$DandT,hpco$Sub_metering_1,type="l",col="black")
lines(hpco$DandT,hpco$Sub_metering_2,type="l",col="red")
legend("topright", lwd= 1,col=c("black","red","blue"), lty=1,legend = c("sub-metering_1","sub-metering_2","sub-metering_3"))

plot(hpco$DandT,hpco$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datime")
lines(hpco$DandT,hpco$Global_reactive_power)
dev.off()