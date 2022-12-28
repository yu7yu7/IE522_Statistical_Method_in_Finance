#Q2-5
#Data Preparation
library(quantmod)
getSymbols(Symbols = "^GSPC", from = "2000-01-01", to = "2022-11-12", auto_assign = TRUE)
return=dailyReturn(GSPC,type="log")
head(return)
tail(return)
alpha = 0.05

#GARCH fit
library(fGarch)
find_the_best_GARCH <- function(x){
  smallest_p = 0
  smallest_q = 0
  smallest_i = 0
  smallest_j = 0
  smallest_AIC = 0
  print("Find the best GARCH Model:")
  for (i in 0:2){
    for (j in 0:2){
      for (p in 1:2){
        for (q in 0:2){
          Formula<-function(i, j, p, q) as.formula(paste('~arma(',i,',',j,')+garch(',p,',',q,')'))
          fit = garchFit(formula = Formula(i, j, p, q), data = x, cond.dist = "norm", trace = FALSE)
          AIC = fit@fit$ics[1]*nrow(return)
          print(paste("i, j, p, q =", i,",", j,",", p,",", q, ", AIC =", AIC))
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
  
  print("---------------------------------------------------------------------------------")
  print("The best fit is the one with the minimal AIC value:")
  print(paste("The best GARCH model is ARMA(", smallest_i, ",", smallest_j,")| GARCH(",smallest_p, ",", smallest_q,") Model, AIC = ", smallest_AIC))
  Formula5<-function(i, j, p, q) as.formula(paste('~arma(',i,',',j,')+garch(',p,',',q,')'))
  fit5 = garchFit(formula = Formula5(smallest_i, smallest_j, smallest_p, smallest_q), data = return, cond.dist = "norm", trace = FALSE)
  print(fit5)
  print("---------------------------------------------------------------------------------")
}  
find_the_best_GARCH(return)
