#Q2-9
#Data Preparation
library(ISLR)
n = nrow(Smarket)
Smarket[c(1:3, (n-2):n), ]
dates = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 02/ISLRSmarketDates.csv", header = TRUE)
sp = data.frame(dates, Smarket[-1])
n = nrow(sp)
sp[c(1:3, (n-2):n), ]
sp_mean = mean(sp$Today, na.rm = TRUE);
sp_std = sd(sp$Today, na.rm = TRUE);

#Construct QQ plot
par(mfrow = c(1,2))
qqnorm(sp$Today, ylab = "Sample Quantile sp$Today", xlim = c(-5, 5))
qqline(sp$Today)

qqplot(rlaplace(1000), sp$Today, ylab = "Sample Quantile sp$Today", xlim = c(-5, 5), main = "Laplace Q-Q Plot", xlab = "Theoretical Quantiles")
qqline(sp$Today)

