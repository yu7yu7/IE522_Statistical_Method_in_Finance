#Q2-1
exp_data = read.csv("/Users/yu-chingliao/Desktop/exp.csv")
mle_lambda = 1/mean(exp_data$sample)
mle_theta = 1/mle_lambda

mle_lambda
mle_theta
 
