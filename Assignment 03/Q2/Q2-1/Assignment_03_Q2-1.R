#Q2-1
#Data Preparation
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 03/Q2/ZMTSLA.csv")
m = nrow(ZMTSLA)
lrt_tsla = log(ZMTSLA$TSLA[2:m]/ZMTSLA$TSLA[1:m-1])

#Construct Q-Q Plot
qqnorm(lrt_tsla)
qqline(lrt_tsla)

#Not really normally distributed