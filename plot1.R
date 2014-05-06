hp<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?") ### read in the file
hpc=hp                                                                            ### rename it to cut down on chance of having to reload 
hpc$Date=as.Date(hpc$Date,"%d/%m/%Y")                                             ### put date into date format
hpco=subset(hpc,Date=="2007-02-01"|Date=="2007-02-02")                            ### get just the dates we need    
hist(hpco$Global_active_power,col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power") ##create histogram
png(filename="plot1")                        ## create the png file







###### code above here, play below IGNORE EVERYTHING BELOW; it is just my notes that helped me create the file and I don't want to lose them
hpctest=hpco[1:5,]
hpctest
hpco=subset(hpc,Date=="2007-02-01"|Date=="2007-02-02")
tail(hpco)
str(hpco)
hpctest$Time=as.Time(hpctest$Time)
hptest=hp[1:5,]
hptest
hptest$Date=cbind(hptest$Date,hptest$Time)
hist(hpco$Global_active_power,col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power")
png(filename = "Rplot%03d.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"), antialias