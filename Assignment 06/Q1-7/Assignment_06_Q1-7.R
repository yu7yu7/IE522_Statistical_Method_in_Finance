#Q1-7
#Data Preparation 
ZMTSLA = read.csv("/Users/yu-chingliao/Desktop/ZMTSLA.csv")
log_rtn_ZM = log(ZMTSLA$ZM[2:nrow(ZMTSLA)] / ZMTSLA$ZM[1:nrow(ZMTSLA)-1]) 
log_rtn_TSLA = log(ZMTSLA$TSLA[2:nrow(ZMTSLA)] / ZMTSLA$TSLA[1:nrow(ZMTSLA)-1]) 
mu_logrt_ZM = mean(log_rtn_ZM)
mu_logrt_TSLA = mean(log_rtn_TSLA)
D = log_rtn_ZM - log_rtn_TSLA

#Testing by Confidence Interval
muD = mean(D)
mu0 = 0
n = length(D)
alpha = 0.05
Zalpha = qnorm(1-alpha)
se = sd(D)/sqrt(n)
ub = muD + Zalpha * se

#Reject if mu0 "not in" CI. 
if (mu0 > ub){
  print("Reject H0")
}else {
  print("Not Reject H0")
}
