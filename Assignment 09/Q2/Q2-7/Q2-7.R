#Q2-7
#Data Preparation
library(AER)
data("USMacroG")
dim(USMacroG)
USMacroG=na.omit(USMacroG)
dim(USMacroG)
Macro=as.data.frame(apply(USMacroG,2,diff))
dim(Macro)
sum(is.na(USMacroG))
sum(is.na(Macro))

#Regression
fit2_7 =lm(Macro$consumption ~ Macro$m1)
summary(fit2_7)

#Regression 2nd order 
fit2_7.2 =lm(Macro$consumption ~ Macro$m1 + I(Macro$m1^2))
summary(fit2_7.2)

#Plotting
plot(Macro$m1, Macro$consumption)
lines(Macro$m1, fit2_7$fitted.values, lwd=3, col = 'blue')
lines(sort(Macro$m1), fit2_7.2$fitted.values[order(Macro$m1)], lwd = 3, col = "red")
