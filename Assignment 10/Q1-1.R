#Q1-1
#Data Preparation
library(AER)
data("USMacroG")
USMacroG=na.omit(USMacroG)
Macro=as.data.frame(apply(USMacroG,2,diff))
dim(Macro)

#Regression on all models
fit1_1 = lm(Macro$consumption ~ ., Macro)
summary(fit1_1)
