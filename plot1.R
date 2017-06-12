# Read and create a dataframe
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
      na.strings = "?", colClasses = c('character','character','numeric',
      'numeric','numeric','numeric','numeric','numeric','numeric'))

# Open and format plot
png(file="plot1.png", width = 480, height = 480, res = 72)


# Preparing the plot
hist(df$Global_active_power, col = "red", xlab="Global Active Power (kilowatts)",
     main = "Global Active Power")

# Close png device
dev.off()
