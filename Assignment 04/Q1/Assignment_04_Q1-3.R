#Q1-3
#Data Preparation
S10 = 100
S20 = 150
sigma_hat1 = 0.5
sigma_hat2 = 0.4
q1 = 0
q2 = 0.03
rho = 0.1
r = 0.01
K = 250
Tm = 1

#RVs Generation 
Z3 <- rnorm(10000, 0, 1)
Z13 <- rnorm(10000, 0, 1)
Z23 <- rho*Z13+sqrt(1-rho^2)*Z3 

S1T3 <- S10*exp((r-q1-0.5*sigma_hat1^2)*Tm+sigma_hat1*sqrt(Tm)*Z13)
S2T3 <- S20*exp((r-q2-0.5*sigma_hat2^2)*Tm+sigma_hat2*sqrt(Tm)*Z23)

#Monte-Carlo Simulation
ST3 <- exp(-r*Tm)*(S1T3 + S2T3 - K)
for (i in 1:length(ST3)){
  if (ST3[i] <= 0){
    ST3[i] = 0
  }
  if (i %% 100 == 1){
    print(paste(i, ST3[i]))
    }
}
STmu3 = mean(ST3)
STsd3 = sd(ST3)
SE3 =STsd3/sqrt(10000)

zv = qnorm(1-0.05/2)
lb3 = STmu3-zv*SE3
ub3 = STmu3+zv*SE3

lb3
ub3
STsd3

ST3
