# Import necessary libraries
# tidyr - table manipulation library
library(tidyr)
library(ggplot2)
library(reshape2)

# Define variables

# Set working directory
setwd("C:/Users/Brittany/Dropbox/Thesis/Current WASP Files")

# Import desired csv file
# Use simple variables throughout to ease substitution of csv files

x <- read.csv("Dissolved_Oxygen.csv", sep = ",", header = FALSE, skip = 1)

# Transpose data, so rows are now columns
x <- t(x)

# Sets first row to column names
colnames(x) = x[1, ]
# Deletes first row
x = x[-1, ]

# Removes any 'NA' values
x <- na.omit(x)

# Create new data frame with data that will contain the segment numbers
y <- data.frame(1:166)
colnames(y) <- c('y')

# Bind the two columns together into one dataframe
z <- cbind(x, y)

# Plot with multiple lines
plot(z$y,z$'0.5', type="l",col="purple", lty=1, ylab = "Dissolved Oxygen", lwd = 2, xlab = "segments",xaxt="n")
lines(z$y,z$'5.5', type="l", col = "black", lty = 2, lwd = 1)
lines(z$y,z$'3', type = "l", col = "blue", lty=3, lwd=1)
legend('topright', legend=c("0.5","5.5", "3"), lty=1, col=c('purple', 'black', 'blue'), bty='n', cex=.75)
axis(1, at = NULL, labels = TRUE, tick = TRUE)


# testing out possible use of gg plot to plot all columns of data frame
df <- melt(z, id.vars = 'y', variable.name = 'series')

ggplot(df=melted, aes(time,value)) + geom_line(aes(colour = series))

