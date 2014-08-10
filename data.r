library(lubridate)
#download data
fileurl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
"exdata-data-household_power_consumption.zip"
if (!file.exists("exdata-data-household_power_consumption.zip")) {
  download.file(fileurl),destfile='exdata-data-household_power_consumption.zip')
unzip('exdata-data-household_power_consumption.zip')

pdata.df <- read.table('household_power_consumption.txt', header=TRUE,
                       sep=';', na.strings='?',
                       colClasses=c(rep('character', 2), 
                                    rep('numeric', 7)))


## Read data after changing classes
pdata.df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character", 2), rep("numeric", 7)))

## convert date and time
pdata.df$Date <- dmy(pdata.df$Date)
pdata.df$Time <- hms(pdata.df$Time)

# Subset data 
startdate <- ymd("2007-02-01")
enddate <- ymd("2007-02-02")
pdata.df <- subset(pdata.df, year(Date) == 2007 & month(Date) == 2 & (day(Date) == 1 | day(Date) == 2))

# concat date & time
pdata.df$date.time <- pdata.df$Date + pdata.df$Time

# save data to file
saveRDS(pdata.df, file="pdata.rds")
}
else {
  pdata.df <- readRDS("pdata.rds")
}
