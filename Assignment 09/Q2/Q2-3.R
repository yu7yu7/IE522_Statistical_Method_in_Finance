#Q2-3

#Data Preparation
library(AER)
data("USMacroG")
dim(USMacroG)
USMacroG=na.omit(USMacroG)
dim(USMacroG)
Macro=as.data.frame(apply(USMacroG,2,diff))
dim(Macro)
sum(is.na(USMacroG))
sum(is.na(Macro))


#Regression (consumption, gdp)
fit2_3 = lm(Macro$consumption ~ Macro$gdp)
summary(fit2_3)

#99% CI of Beta_gdp
Beta_gdp_hat = 0.39623
print(paste(Beta_gdp_hat - qt(p = 0.995, df = 200) * 0.03038 , Beta_gdp_hat + qt(p = 0.995, df = 200) * 0.03038))

