## Creates a histogram plotting global active power

## Reads in the subset of the dataset for the relevant dates
table = read.table("household_power_consumption.txt", sep = ";", col.names = 
        colnames(read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
        nrows = 1)), na.strings = "?", skip = 66637, nrows = 2880)

# Plots the histogram and saves it as a PNG
png(filename = "plot1.png")
hist(table$Global_active_power, col = "RED", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()