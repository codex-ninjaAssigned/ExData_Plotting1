library(dplyr)
library(lubridate)
#transformation of the data
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
datetime<-paste(data$Date,data$Time)
data<-mutate(data,datetime)
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
#subsetting the required data
df<-filter(data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
df$datetime<-parse_date_time(df$datetime,orders = "dmy HMS")
#plotting the requred plot 
png(filename = "plot3.png")
plot(df$datetime,df$Sub_metering_1,type = "l",col="black",xlab = "",ylab = "Energy Sub Metering ")
lines(df$datetime,df$Sub_metering_2,type="l",col="red")
lines(df$datetime,df$Sub_metering_3,type="l",col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),col  = c("black","red","blue"),lty = 1)
dev.off()