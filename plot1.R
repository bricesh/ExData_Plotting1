library(data.table)

DT <- fread(
    "household_power_consumption.txt",
    sep = ";",
    header = TRUE,
    na.strings = "?")

DT <- DT[Date %in% c("1/2/2007","2/2/2007")]

png(filename = "plot1.png")

with(
    DT,
    hist(
        Global_active_power,
        col = "red",
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)"
        )
    )

dev.off()