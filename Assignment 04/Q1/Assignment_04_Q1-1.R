#Q1-1
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

#Moment Matching and Generate the mu and sigma.
mu1 = log(S10) + (r-q1-0.5*sigma_hat1^2)*Tm
mu2 = log(S20) + (r-q2-0.5*sigma_hat2^2)*Tm
sigma1 = sigma_hat1*sqrt(Tm)
sigma2 = sigma_hat2*sqrt(Tm)

a = exp(mu1 + 0.5*sigma1^2) + exp(mu2 + 0.5*sigma2^2)
b = exp(2*mu1 + 2*sigma1^2) + exp(2*mu2 + 2*sigma2^2) +2*exp(mu1 + mu2 + 0.5*(sigma1^2+sigma2^2+2*rho*sigma1*sigma2))

mu = log(a^2/sqrt(b))
sigma = sqrt(log(b/a^2))

                                                            、                                                              
                                                            
