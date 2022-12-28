#Q1-9
#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 06/ZMTSLA.csv")
m = nrow(ZMTSLA)
logrt_ZM = log(ZMTSLA$ZM[2:m]/ZMTSLA$ZM[1:m-1])
t = 1/252 

library(moments)

AIC_BSM = -2*(-resultBSM$value-2)
AIC_NIG = -2*(-resultNIG$value-4)
AIC_Laplce= -2*(-resultLaplace$value-2)

print(paste(AIC_BSM, AIC_NIG, AIC_Laplce))

