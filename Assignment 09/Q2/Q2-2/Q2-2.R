#Q2-2

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

#Scatter plot (consumption, gdp)
plot(Macro$gdp, Macro$consumption)

#Regression (consumption, gdp)
fit2_2 = lm(Macro$consumption ~ Macro$gdp)
summary(fit2_2)



        