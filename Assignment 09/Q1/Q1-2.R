#Q1-2

#Data Preparation
set.seed(1)
t=seq(1,100,by=1) #time
X  =10+t+rnorm(100)
Y1 =20+2*t+rnorm(100)
Y2 =20+2*t+5*X+rnorm(100)
data = data.frame(X,Y1,Y2)
ddata=data.frame(apply(data,2,diff))

#Regression
summary(lm(ddata$Y1 ~ ddata$X))
summary(lm(ddata$Y2 ~ ddata$X))
