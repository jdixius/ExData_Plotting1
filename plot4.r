## create Plot 4

## first download the zipped file to a tempfile "hpc.zip" if not already in place
## will put the file in a directory called "EDA-proj1"
## if the directory is already in place we will assume the file is already there

if (!file.exists("EDA-proj1"))
        {
        ## dir.create("EDA-proj1")
        dir.create("EDA-proj1")
        zfile <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(zfile,destfile=".\\EDA-proj1\\hpc.zip")
        
        ## now unzip the file
        ## first get the name of the first file in the zipped dataset
        fname = unzip(".\\EDA-proj1\\hpc.zip",list=TRUE)$Name[1]
        ## now unzip the file.
        unzip(".\\EDA-proj1\\hpc.zip",files=fname,overwrite=TRUE)
}

## read the data into a variable
hpc1 <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)
## take a subset of the data
hpc2 <- hpc1[min(which(hpc1$Date=="1/2/2007")):max(which(hpc1$Date=="2/2/2007")),]

## convert the date and time variables
hpc2 <- transform(hpc2, Time=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
x <- hpc2[,"Global_active_power"]


## create the plot
## set up the plot grid of 2 rows and 2 columns
par(mfrow=c(2,2))
with(hpc2,{
    plot(hpc2$Time,hpc2$Global_active_power,type="l",xlab="",ylab="Global Active Power")
    plot(hpc2$Time,hpc2$Voltage,type="l",xlab="",ylab="Voltage")
    plot(hpc2$Time,hpc2$Sub_metering_1,type="l",xlab="",ylab="Enery sub metering")
    lines(hpc2$Time,hpc2$Sub_metering_2,col="red")
    lines(hpc2$Time,hpc2$Sub_metering_3,col="blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2,2,2),col=c("black","red","blue"))
    plot(hpc2$Time,hpc2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
    })

## copy plot to a file - this will 
dev.copy(png,file=".\\EDA-proj1\\plot4.png",width=480,height=480)

## turn off the copy function
dev.off()

