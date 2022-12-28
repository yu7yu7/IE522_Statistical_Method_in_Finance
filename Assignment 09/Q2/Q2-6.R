#Q2-6
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
fit2_6 = lm(Macro$consumption ~ Macro$tbill + Macro$inflation + Macro$cpi)
summary(fit2_6)
