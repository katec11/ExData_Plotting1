plot3 <- function () {
        #read in table
        DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
        
        #make date a date variable
        DT$Date<-as.Date(DT$Date, "%d/%m/%Y")
        #select only dates we're interested in
        DT <- DT[DT$Date == "2007-02-01" | DT$Date == "2007-02-02",]
        #put date and time together in one variable
        a<- paste(DT[,1],DT[,2], sep=" ")
        DT$cmbDate<-strptime(a, "%Y-%m-%d %H:%M:%S")      
        
        #open .png device
        png(file="plot3.png",width = 480, height = 480)
        
        
        #plots 3 lines, one at a time, and set legend
        plot(DT$cmbDate, DT$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab="")
        lines(DT$cmbDate,DT$Sub_metering_2, col ="red")
        lines(DT$cmbDate,DT$Sub_metering_3, col = "blue")
        legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        #close device
        dev.off()        
} 