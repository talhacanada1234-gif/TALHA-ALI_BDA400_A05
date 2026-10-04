# BDA400 Assignment 5 - Moving Average Convergence Divergence (MACD)
ema <- function(data, period) {
  if (length(data) == 0) stop("data must not be empty")
  if (period <= 0 || period != as.integer(period)) stop("period must be a positive integer")
  multiplier <- 2 / (period + 1)
  ema_values <- numeric(length(data))
  ema_values[1] <- data[1]
  if (length(data) >= 2) {
    for (i in 2:length(data)) {
      ema_values[i] <- (data[i] - ema_values[i - 1]) * multiplier + ema_values[i - 1]
    }
  }
  return(ema_values)
}

macd <- function(data, short_period, long_period, signal_period) {
  if (length(data) == 0) stop("data must not be empty")
  if (short_period <= 0 || long_period <= 0 || signal_period <= 0) {
    stop("All periods must be positive")
  }
  short_ema <- ema(data, short_period)
  long_ema <- ema(data, long_period)
  macd_line <- short_ema - long_ema
  signal_line <- ema(macd_line, signal_period)
  histogram <- macd_line - signal_line
  result <- list(
    macd_line = macd_line,
    signal_line = signal_line,
    histogram = histogram
  )
  return(result)
}

# Example
# data <- c(100, 105, 110, 115, 120, 125, 130)
# print(macd(data, 3, 5, 2))
