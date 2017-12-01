
quiz=read.table("D:/Data science/exdata_data_household_power_consumption/household_power_consumption.txt",sep=';',header = T)

quiz$date1=as.Date(as.character(quiz$Date),'%d/%m/%Y')
x=c("2007-02-01","2007-02-02")
y=as.Date(x)
quiz1=quiz[quiz$date1 %in% y,]
quiz1$Global_active_power1=as.numeric(quiz1$Global_active_power)/1000
setwd("D:/Data science/Test")
png("plot1.png")
hist(quiz1$Global_active_power1,col='red',main="Global Active Power",xlab="Gloabl Active Power(Kilowatts)")
dev.off()
