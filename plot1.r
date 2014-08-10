## Load data
source("data.r")

## Open device - png
png(filename="plot1.png")

## Make histogram
hist(power.df$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

## Turn off device
dev.off()