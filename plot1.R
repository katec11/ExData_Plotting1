plot1 <- function () {
        #read table
        DT <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
        #make date a date variable
        DT$Date<-as.Date(DT$Date, "%d/%m/%Y")
        #subsets to the only 2 dates of interest
        DT <- DT[DT$Date == "2007-02-01" | DT$Date == "2007-02-02",]
        
        #opens device
        png(file="plot1.png",width = 480, height = 480)
        #plots global active power over time
        hist(DT$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
        #turns off device
        dev.off()
}