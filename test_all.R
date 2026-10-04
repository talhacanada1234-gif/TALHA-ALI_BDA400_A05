# BDA400 Assignment 5 - Verification Script
source("sma.R")
source("ema.R")
source("macd.R")
source("stdev.R")
source("linreg.R")
source("rsi.R")
source("stoch_rsi.R")
source("crossover.R")
source("crossunder.R")

cat("SMA test:\n")
print(sma(c(10,12,15,20,18,22,25,24,21), 3))

cat("EMA test:\n")
print(ema(c(10,12,15,20,18,22,25,24,21), 3))

cat("MACD test:\n")
print(macd(c(100,105,110,115,120,125,130), 3, 5, 2))

cat("Standard deviation test:\n")
print(stdev(c(10,12,15,20,18,22,25,24,21)))

cat("Linear regression test:\n")
print(linreg(c(10,12,15,20,18,22,25,24,21), 5, 0))

cat("RSI test:\n")
print(rsi(c(45,50,48,55,52,49,58,60,65,62), 5))

cat("StochRSI test:\n")
print(stoch_rsi(c(45,50,48,55,52,49,58,60,65,62,64,61,66,68,70,67,72,69,73,71), 5, 3, 3))

arr1 <- c(10,12,15,20,18,22,25,24,21)
arr2 <- c(18,20,22,18,15,12,10,11,13)

cat("Crossover test:\n")
print(crossover(arr1, arr2))

cat("Crossunder test:\n")
print(crossunder(arr1, arr2))

cat("\nAll functions loaded and test calls completed.\n")
