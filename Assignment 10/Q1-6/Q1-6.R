#Q1-6
#Data Preparation
library(AER)
data("USMacroG")
USMacroG=na.omit(USMacroG)
Macro=as.data.frame(apply(USMacroG,2,diff))
dim(Macro)

#Regress on gdp, invest, government, dpi, population, interest
fit1_6 = lm(Macro$consumption ~ Macro$gdp + Macro$invest + Macro$government 
            + Macro$dpi + Macro$population + Macro$interest)
summary(fit1_6)

#Plot ACF 
acf(fit1_6$residuals)

#Test via arima
library(forecast)
auto.arima(fit1_6$residuals)
