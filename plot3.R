library(data.table)

DT <- fread(
    "household_power_consumption.txt",
    sep = ";",
    header = TRUE,
    na.strings = "?")

DT <- DT[Date %in% c("1/2/2007","2/2/2007")]

png(filename = "plot3.png")

plot(
    strptime(paste(DT$Date,DT$Time), format = "%d/%m/%Y %H:%M:%OS"),
    DT$Sub_metering_1,
    ylab = "Energy sub metering",
    type = "n",
    xlab = ""
    )

with(
    DT,
    points(
        strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
        Sub_metering_1,
        type = "l"
    )
)

with(
    DT,
    points(
        strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
        Sub_metering_2,
        type = "l",
        col = "red"
    )
)

with(
    DT,
    points(
        strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
        Sub_metering_3,
        type = "l",
        col = "blue"
    )
)

legend(
    "topright",
    c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
    col = c("black","red","blue"),
    lty = c(1, 1, 1)
    )

dev.off()