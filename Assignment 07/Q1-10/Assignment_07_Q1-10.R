#Q1-10
#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 06/ZMTSLA.csv")
m = nrow(ZMTSLA)
logrt_ZM = log(ZMTSLA$ZM[2:m]/ZMTSLA$ZM[1:m-1])
t = 1/252 

library(moments)

hist(logrt_ZM, breaks = 30, prob = TRUE, ylim = c(0, 16))
thetaNIG = resultNIG$par
thetaBSM = resultBSM$par
thetaLaplace = resultLaplace$par

curve(NIG(x, thetaNIG), add = TRUE, col = "blue", lwd = 2, lty = 2)
curve(BSM(x, thetaBSM), add = TRUE, col = "red", lwd = 2, lty = 1)
curve(Laplace(x, thetaLaplace), add = TRUE, col = "black", lwd = 2, lty = 1)

