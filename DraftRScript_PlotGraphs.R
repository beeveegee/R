# Import necessary libraries

library(tidyr)

# Set working directory

setwd("C:/Users/Brittany/Dropbox/Thesis/Current WASP Files")

# Import desired csv file
# For this example it is "Water_Temperature.csv"

WaterTempfile <- read.csv("Water_Temperature.csv", sep = ",", header = TRUE, skip = 1)

# Transpose data, so rows are now columns
WaterTempfile <- t(WaterTempfile)
colnames(WaterTempfile) <- c(0.0001, 0.50, 1.00, 1.50, 2.00, 2.50, 3.00,3.50, 4.00, 4.50, 5.00, 5.50, 5.9995)

# Removes unnessary rows, may need to look into further if the data is transposed correctly
# look into different data set
WaterTempfile <- WaterTempfile[-c(1,168), ]

# Create new data frame with data that will contain the segment numbers
Water_Temp_Segments <- array(1:166)

# Note that the command below does the exact same thing in fewer lines of code
# Water_Temp_Test <- data.frame(0:166)

# Convert array into dataframe
Water_Temp_Segments <- as.data.frame(Water_Temp_Segments)

# Bind the two columns together into one dataframe
WaterTemp <- cbind(WaterTempfile, Water_Temp_Segments)

# After reviewing results, it looks like the transpose didn't have the first row become the header column

# Basic plot script

plot(WaterTemp$Water_Temp_Segments,WaterTemp$'0.5',type='o',col='purple',xlab='Segments',ylab="Temp",main="Test Plot, do not Upvote")
#lines(GIRF_ISCO_Flow$LocalDateTime,GIRF_ISCO_Flow$DataValue,col='red')
#legend("topright", legend=c("JUDD","ISCO"), lty=1,col=c("purple","red"),bty='n',cex=0.75)



# ------------------------------------------------------------------------------------------

# Same as above with a different csv file

library(tidyr)

# Set working directory

setwd("C:/Users/Brittany/Dropbox/Thesis/Current WASP Files")

# Import desired csv file
# For this example it is "Water_Temperature.csv"

x <- read.csv("DO_Saturation.csv", sep = ",", header = FALSE, skip = 1)

# Transpose data, so rows are now columns
x <- t(x)
colnames(x) <- c(0, 0.0001, 0.50, 1.00, 1.50, 2.00, 2.50, 3.00,3.50, 4.00, 4.50, 5.00, 5.50, 5.9995)

# Removes unnessary rows, may need to look into further if the data is transposed correctly
# look into different data set
x <- x[-c(1,168), ]

# Create new data frame with data that will contain the segment numbers
y <- array(1:166)

# Note that the command below does the exact same thing in fewer lines of code
# Water_Temp_Test <- data.frame(0:166)

# Convert array into dataframe
y <- as.data.frame(y)

# Bind the two columns together into one dataframe
z <- cbind(x, y)

# After reviewing results, it looks like the transpose didn't have the first row become the header column

# Basic plot script

plot(z$y,z$'0.5',type='o',col='purple',xlab='Segments',ylab="DO Saturation",main="Test Plot, do not Upvote")
lines(z$y,z$'0.5',col='red')
legend("topright", legend=c("0.5","5.0"), lty=1,col=c("purple","red"),bty='n',cex=0.75)
