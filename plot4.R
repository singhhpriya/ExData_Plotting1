## Open and format plot
png(file="plot4.png", width = 480, height = 480, res = 72)

# Setting plot formats
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## Create Plot 1
plot(df$Global_active_power~df$dateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Create Plot 2
plot(df$Voltage~df$dateTime, type="l",
     ylab="Voltage", xlab="datetime")

### Create Plot 3
with(df, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Create Plot 4
plot(df$Global_reactive_power~df$dateTime, type="l",
     ylab="Global_reactive_power", xlab="datetime")

# Close png device
dev.off()
