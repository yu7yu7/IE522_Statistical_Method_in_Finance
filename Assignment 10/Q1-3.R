#Q1-3
#Data Preparation
library(AER)
data("USMacroG")
USMacroG=na.omit(USMacroG)
Macro=as.data.frame(apply(USMacroG,2,diff))
dim(Macro)

#Best subset selection
library(leaps)
best_subsets_1_3 = regsubsets(Macro$consumption ~ ., Macro, nvmax = 11)
result1_3 = summary(best_subsets_1_3)
result1_3
