#Q1-2
#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 06/ZMTSLA.csv")
m = nrow(ZMTSLA)
logrt_ZM = log(ZMTSLA$ZM[2:m]/ZMTSLA$ZM[1:m-1])
t = 1/252 

#NIG Model_fitting
initialvalueNIG = c(10,0,2,0)
NIG = function(x, theta){theta[1]*theta[3]*t/pi*besselK(theta[1]*sqrt(theta[3]^2*t^2+(x-theta[4]*t)^2), 1)/(sqrt(theta[3]^2*t^2+(x-theta[4]*t)^2))*exp(theta[3]*sqrt(theta[1]^2-theta[2]^2)*t+theta[2]*(x-theta[4]*t))}
resultNIG = optim(initialvalueNIG, fn=function(theta){-sum(log(NIG(logrt_ZM, theta)))}, method = "L-BFGS-B")
resultNIG

NIGalpha = resultNIG$par[1]
NIGbeta = resultNIG$par[2]
NIGdelta = resultNIG$par[3]
NIGmu = resultNIG$par[4]
logliklihoodNIG = -(resultNIG$value)

print(paste(NIGalpha, NIGbeta, NIGdelta, NIGmu, logliklihoodNIG))
