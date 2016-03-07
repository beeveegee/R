# Import necessary libraries
# tidyr - table manipulation library
library(tidyr)

# Set working directory
setwd("C:/Users/Brittany/Dropbox/Thesis/Current WASP Files")

# Import desired csv file
# Use simple variables throughout to ease substitution of csv files

x <- read.csv("Dissolved_Oxygen.csv", sep = ",", header = FALSE, skip = 1)

# Transpose data, so rows are now columns
x <- t(x)
colnames(x) <- c(0, 0.0001, 0.50, 1.00, 1.50, 2.00, 2.50, 3.00,3.50, 4.00, 4.50, 5.00, 5.50, 5.9995)
# colnames actually come out as 0, 1e-04, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 5.9995 

# Removes unnessary rows, may need to look into further if the data is transposed correctly
# look into different data set
x <- x[-c(1,168), ]

# Create new data frame with data that will contain the segment numbers
y <- array(1:166)

# Note that the command below does the exact same thing in fewer lines of code
# y <- data.frame(0:166)

# Convert array into dataframe
y <- as.data.frame(y)

# Bind the two columns together into one dataframe
z <- cbind(x, y)

# Basic plot script
plot(z$y,z$'0.5',type='o',col='purple',xlab='Segments',ylab="Dissolved Oxygen",main="Test Plot")
lines(z$y,z$'5.5',col='red')
legend("topright", legend=c("0.5","5.5"), lty=1,col=c("purple","red"),bty='n',cex=0.75)

# Plot with multiple lines
plot(z$y,z$'0.5', type="l",col="purple", lty=1, ylab = "Dissolved Oxygen", lwd = 2, xlab = "segments",xaxt="n")
lines(z$y,z$'5.5', type="l", col = "black", lty = 2, lwd = 1)
lines(z$y,z$'3', type = "l", col = "blue", lty=3, lwd=1)
legend('topright', legend=c("0.5","5.5", "3"), lty=1, col=c('purple', 'black', 'blue'), bty='n', cex=.75)
axis(1, at = NULL, labels = TRUE, tick = TRUE)

