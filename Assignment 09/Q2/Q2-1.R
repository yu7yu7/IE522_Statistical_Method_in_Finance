#Q2-1

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

#Regression for USMacroG
summary(lm(USMacroG[, "consumption"] ~ USMacroG[, "cpi"]))

#Regression for Macro
summary(lm(Macro$consumption ~ Macro$cpi))

