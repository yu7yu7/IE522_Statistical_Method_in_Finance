#Q1-4
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


match_alpha = (3*sqrt(3*logrt_ZM_kurt-9-4*logrt_ZM_Skew^2))/(sqrt(logrt_ZM_Var)*(3*logrt_ZM_kurt-9-5*logrt_ZM_Skew^2))
match_beta = (3*logrt_ZM_Skew)/(sqrt(logrt_ZM_Var)*(3*logrt_ZM_kurt-9-5*logrt_ZM_Skew^2))                                                           
match_gamma = sqrt(match_alpha^2 - match_beta^2)
match_delta = 9/((3*logrt_ZM_kurt-9-4*logrt_ZM_Skew^2)*match_gamma*t)
match_mu = (logrt_ZM_mu*match_gamma-match_beta*match_delta*t)/(match_gamma*t)

MMestimates = c(match_alpha, match_beta, match_delta, match_mu)

print(MMestimates)
     
