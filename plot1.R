# Read and create a dataframe
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
      na.strings = "?", colClasses = c('character','character','numeric',
      'numeric','numeric','numeric','numeric','numeric','numeric'))

# Preparing the plot
hist(df$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)",
     main = "Global Active Power")

### dev.cur()
### png(file="plot1.png")
### dev.off()