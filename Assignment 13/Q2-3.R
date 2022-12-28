#Q2-3
#Data Preparation
library(quantmod)
getSymbols(Symbols = "^GSPC", from = "2000-01-01", to = "2022-11-12", auto_assign = TRUE)
return=dailyReturn(GSPC,type="log")
head(return)
tail(return)
alpha = 0.05

#Augmented Dickey-Fuller Test
library(tseries)
adf.test(return)
