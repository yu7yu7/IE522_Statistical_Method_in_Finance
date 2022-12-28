#Q2-5
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

#Prediction modelling
n = dim(Macro)[1]
Y = Macro$consumption[1: n-1]
X = Macro$gdp[1:n-1]
fit2_5 = lm(Y ~ X)
new_data = data.frame(X = Macro$gdp[n])
new_data

#Generate Prediction of Y_star = Y_hat_star
prediction = predict(fit2_5, new_data, interval = "predict", level = 0.95)
prediction
Y_star = Macro$consumption[n]  

#Calculate prediction error 
prediction_error = Y_star - prediction["1", "fit"]
prediction_error
percentage_pe = prediction_error/Y_star
percentage_pe
