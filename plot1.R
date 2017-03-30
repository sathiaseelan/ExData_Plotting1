#### set the working director where the zip file is placed########

if(!dir.exists("./data/")){dir.create("./data/")}
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip", exdir = "./data")

########## loading the data into a variable#######
hpc<- read.table("./data/household_power_consumption.txt",header = TRUE, sep =";", na.strings = "?")
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")

##### selecting only the required data #############
hpc<-hpc[which(hpc$Date=="2007-02-01" | hpc$Date=="2007-02-02"),]

######## converting the class of date and time field
png(filename ="Plot1.png", width = 480, height = 480, bg="transparent")

hist(hpc$Global_active_power, col="red" , main = "Global Active Power" , xlab = "Global Active Power (Kilowatts)" ,ylab = "Frequency")

dev.off()
