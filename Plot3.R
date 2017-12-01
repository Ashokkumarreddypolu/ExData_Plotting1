quiz=read.table("D:/Data science/exdata_data_household_power_consumption/household_power_consumption.txt",sep=';',header = T)

quiz$date1=as.Date(as.character(quiz$Date),'%d/%m/%Y')
x=c("2007-02-01","2007-02-02")
y=as.Date(x)
quiz1=quiz[quiz$date1 %in% y,]
quiz1$Global_active_power1=as.numeric(quiz1$Global_active_power)/1000
quiz1$time=strptime(paste(quiz1$date1,quiz1$Time,sep=" "),'%Y-%m-%d %H:%M:%S')
library(reshape2)
final=melt(quiz1,id.vars = c("date1","Time"),measure.vars = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
final$time=strptime(paste(final$date1,final$Time,sep=" "),'%Y-%m-%d %H:%M:%S')
plot(quiz1$time,quiz1$Sub_metering_1,type='l',col='green')
lines(quiz1$time,quiz1$Sub_metering_2,col='red')
lines(quiz1$time,quiz1$Sub_metering_3,col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c('green','red','blue'))
