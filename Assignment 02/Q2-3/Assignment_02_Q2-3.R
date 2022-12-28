#Q2-3
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

#Add Laplace Fit onto Histogram
library(VGAM)
sp_mean = mean(sp$Today, na.rm = TRUE);
sp_b = sqrt((n-1)/(2*n))*sd(sp$Today, na.rm = TRUE);
curve(dlaplace(x, sp_mean, sp_b), add = TRUE, col = "blue", lwd = 5)

#Fitting much better than Normal but still shitty 
