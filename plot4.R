library(dplyr)
library(lubridate)
#Data Transforamtion
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
datetime<-paste(data$Date,data$Time)
data<-mutate(data,datetime)
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
#subsetting the data (Using only two dates)
df<-filter(data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
df$datetime<-parse_date_time(df$datetime,orders = "dmy HMS")
png(filename = "plot4.png")
#Setting the values of graphical parametrs
par(mfrow=c(2,2))
#plot1
plot(df$datetime,df$Global_active_power, type ="l",xlab = "",ylab = "Global Active Power(kilowatts)")
#plot2
plot(df$datetime,df$Voltage, type ="l",xlab = "datetime",ylab = "Voltage")
#plot3
plot(df$datetime,df$Sub_metering_1,type = "l",col="black",xlab = "",ylab = "Energy Sub Metering ")
lines(df$datetime,df$Sub_metering_2,type="l",col="red")
lines(df$datetime,df$Sub_metering_3,type="l",col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),col  = c("black","red","blue"),lty = 1)
#plot4
plot(df$datetime,df$Global_reactive_power, type ="l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()
