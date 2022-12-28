#Q3-1
ZMTSLA = read.csv("/Users/yu-chingliao/Library/CloudStorage/GoogleDrive-josephliao0127@gmail.com/My Drive/Note/UIUC/Fall_2022/Statistical Methods in Finance/Assignment 05/Q3/ZMTSLA.csv", header = TRUE)
log_rtn_ZM = log(ZMTSLA$ZM[2:nrow(ZMTSLA)] / ZMTSLA$ZM[1:nrow(ZMTSLA)-1]) 


Fhat = ecdf(log_rtn_ZM)
plot(Fhat, verticals = TRUE, do.points = FALSE)

