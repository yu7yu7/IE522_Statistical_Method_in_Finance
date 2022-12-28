#Q1-6
#Data Preparation 
ZMTSLA = read.csv("/Users/yu-chingliao/Desktop/ZMTSLA.csv")
log_rtn_ZM = log(ZMTSLA$ZM[2:nrow(ZMTSLA)] / ZMTSLA$ZM[1:nrow(ZMTSLA)-1]) 
log_rtn_TSLA = log(ZMTSLA$TSLA[2:nrow(ZMTSLA)] / ZMTSLA$TSLA[1:nrow(ZMTSLA)-1]) 
mu_logrt_ZM = mean(log_rtn_ZM)
mu_logrt_TSLA = mean(log_rtn_TSLA)
D = log_rtn_ZM - log_rtn_TSLA

#Calculate the minimal D_bar that can reject H0.
muD = mean(D)
mu0 = 0
n = length(D)
alpha = 0.05
Zalpha = qnorm(1-alpha)
Z0 = (muD - mu0)/se
se = sd(D)/sqrt(n)
D_star = mu0 - Zalpha*se
D_star

#Testing by Testing Statistics
#Reject if Z0 < -Za
if (Z0 < -Zalpha){
  print("Reject H0")
}else {
  print("Not Reject H0")
}
muD
Z0
-Zalpha

