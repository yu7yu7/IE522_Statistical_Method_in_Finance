#Q2-2
#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 03/Q2/ZMTSLA.csv")
m = nrow(ZMTSLA)
lrt_tsla = log(ZMTSLA$TSLA[2:m]/ZMTSLA$TSLA[1:m-1])

#Calculate the Standard Deviation and Volatility
sd_lrt_tsla = sd(lrt_tsla)
vol = sqrt(252)*sd_lrt_tsla
vol
