plot4 <- function () {
        #read in table
        DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
        
        #make the dates a date variable
        DT$Date<-as.Date(DT$Date, "%d/%m/%Y")
        
        #pick only the two days we're interested in
        DT <- DT[DT$Date == "2007-02-01" | DT$Date == "2007-02-02",]
        
        #put the date and time together in one variable
        a<- paste(DT[,1],DT[,2], sep=" ")
        DT$cmbDate<-strptime(a, "%Y-%m-%d %H:%M:%S")      
        
        #opens device
        png(file="plot4.png",width = 480, height = 480)
        
        #make 4 plots, set margin and scale font
        par(mfcol = c(2, 2))
        par(mar = c(3,4,3,3))
        par(cex = .5)

        #Upper right hand plot
        plot(DT$cmbDate,DT$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
 
        #lower right hand plot
        plot(DT$cmbDate, DT$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab="")
        lines(DT$cmbDate,DT$Sub_metering_2, col ="red")
        lines(DT$cmbDate,DT$Sub_metering_3, col = "blue")
        legend("topright", bty="n",pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        #upper left hand plot
        plot(DT$cmbDate,DT$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", col = "black")
 
        #lower left hand plot
        plot(DT$cmbDate,DT$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", col="black")
        
        #closes device
        dev.off()        
}