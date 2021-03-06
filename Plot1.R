# Getting the data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./data/pwr_cons",method="auto")

unzip(zipfile="./data/pwr_cons",exdir="./data")
setwd("./data")
powerDf<-read.delim("household_power_consumption.txt",sep=";")
subSetData <- powerDf[powerDf$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData[3:9]<-sapply(subSetData[3:9],as.numeric)


#Plot1
globalActivePower <-(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower/1000, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()