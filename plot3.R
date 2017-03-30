#### Set the working director where the zip file is placed########

if(!dir.exists("./data/")){dir.create("./data/")}
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip", exdir = "./data")

########## Loading the data into a variable#######
hpc<- read.table("./data/household_power_consumption.txt",header = TRUE, sep =";", na.strings = "?")

#### Setting the date class in the data frame#####
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")

##### selecting only the required data #############
hpc<-hpc[which(hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02"),]

#### Setting the time class #####
hpc$Time<- strptime(paste(hpc$Date,hpc$Time), "%Y-%m-%d %H:%M:%S")

#### creating plots based on the sub meter reading and added a legend to it , saving it as png file
png(filename= "Plot3.png", width = 480, height = 480,bg="transparent")
plot(hpc$Time,hpc$Sub_metering_1, type="l" ,ylab = "Energy sub metering",xlab="")
lines(hpc$Time,hpc$Sub_metering_2, type="l",col="red")
lines(hpc$Time,hpc$Sub_metering_3, type="l",col="blue")
legend(x= "topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1),col=c("black","red","blue"))
dev.off()