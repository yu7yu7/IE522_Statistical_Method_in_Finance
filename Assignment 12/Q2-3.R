#Q2-3
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

#Get January 2003
D2002 = r[length(r)]
J2003 = D2002 + Y_hat
J2003

#The other way to get forecast: 
#Directly get the forecast from r instead of dr
fit1 = auto.arima(r)
forecast(fit1, 1, level = 90)
