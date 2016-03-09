# Import necessary libraries
library(ggplot2)
library(reshape2)

# Set working directory
setwd("C:/Users/Brittany/Dropbox/Thesis/Current WASP Files")

# Import desired csv file
# Use simple variables throughout to ease substitution of csv files

x <- read.csv("Dissolved_Oxygen.csv", sep = ",", header = FALSE, skip = 1)
df <- melt(x)
df$rowid <- x$V1

ggplot(df, aes(variable,value,group=factor(rowid))) + geom_point(aes(color=factor(rowid)))