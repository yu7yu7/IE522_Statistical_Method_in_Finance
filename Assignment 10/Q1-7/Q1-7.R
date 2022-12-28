#Q1-7
#Data Preparation
library(AER)
data("USMacroG")
USMacroG=na.omit(USMacroG)
Macro=as.data.frame(apply(USMacroG,2,diff))
dim(Macro)

#Regress on gdp, invest, government, dpi, population, interest
fit1_7 = lm(Macro$consumption ~ Macro$gdp + Macro$invest + Macro$government 
            + Macro$dpi + Macro$population + Macro$interest)
summary(fit1_7)

#Plot Standardize model
plot(fit1_7$fitted.values, rstandard(fit1_7), xlab = "Fitted Value", ylab = 'Standardized Residual'
     , main = "Q1-7")
abline(fit1_7)

#Calculate the average of leverages
K = length(fit1_7$coefficients)
n = length(Macro$consumption)
avg_of_leverage = K/n
avg_of_leverage

#Find Outlier
plot(fit1_7$fitted.values, rstandard(fit1_7), xlab = "Fitted Value", ylab = 'Standardized Residual'
     , main = "Q1-7 with Outliers")
abline(fit1_7)
i = which(abs(rstandard(fit1_7)) > 3)
points(fit1_7$fitted.values[i], rstandard(fit1_7)[i], col = 'red', cex = 2, pch = 20)

#Find HLP
plot(fit1_7$fitted.values, rstandard(fit1_7), xlab = "Fitted Value", ylab = 'Standardized Residual'
     , main = "Q1-7 with HLP")
j = which(hatvalues(fit1_7) > 2*avg_of_leverage)
points(fit1_7$fitted.values[j], rstandard(fit1_7)[j], col = 'blue', cex = 2, pch = 20)

#Find Outliers & HLP
plot(fit1_7$fitted.values, rstandard(fit1_7), xlab = "Fitted Value", ylab = 'Standardized Residual'
     , main = "Q1-7 with Outliers and HLP")
k = which((hatvalues(fit1_7) > 2*avg_of_leverage) & (abs(rstandard(fit1_7)) > 3))
points(fit1_7$fitted.values[k], rstandard(fit1_7)[k], col = 'green', cex = 2, pch = 20)

for (i in 1:10){
  print(Macro$gdp[i])
}

