# BDA400 Assignment 5 - Stochastic RSI (StochRSI)
rsi <- function(data, period) {
  if (length(data) < period + 1) stop("Data length should be greater than period")
  diff_values <- diff(data)
  gains <- numeric(length(diff_values))
  losses <- numeric(length(diff_values))

  for (i in seq_along(diff_values)) {
    if (diff_values[i] > 0) {
      gains[i] <- diff_values[i]
      losses[i] <- 0
    } else {
      gains[i] <- 0
      losses[i] <- abs(diff_values[i])
    }
  }

  avg_gain <- sum(gains[1:period]) / period
  avg_loss <- sum(losses[1:period]) / period
  rsi_values <- rep(NA_real_, length(data))

  for (i in (period + 1):length(data)) {
    avg_gain <- (avg_gain * (period - 1) + gains[i - 1]) / period
    avg_loss <- (avg_loss * (period - 1) + losses[i - 1]) / period
    if (avg_loss == 0) {
      rsi_values[i] <- ifelse(avg_gain == 0, 50, 100)
    } else {
      rs <- avg_gain / avg_loss
      rsi_values[i] <- 100 - (100 / (1 + rs))
    }
  }
  return(rsi_values)
}

sma <- function(data, period) {
  valid <- !is.na(data)
  if (!all(valid)) {
    # Preserve alignment while calculating each complete non-NA window.
    out <- rep(NA_real_, length(data) - period + 1)
    if (length(data) < period) return(out)
    for (i in 1:(length(data) - period + 1)) {
      window <- data[i:(i + period - 1)]
      if (!anyNA(window)) out[i] <- sum(window) / period
    }
    return(out)
  }
  if (length(data) < period) stop("Data length should be greater than or equal to the period")
  out <- numeric(length(data) - period + 1)
  for (i in 1:(length(data) - period + 1)) out[i] <- sum(data[i:(i + period - 1)]) / period
  out
}

stoch_rsi <- function(data, period, k_period, d_period) {
  rsi_values <- rsi(data, period)
  valid_rsi <- rsi_values[!is.na(rsi_values)]
  if (length(valid_rsi) == 0) stop("Not enough data to calculate StochRSI")

  min_rsi <- min(valid_rsi)
  max_rsi <- max(valid_rsi)

  if (max_rsi == min_rsi) {
    k_values <- rep(0, length(rsi_values))
    k_values[is.na(rsi_values)] <- NA_real_
  } else {
    k_values <- (rsi_values - min_rsi) / (max_rsi - min_rsi)
  }

  k_line <- sma(k_values, k_period)
  d_line <- sma(k_line, d_period)

  result <- list(k_line = k_line, d_line = d_line)
  return(result)
}

# Example
# data <- c(45, 50, 48, 55, 52, 49, 58, 60, 65, 62)
# print(stoch_rsi(data, 5, 3, 3))
