library(dplyr)
library(lubridate)
#data transformation
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
datetime<-paste(data$Date,data$Time)
data<-mutate(data,datetime)
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
#subsetting the required data
df<-filter(data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
df$datetime<-parse_date_time(df$datetime,orders = "dmy HMS")
#plotting the required graph
png(filename = "plot2.png")
plot(df$datetime,df$Global_active_power, type ="l",xlab = "",ylab = "Global Active Power(kilowatts)")
dev.off()