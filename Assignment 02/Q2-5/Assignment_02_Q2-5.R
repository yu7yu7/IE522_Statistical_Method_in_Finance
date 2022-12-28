#Q2-5
#Data Preparation
library(ISLR)
n = nrow(Smarket)
Smarket[c(1:3, (n-2):n), ]
dates = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 02/ISLRSmarketDates.csv", header = TRUE)
sp = data.frame(dates, Smarket[-1])
n = nrow(sp)
sp[c(1:3, (n-2):n), ]

#Construct the boxplot.
boxplot(sp$Today)

#Find the minimal value
min(sp$Today)

#Find date that the minimal value occurs
sp$Date[which(sp$Today == min(sp$Today))]

#Due to the 911
