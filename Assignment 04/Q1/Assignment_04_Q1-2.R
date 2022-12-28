#Q1-2
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

#Generate the Option Price
St = exp(mu+0.5*sigma^2)
z1 = (mu+sigma^2-log(K))/sigma
z2 = (mu-log(K))/sigma
E = St * pnorm(z1)-K*pnorm(z2)
C = exp(-r*Tm) * E
