#Q1-4
Z4 <- rnorm(40000, 0, 1)
Z14 <- rnorm(40000, 0, 1)
Z24 <- rho*Z14+sqrt(1-rho^2)*Z4

S1T4 <- S10*exp((r-q1-0.5*sigma_hat1^2)*Tm+sigma_hat1*sqrt(Tm)*Z14)
S2T4 <- S20*exp((r-q2-0.5*sigma_hat2^2)*Tm+sigma_hat2*sqrt(Tm)*Z24)

ST4 <- S1T4 + S2T4 - K
for (i in 1:length(ST4)){
  if (ST4[i] < 0){
    ST4[i] = 0
    if (i %% 100000 == 0){
      print(paste(i, ST4[i]))}
  }
}
ST4 <- exp(-r*Tm)*(ST4)
STmu4 = mean(ST4)
STsd4 = sd(ST4)
SE4 =STsd4/sqrt(40000)

lb4 = STmu4-zv*SE4
ub4 = STmu4+zv*SE4

lb4
ub4

