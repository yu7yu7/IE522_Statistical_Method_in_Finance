#Q2-5
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

#Get the gamma(0) after infinity periods
gamma = fit$sigma2 * (1 + (-0.6761)^2 + 2*0.4551*(-0.6761)) / (1 - 0.4551^2)
gamma
fit$sigma2
