#Q1-5
range <- 1:1000
for (i in range){
  print(i)
  SE = STsd/sqrt(10000*(4^i))
  if (SE < 0.01){
    print(paste(10000*(4^i), SE))
    break
  }
}
n = 40960000
n
