#Q2-7
#Data Preparation
library(quantmod)
getSymbols(Symbols = "^GSPC", from = "2000-01-01", to = "2022-11-12", auto_assign = TRUE)
return=dailyReturn(GSPC,type="log")
head(return)
tail(return)
alpha = 0.05

#Get sged model 
Formula7<-function(i, j, p, q) as.formula(paste('~arma(',i,',',j,')+garch(',p,',',q,')'))
fit7 = garchFit(formula = Formula7(smallest_i, smallest_j, smallest_p, smallest_q), data = return, cond.dist = "sged", trace = FALSE)
AIC7 = fit7@fit$ics[1]*nrow(return)
print(AIC7)

#QQPlot
res7 = residuals(fit7, standardize = T)
qqplot(res7,rsged(10000,nu=1.369,xi=0.8561))
qqline(res7)
