#Q1-3

#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 06/ZMTSLA.csv")
m = nrow(ZMTSLA)
logrt_ZM = log(ZMTSLA$ZM[2:m]/ZMTSLA$ZM[1:m-1])
t = 1/252 

library(moments)

logrt_ZM_mu = mean(logrt_ZM)
logrt_ZM_Var = (sd(logrt_ZM))^2
logrt_ZM_Skew = skewness(logrt_ZM)
logrt_ZM_kurt = kurtosis(logrt_ZM)

print(paste(logrt_ZM_mu, logrt_ZM_Var, logrt_ZM_Skew, logrt_ZM_kurt))

