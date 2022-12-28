#Q1-8
#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 06/ZMTSLA.csv")
m = nrow(ZMTSLA)
logrt_ZM = log(ZMTSLA$ZM[2:m]/ZMTSLA$ZM[1:m-1])
t = 1/252 

library(moments)

T_lap_mu = median(logrt_ZM)
T_lap_b = mean(abs(logrt_ZM - T_lap_mu))
theoretical = c(T_lap_mu, T_lap_b)
theoretical

loglikelihoodLaplace = sum(log(Laplace(logrt_ZM, theoretical))) 
loglikelihoodLaplace
