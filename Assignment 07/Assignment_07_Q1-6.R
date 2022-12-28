#Q1-6
#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 06/ZMTSLA.csv")
m = nrow(ZMTSLA)
logrt_ZM = log(ZMTSLA$ZM[2:m]/ZMTSLA$ZM[1:m-1])
t = 1/252 

library(moments)

#NIG Model_fitting
initialvalueNIG_star = MMestimates
NIG_star = function(x, theta){theta[1]*theta[3]*t/pi*besselK(theta[1]*sqrt(theta[3]^2*t^2+(x-theta[4]*t)^2), 1)/(sqrt(theta[3]^2*t^2+(x-theta[4]*t)^2))*exp(theta[3]*sqrt(theta[1]^2-theta[2]^2)*t+theta[2]*(x-theta[4]*t))}
resultNIG_star = optim(initialvalueNIG_star, fn=function(theta){-sum(log(NIG_star(logrt_ZM, theta)))}, method = "L-BFGS-B")
resultNIG_star
