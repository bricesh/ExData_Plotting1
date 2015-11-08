library(data.table)

DT <- fread(
    "household_power_consumption.txt",
    sep = ";",
    header = TRUE,
    na.strings = "?")

DT <- DT[Date %in% c("1/2/2007","2/2/2007")]

png(filename = "plot2.png")

with(
    DT,
    plot(
        strptime(paste(Date,Time), format = "%d/%m/%Y %H:%M:%OS"),
        Global_active_power,
        ylab = "Global Active Power (kilowatts)",
        xlab = "",
        type = "l"
        )
    )

dev.off()