# BDA400 Assignment 5 - Standard Deviation (population form)
stdev <- function(data) {
  if (length(data) == 0) stop("data must not be empty")
  mean_value <- sum(data) / length(data)
  diff_values <- data - mean_value
  squared_diff <- diff_values * diff_values
  variance <- sum(squared_diff) / length(squared_diff)
  standard_deviation <- sqrt(variance)
  return(standard_deviation)
}

# Example
# data <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
# print(stdev(data))
