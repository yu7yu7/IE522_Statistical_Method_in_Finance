#Q1-7
#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 06/ZMTSLA.csv")
m = nrow(ZMTSLA)
logrt_ZM = log(ZMTSLA$ZM[2:m]/ZMTSLA$ZM[1:m-1])
t = 1/252 

library(moments)

#Moment Matching to generate the initial solution. 
lap_mu = mean(logrt_ZM)
lap_b = sqrt((m-1)/(2*m))*sd(logrt_ZM)


#Laplace Model_fitting
initialvalueLaplace = c(lap_mu, lap_b)
Laplace = function(x, theta){exp(-abs(x-theta[1])/theta[2])/(2*theta[2])}
resultLaplace = optim(initialvalueLaplace, fn=function(theta){-sum(log(Laplace(logrt_ZM, theta)))}, method = "BFGS")
resultLaplace
