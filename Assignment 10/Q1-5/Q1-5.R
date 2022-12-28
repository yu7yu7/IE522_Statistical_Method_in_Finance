#Q1-5
#Data Preparation
library(AER)

data("USMacroG")
USMacroG=na.omit(USMacroG)
Macro=as.data.frame(apply(USMacroG,2,diff))
dim(Macro)

#Regress on gdp, invest, government, dpi, population, interest
fit1_5 = lm(Macro$consumption ~ Macro$gdp + Macro$invest + Macro$government 
            + Macro$dpi + Macro$population + Macro$interest)
summary(fit1_5)
plot(fit1_5$fitted.values, fit1_5$residuals, xlab = "Fitted Values", ylab 
     = "Residuals")
abline(mean(fit1_5$residuals),mean(fit1_5$residuals),  col = "red")
abline(sd(fit1_5$residuals),0,  col = "red")
abline(-sd(fit1_5$residuals),0,  col = "red")
mean(fit1_5$residuals)
sd(fit1_5$residuals)
