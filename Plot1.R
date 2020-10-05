##Unzip file 
unzip(zipfile="./data/exdata_data_household_power_consumption.zip",exdir="./data")

##Read in household power consumption data
Data1 <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

##Subset to 2/1 and 2/2 2007
Data2 <- subset(Data1, Date %in% c("1/2/2007","2/2/2007"))

##Change to date type 
Data2$Date <- as.Date(Data2$Date, format="%d/%m/%Y")

##Plot 1
hist(as.numeric(Data2$Global_active_power), xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "red")

##Save plot as PNG
dev.copy(png, file = "Plot1.png")
dev.off()



