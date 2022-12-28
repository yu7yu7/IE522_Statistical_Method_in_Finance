#Q2-4

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
fit2_4 = lm(Macro$consumption ~ Macro$gdp)
summary(fit2_4)

#Defination
anova(fit2_4)
57139/(57139+67185)
