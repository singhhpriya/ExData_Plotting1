# Read and create a dataframe
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
      na.strings = "?", colClasses = c('character','character','numeric',
      'numeric','numeric','numeric','numeric','numeric','numeric'))


## Format Date column in the dataframe
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Subset data to extract Date and Time
df <- df[(df$Date=="2007-02-01") | (df$Date=="2007-02-02"),]

# Remove incomplete cases
df <- df[complete.cases(df), ]

# Combine Date and Time
dateTime <- paste(df$Date, df$Time)

# Set vector name
dateTime <- setNames(dateTime, "DateTime")

# Remove Date and Time column
df <- df[ , !(names(df) %in% c("Date", "Time"))]

# Combine DT to the data frame
df <- cbind(dateTime, df)

# Convert DT into std. format
df$dateTime <- as.POSIXct(dateTime)

### Create Plot 3
with(df, {
  plot(Sub_metering_1~dateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

### dev.cur()
### png(file="plot3.png")
### dev.off()