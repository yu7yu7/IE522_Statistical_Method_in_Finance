#Q2-4
#Data Preparation
library(Ecdat)
data(Capm)
r = Capm$rf
dr = diff(r)

#Fit ARIMA model
library(forecast)
fit = auto.arima(dr)
fit

#Get December 2002 to January 2003 monthly change
forecast(fit, 1, level = 90)
Y_hat = 0.005465171

#Get Prediction Interval for monthly change
alpha = 0.1
f = forecast(fit, 1, level = 90)
f
#Get Prediction Interval for January 2003
D2002 = r[length(r)]
J2003ub = D2002 + f$upper
J2003lb = D2002 + f$lower
print(paste(J2003lb, J2003ub))

