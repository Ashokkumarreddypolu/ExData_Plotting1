quiz$date1=as.Date(as.character(quiz$Date),'%d/%m/%Y')
x=c("2007-02-01","2007-02-02")
y=as.Date(x)
quiz1=quiz[quiz$date1 %in% y,]
quiz1$Global_active_power1=as.numeric(quiz1$Global_active_power)/1000
quiz1$time=strptime(paste(quiz1$date1,quiz1$Time,sep=" "),'%Y-%m-%d %H:%M:%S')
quiz1$quiz1$Global_reactive_power1=as.numeric(quiz1$Global_reactive_power)/1000


png('Plot4.png')
par(mfrow=c(2,2))
with(quiz1,plot(time,Global_active_power1,type='l',ylab="Gloabl Active Power(Kilowatts)"))
with(quiz1,plot(time,Voltage,type='l',ylab="Voltage"))
plot(quiz1$time,quiz1$Sub_metering_1,type='l',xlab=" ",ylab="Energy Sub metering")
lines(quiz1$time,quiz1$Sub_metering_2,col='red')
lines(quiz1$time,quiz1$Sub_metering_3,col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c('green','red','blue'))

with(quiz1,plot(time,Global_active_power1,type='l',ylab="Gloabl reactive Power(Kilowatts)"))
dev.off()