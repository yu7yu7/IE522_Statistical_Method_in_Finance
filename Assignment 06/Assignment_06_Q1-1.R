#Q1-1

#Data Preparation 
ZMTSLA = read.csv("/Users/yu-chingliao/Desktop/ZMTSLA.csv")
log_rtn_ZM = log(ZMTSLA$ZM[2:nrow(ZMTSLA)] / ZMTSLA$ZM[1:nrow(ZMTSLA)-1]) 
log_rtn_TSLA = log(ZMTSLA$TSLA[2:nrow(ZMTSLA)] / ZMTSLA$TSLA[1:nrow(ZMTSLA)-1]) 
mu_logrt_ZM = mean(log_rtn_ZM)
mu_logrt_TSLA = mean(log_rtn_TSLA)
D = log_rtn_ZM - log_rtn_TSLA

#Run Test for testing randomness of log_rtn_ZM
alpha = 0.05
install.packages("randtests")
library(randtests)
runs.test(log_rtn_ZM, alternative = "two.sided", threshold = median(log_rtn_ZM), pvalue = "normal", plot = FALSE)


#Run Test for testing randomness of D
runs.test(D, alternative = "two.sided", threshold = median(D), pvalue = "normal", plot = FALSE)
