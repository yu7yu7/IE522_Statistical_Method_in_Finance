#Q3-6
qu = quantile(sampling_the_kurtosis, probs = 0.975)
ql = quantile(sampling_the_kurtosis, probs = 0.025)

upper_b = 2*sample_kurtosis - qu
lower_b = 2*sample_kurtosis - ql

print(paste(upper_b, lower_b))
