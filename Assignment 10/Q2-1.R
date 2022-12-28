#Q2-1
#Data Preparation
library(ISLR)
x = Credit
x = data.frame(x)
x$Student <- as.character(x$Student)
for (i in 1: length(x$Student)){
  if (isTRUE(x$Student[i] == "No")==TRUE)
    x$Student[i] = 1
  else if (isTRUE(x$Student[i] == "Yes")==TRUE){
    x$Student[i] = 0
  }
}
x$Student <- as.numeric(x$Student)
x = subset(x, select = c(Balance, Income, Limit, Rating, Cards, Age, Student) )

#Regression 
fit2_1 = lm(x$Balance ~ ., x)
summary(fit2_1)

#Get coefficient
coef(fit2_1)
