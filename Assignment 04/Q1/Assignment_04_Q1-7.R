#Q1-7
Z7 <- rnorm(n, 0, 1)
Z17 <- rnorm(n, 0, 1)
Z27 <- rho*Z17+sqrt(1-rho^2)*Z7

S1T7 <- S10*exp((r-q1-0.5*sigma_hat1^2)*Tm+sigma_hat1*sqrt(Tm)*Z17)
S2T7 <- S20*exp((r-q2-0.5*sigma_hat2^2)*Tm+sigma_hat2*sqrt(Tm)*Z27)

ST7 <- K- S1T7 - S2T7
for (i in 1:length(ST7)){
  if (ST7[i] < 0){
    ST7[i] = 0
    if (i %% 100000 == 0){
      print(paste(i, ST7[i]))}
  }
}


ST7 <- exp(-r*Tm)*(ST7)
STmu7 = mean(ST7)
STsd7 = sd(ST7)
SE7 =STsd7/sqrt(n)

lb7 = STmu7-zv*SE7
ub7 = STmu7+zv*SE7

lb7
ub7
