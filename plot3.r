## Creates a line graph showing sub-metering over time

## Reads in the subset of the dataset for the relevant dates
table <- read.table("household_power_consumption.txt", sep = ";", col.names = 
        colnames(read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
        nrows = 1)), na.strings = "?", skip = 66637, nrows = 2880)
table$Date <- as.character(table$Date)
table$Time <- as.character(table$Time)
table$CombinedDate <- table$Date
k <- nrow(table)

## Loops through dates and times to create one date per observation
for (i in 1:k) {
        table$CombinedDate[i] <- paste(table$Date[i], table$Time[i])
}
table$CombinedDate <- strptime(table$CombinedDate, format = "%d/%m/%Y %H:%M:%S")

# Plots the graph and saves it as a PNG
png(filename = "plot3.png")
plot(table$CombinedDate, table$Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering")
lines(table$CombinedDate, table$Sub_metering_2, col = "RED")
lines(table$CombinedDate, table$Sub_metering_3, col = "BLUE")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("BLACK", "RED", "BLUE"), bty = "o", lwd = 2)
dev.off()