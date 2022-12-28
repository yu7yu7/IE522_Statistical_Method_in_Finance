#Q2-8
#Data Preparation
library(ISLR)
n = nrow(Smarket)
Smarket[c(1:3, (n-2):n), ]
dates = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 02/ISLRSmarketDates.csv", header = TRUE)
sp = data.frame(dates, Smarket[-1])
n = nrow(sp)
sp[c(1:3, (n-2):n), ]

#Test the characterisctic of Date, if not date charater, made up the date data. 
if (class(sp$Date) == "character"){
  d = as.Date(sp$Date, "%m/%d/%Y")
}

#Construct the time-series data frame 
library(xts)
sp_ts <- xts(sp[,2:8], order.by=d)

#Construct the time-series plot
plot(sp_ts$Volume)

#At the end of each year, there will be a drop on trading volume, due to the seasonal factor. 

