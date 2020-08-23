# Getting the data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/pwr_cons",method="auto")

unzip(zipfile="./data/pwr_cons",exdir="./data")
setwd("./data")
powerDf<-read.delim("household_power_consumption.txt",sep=";")
subSetData <- powerDf[powerDf$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData[3:9]<-sapply(subSetData[3:9],as.numeric)

#Plot3
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- (subSetData$Global_active_power)
png("plot3.png", width=480, height=480)
plot(datetime,subSetData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime,subSetData$Sub_metering_2, type="l", col="red")
lines(datetime,subSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()