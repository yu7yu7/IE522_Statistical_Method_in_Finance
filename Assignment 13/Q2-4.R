#Q2-4
#Data Preparation
library(quantmod)
getSymbols(Symbols = "^GSPC", from = "2000-01-01", to = "2022-11-12", auto_assign = TRUE)
return=dailyReturn(GSPC,type="log")
head(return)
tail(return)
alpha = 0.05

#find the best arima
find_the_best_ARMA <- function(x){
  smallest_p = 0
  smallest_q = 0
  smallest_AIC = 0
  print("Find the best ARMA Model:")

  for (p in 0:3){
    for (q in 0:3){
      fit = arima(x, order = c(p, 0, q))
      print(paste("p =", p, ", ", "q =", q, ", ", "AIC =", AIC(fit)))
      if (smallest_AIC > AIC(fit)){
        smallest_AIC = AIC(fit)
        smallest_p = p
        smallest_q = q
      }
    }
  }
  print("---------------------------------------------------------------------------------")
  print("The best fit is the one with the minimal AIC value:")
  print(paste("The best ARMA model is ARMA(", smallest_p, ",", smallest_q,") Model, AIC = ", smallest_AIC))
  fit4 = arima(x, order = c(smallest_p,0,smallest_q))
  print(fit4)
  print("---------------------------------------------------------------------------------")
}
find_the_best_ARMA(return)





      