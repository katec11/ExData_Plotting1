plot2 <- function () {
        #read table
        DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
        #makes date a date variable
        DT$Date<-as.Date(DT$Date, "%d/%m/%Y")
        #subsets to the only two dates of interest
        DT <- DT[DT$Date == "2007-02-01" | DT$Date == "2007-02-02",]
        #puts date and time together in one variable
        a<- paste(DT[,1],DT[,2], sep=" ")
        DT$cmbDate<-strptime(a, "%Y-%m-%d %H:%M:%S")
        
        #open device
        png(file="plot2.png",width = 480, height = 480)

                
        #plots line plot of Global active power over the two day period
        plot(DT$cmbDate,DT$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

        #turns off device
        dev.off()
}

