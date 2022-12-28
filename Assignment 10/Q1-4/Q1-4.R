#Q1-4
#Data Preparation
library(AER)
data("USMacroG")
USMacroG=na.omit(USMacroG)
Macro=as.data.frame(apply(USMacroG,2,diff))
dim(Macro)

#Best subset selection
library(leaps)
best_subsets_1_4 = regsubsets(Macro$consumption ~ ., Macro, nvmax = 11)
result1_4 = summary(best_subsets_1_4)
result1_4

#Best model via R2adj 
plot(result1_4$adjr2, xlab = "Number of regressors", ylab = "adj R2", type = 'b')
i = which.max(result1_4$adjr2)
points(i, result1_4$adjr2[i], col = 'blue', cex = 2, pch = 20)

#Get coefficient
coef(best_subsets_1_4, i)

