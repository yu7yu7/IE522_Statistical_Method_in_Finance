#Q1-3
#Data Preparation 
ZMTSLA = read.csv("/Users/yu-chingliao/Desktop/ZMTSLA.csv")
log_rtn_ZM = log(ZMTSLA$ZM[2:nrow(ZMTSLA)] / ZMTSLA$ZM[1:nrow(ZMTSLA)-1]) 
log_rtn_TSLA = log(ZMTSLA$TSLA[2:nrow(ZMTSLA)] / ZMTSLA$TSLA[1:nrow(ZMTSLA)-1]) 
mu_logrt_ZM = mean(log_rtn_ZM)
mu_logrt_TSLA = mean(log_rtn_TSLA)
D = log_rtn_ZM - log_rtn_TSLA

#Plotting for normality
qqnorm (log_rtn_ZM)
qqline(log_rtn_ZM)
