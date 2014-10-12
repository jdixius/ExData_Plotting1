## first download the zipped file to a tempfile "hpc.zip"
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

## setwd("C:\\Users\\Jim\\Desktop\\Exploratory Data") ##set the directory the location of the source files and where the plots will be saved
## read the data into a variable
hpc1 <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=FALSE)
## take a subset of the data
hpc2 <- hpc1[min(which(hpc1$Date=="1/2/2007")):max(which(hpc1$Date=="2/2/2007")),]
## set variable 'x' to just the values for 'Global_active_power'
x <- hpc2[,"Global_active_power"]

## create a histogram
hist(x,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

## copy plot to a file - this will 
dev.copy(png,file=".\\EDA-proj1\\plot1.png",width=480,height=480)

## turn off the copy function
dev.off()

