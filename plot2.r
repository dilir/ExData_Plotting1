## Load data
source('data.R')

## Open device - png
png(filename='plot2.png')

## Make plot
plot(power.df$date.time, power.df$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

## Turn off device
dev.off()