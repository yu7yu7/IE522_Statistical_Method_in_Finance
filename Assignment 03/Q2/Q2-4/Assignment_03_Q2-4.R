#Q2-4
lrt_zm = log(ZMTSLA$ZM[2:m]/ZMTSLA$ZM[1:m-1])
D = lrt_tsla - lrt_zm
mu_D = mean(D)
sd_D = sd(d)
se_D = sd(D)/sqrt(m)
lb_D = mu_D - z*se_D
ub_D = mu_D + z*se_D
print(paste(lb_D, ub_D))
