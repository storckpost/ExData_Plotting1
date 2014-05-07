##### GREETINGS PEER REVIEWER! I hope you're enjoying this course. I am even though I think the course could use some ... tweaking
##### Thanks for taking the time to look at this. I realize that I have unnecessarily changed the name of my data twice but I did
#### that during development so that if it blew up (which it did, repeatedly) I wouldn't have to read in the whole damn 2 mega-records again



hp<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?") ### read in the file
hpc=hp                                                                            ### rename it to cut down on chance of having to reload 
hpc$Date=as.Date(hpc$Date,"%d/%m/%Y")                                             ### put date into date format
hpco=subset(hpc,Date=="2007-02-01"|Date=="2007-02-02")                            ### get just the dates we need    
png("plot1.png")
hist(hpco$Global_active_power,col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power") ##create histogram
dev.off()


#### Here's a dumb joke I heard yesterday just for fun. It may or may not make sense/be funny depending on what part of the galaxy 
#### you're from:
#### Q: What day is Star Wars Day?
#### A: May the Fourth.
####  (I said it was dumb, but how many other jokes are you going to read at github today?)





