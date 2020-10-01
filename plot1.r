library(dplyr)
library(lubridate)
#data transformation
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
datetime<-paste(data$Date,data$Time)
data<-mutate(data,datetime)
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
#subsetting the data
df<-filter(data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
df$Global_active_power<-as.double(df$Global_active_power)
#ploting Histogram
png(filename = "plot1.png")
hist(df$Global_active_power,col = "red",xlab = "Global Active Power(Kilowatts)",main = "Global Active Power")
dev.off()

