#Q2-6
#Data Preparation
library(quantmod)
getSymbols(Symbols = "^GSPC", from = "2000-01-01", to = "2022-11-12", auto_assign = TRUE)
return=dailyReturn(GSPC,type="log")
head(return)
tail(return)
alpha = 0.05

#Get GARCH model
smallest_p = 0
smallest_q = 0
smallest_i = 0
smallest_j = 0
smallest_AIC = 0
for (i in 0:2){
  for (j in 0:2){
    for (p in 1:2){
      for (q in 0:2){
        Formula<-function(i, j, p, q) as.formula(paste('~arma(',i,',',j,')+garch(',p,',',q,')'))
        fit = garchFit(formula = Formula(i, j, p, q), data = return, cond.dist = "norm", trace = FALSE)
        AIC = fit@fit$ics[1]*nrow(return)
        if (smallest_AIC > AIC){
          smallest_AIC = AIC
          smallest_p = p
          smallest_q = q
          smallest_i = i
          smallest_j = j
        }
      }
    }
  }
}

Formula6<-function(i, j, p, q) as.formula(paste('~arma(',i,',',j,')+garch(',p,',',q,')'))
fit6 = garchFit(formula = Formula6(smallest_i, smallest_j, smallest_p, smallest_q), data = return, cond.dist = "norm", trace = FALSE)
print(fit6)

#Get residual
res6 = residuals(fit6, standardize = T)
qqnorm(res6)
qqline(res6)
