library(data.table)

DT <- fread(
    "household_power_consumption.txt",
    sep = ";",
    header = TRUE,
    na.strings = "?")

DT <- DT[Date %in% c("1/2/2007","2/2/2007")]

png(filename = "plot4.png")

par(mfrow = c(2,2))

with(
    DT,{
        plot(
            strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
            Global_active_power,
            ylab = "Global Active Power",
            xlab = "",
            type = "l"
            )
        
        plot(
            strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
            Voltage,
            ylab = "Voltage",
            xlab = "datetime",
            type = "l"
        )
        
        plot(
            strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
            DT$Sub_metering_1,
            ylab = "Energy sub metering",
            type = "n",
            xlab = ""
        )
        points(
            strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
            Sub_metering_1,
            type = "l"
        )
        points(
            strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
            Sub_metering_2,
            type = "l",
            col = "red"
        )
        points(
            strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
            Sub_metering_3,
            type = "l",
            col = "blue"
        )
        legend(
            "topright",
            c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            col = c("black","red","blue"),
            lty = c(1, 1, 1),
            bty = "n",
            cex = .9
        )
        
        plot(
            strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
            Global_reactive_power,
            ylab = "Global_reactive_power",
            xlab = "datetime",
            type = "l"
        )
        
        
    }
)

dev.off()