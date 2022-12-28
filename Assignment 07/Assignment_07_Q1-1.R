#Q1-1
#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 06/ZMTSLA.csv")
m = nrow(ZMTSLA)
logrt_ZM = log(ZMTSLA$ZM[2:m]/ZMTSLA$ZM[1:m-1])
t = 1/252 

#BSM Model_fitting
BSM_mu = mean(logrt_ZM)/t
BSM_sigma = sqrt((m-1)/m)*sd(logrt_ZM)/sqrt(t)
logliklihoodBSM = -m*log(2*pi*BSM_sigma^2*t)/2-(m-1)*sd(logrt_ZM)^2/(2*BSM_sigma^2*t) 

BSM_mu
BSM_sigma
logliklihoodBSM

#BSM Model_Optimize
initialvalueBSM = c(BSM_mu, BSM_sigma);
BSM = function(x, theta){exp(-(x-theta[1]*t)^2/(2*theta[2]^2*t))/sqrt(2*pi*theta[2]^2*t)}
resultBSM = optim(initialvalueBSM, fn=function(theta){-sum(log(BSM(logrt_ZM, theta)))}, method = "L-BFGS-B")
resultBSM


