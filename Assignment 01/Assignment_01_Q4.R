t = read.csv("/Users/yu-chingliao/Desktop/TSLA.csv")
n = nrow(t)
lrt = c(log(t$Adj.Close[2:n]/t$Adj.Close[1:n-1]), 0 )
lrt_delay = c(lrt[2:n], 0)
t = data.frame(t, lrt, lrt_delay)
mu = mean(t$lrt)
std = sd(t$lrt)
corr = cor(t$lrt, t$lrt_delay)
corr2 = cor(t$Adj.Close, t$Volume)

library(moments)
skew = skewness(t$lrt)
kurt = kurtosis(t$lrt)

print(paste(mu, std, corr, corr2, skew, kurt))

