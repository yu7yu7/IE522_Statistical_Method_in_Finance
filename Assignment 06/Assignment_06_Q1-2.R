#Q1-2
#Data Preparation 
ZMTSLA = read.csv("/Users/yu-chingliao/Desktop/ZMTSLA.csv")
log_rtn_ZM = log(ZMTSLA$ZM[2:nrow(ZMTSLA)] / ZMTSLA$ZM[1:nrow(ZMTSLA)-1]) 
log_rtn_TSLA = log(ZMTSLA$TSLA[2:nrow(ZMTSLA)] / ZMTSLA$TSLA[1:nrow(ZMTSLA)-1]) 
mu_logrt_ZM = mean(log_rtn_ZM)
mu_logrt_TSLA = mean(log_rtn_TSLA)
D = log_rtn_ZM - log_rtn_TSLA

#Testing the Normality of log return of ZM by Shapiro-Wilk normality test
library(moments)
shapiro.test(log_rtn_ZM)

#Testing the Normality of log return of ZM by Jarque-Bera normality test
jarque.test(log_rtn_ZM)
