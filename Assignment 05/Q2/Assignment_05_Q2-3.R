#Q2-3
alpha = 0.05
Z.95 = qnorm(1-alpha/2)

lower_b = mle_lambda - Z.95 * est_se
upper_b = mle_lambda + Z.95 * est_se

lower_b
upper_b
