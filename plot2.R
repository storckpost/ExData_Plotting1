### Final Version May 7, 10:25 a.m.

#### The first 6 lines read the data, extract the two days actually needed, and create a new variable D and T in POSIXlt format

hp<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")  ### read in the file
hpc=hp                                                                              ### rename it to cut down on chance of having to reload 
hpc$Date=as.Date(hpc$Date,"%d/%m/%Y")                                               ### put date into date format
hpco=subset(hpc,Date=="2007-02-01"|Date=="2007-02-02")                              ### get just the dates we need    
hpco$DandT=paste(hpco$Date,hpco$Time,sep=" ")                                       ### make one variable out of date and time
hpco$DandT=as.POSIXct(strptime(hpco$DandT,format="%Y-%m-%d %H:%M:%S")  )            ### turn that new variable into PSIXlt format



png("plot2.png")                                                                    ### start the plotting
plot(hpco$DandT,hpco$Global_active_power,type="n",xlab="",ylab="Global Active Power(kilowatts)")
lines(hpco$DandT,hpco$Global_active_power,type="l")
dev.off()






