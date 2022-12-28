#Q1-2
#Data Preparation
library(AER)
data("USMacroG")
USMacroG=na.omit(USMacroG)
Macro=as.data.frame(apply(USMacroG,2,diff))
dim(Macro)

#Best subset selection
library(leaps)
best_subsets_1_2 = regsubsets(Macro$consumption ~ ., Macro, nvmax = 11)
result1_2 = summary(best_subsets_1_2)
result1_2

#Best model via Cp 
plot(result1_2$cp, xlab = "Number of Regressors", ylab = "Cp", type = "b")
j = which.min(result1_2$cp)
points(j, result1_2$cp[j], col = "red", cex = 2, pch = 20)

#Get coefficient
coef(best_subsets_1_2, j)

