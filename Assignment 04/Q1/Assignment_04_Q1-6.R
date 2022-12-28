#Q1-6
Z6 <- rnorm(n, 0, 1)
Z16 <- rnorm(n, 0, 1)
Z26 <- rho*Z16+sqrt(1-rho^2)*Z6
c = 0

S1T6 <- S10*exp((r-q1-0.5*sigma_hat1^2)*Tm+sigma_hat1*sqrt(Tm)*Z16)
S2T6 <- S20*exp((r-q2-0.5*sigma_hat2^2)*Tm+sigma_hat2*sqrt(Tm)*Z26)

ST6 <- S1T6 + S2T6 - K
for (i in 1:length(ST6)){
  if (ST6[i] < 0){
    ST6[i] = 0
    if (i %% 100000 == 0){
      print(paste(i, ST6[i]))}
    }
}


ST6 <- exp(-r*Tm)*(ST6)
STmu6 = mean(ST6)
STsd6 = sd(ST6)
SE6 =STsd6/sqrt(n)

zv = qnorm(1-0.05/2)

lb6 = STmu6-zv*SE6
ub6 = STmu6+zv*SE6

lb6
ub6
STmu6
