#Q2-2
#Data Preparation
library(quantmod)
getSymbols(Symbols = "^GSPC", from = "2000-01-01", to = "2022-11-12", auto_assign = TRUE)
return=dailyReturn(GSPC,type="log")
head(return)
tail(return)
alpha = 0.05

#Run test
library(randtests)
x <- as.vector(return[,"daily.returns"])
runs.test(x,alternative = "two.sided", threshold = median(x), pvalue = "normal", plot = FALSE)

#Ljung-Box test
Box.test(return,lag=10,type="Ljung-Box")
