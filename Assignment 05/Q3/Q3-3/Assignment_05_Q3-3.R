#Q3-3
B = 5000
n = length(log_rtn_ZM)
sampling_the_kurtosis = rep(0, B)

for (b in 1:B){
  xstar = sample(log_rtn_ZM, n, replace = TRUE)
  sampling_the_kurtosis[b] = kurtosis(xstar)
}

hist(sampling_the_kurtosis)



