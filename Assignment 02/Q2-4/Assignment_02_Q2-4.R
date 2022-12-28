#Q2-4
#Data Preparation
library(ISLR)
n = nrow(Smarket)
Smarket[c(1:3, (n-2):n), ]
dates = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 02/ISLRSmarketDates.csv", header = TRUE)
sp = data.frame(dates, Smarket[-1])
n = nrow(sp)
sp[c(1:3, (n-2):n), ]

#Contruct the histogram 
hist(sp$Today, prob = TRUE, breaks = 50, ylim = c(0, 0.6))

#Add KDE onto Histogram
lines(density(sp$Today, na.rm = TRUE), col = "red", lwd = 5)
lines(density(sp$Today, na.rm = TRUE, adjust = 0.25), col = "blue", lwd = 3)
lines(density(sp$Today, na.rm = TRUE, adjust = 4), col = "black", lwd = 3)


#I think the one with the smaller bandwidth fits the data best but who cares? UGH. 
