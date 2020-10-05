##Unzip file 
unzip(zipfile="./data/exdata_data_household_power_consumption.zip",exdir="./data")

##Read in household power consumption data
Data1 <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                    colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

##Subset to 2/1 and 2/2 2007
Data2 <- subset(Data1, Date %in% c("1/2/2007","2/2/2007"))

##Change to date type 
Data2$Date <- as.Date(Data2$Date, format="%d/%m/%Y")


##Date / Time Conversion
Date.Time <- paste(as.Date(Data2$Date), Data2$Time)
Data2$Date.Time <- as.POSIXct(Date.Time)


## Plot 4
par(mfrow = c(2,2))
with(Data2, {
      plot(Data2$Global_active_power~Data2$Date.Time, type="l",
           ylab="Global Active Power", xlab="")
      plot(Data2$Voltage~Data2$Date.Time, type="l",
           ylab = "Voltage", xlab = "datetime")
      plot(Data2$Sub_metering_1~Data2$Date.Time, type="l",
           ylab="Energy sub metering", xlab="")
            lines(Data2$Sub_metering_2~Data2$Date.Time, col = "red")
            lines(Data2$Sub_metering_3~Data2$Date.Time, col = "blue")
            legend("topright", lwd=1, seg.len=2, lty = 1, cex = .8, bty = "n", inset = .12, col = c("black","red","blue"), 
                  legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
      plot(Data2$Date.Time, Data2$Global_reactive_power, type="l", 
            ylab = "Global_reactive_power", xlab = "datetime")
})


##Save plot as PNG
dev.copy(png, file = "Plot4.png")
dev.off()



