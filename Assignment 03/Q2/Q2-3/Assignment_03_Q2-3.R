#Q2-3
#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 03/Q2/ZMTSLA.csv")
m = nrow(ZMTSLA)
lrt_tsla = log(ZMTSLA$TSLA[2:m]/ZMTSLA$TSLA[1:m-1])

#Calculate the Confidence Interval
mu_lrt_tsla = mean(lrt_tsla)
alpha = 0.05
z = qnorm(1-alpha/2)
lb = mu_lrt_tsla - z*(sd_lrt_tsla/sqrt(m))
ub = mu_lrt_tsla + z*(sd_lrt_tsla/sqrt(m))
print(paste(lb, ub))
