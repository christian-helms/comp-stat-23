data = read.delim("data/ex01_credit_scores.csv", sep=";")

# A
hist(data$score, breaks=seq(0, 9, 1))
#hist(data$score, breaks=seq(0, 9, 0.15))

# B
x <- seq(0,10,0.01)
true_density <- function(z) {
  return(0.5 * dnorm(z, mean=2, sd=0.4) + 0.5 * dnorm(z, mean=4, sd=1.2))
}
y <- mapply(true_density, x)

# C
kernel <- function(z) {
  if (abs(z) > 1) return(0)
  else return(pi/4 * cos(pi/2 * z))
}

kde <- function(z, h) {
  sum <- 0
  for (score in data$score) {
    sum = sum + kernel((z - score) / h)
  }
  return(sum / (nrow(data) * h))
}

par(mfrow=c(2,2))
for (i in 1:4) {
  bw <- 10^(i - 3)
  y_kde <- mapply(function(z){kde(z,bw)}, x)
  mse <- mean((y_kde - y)^2)
  plot(x, y_kde, col = 1, type="l")
  lines(x, y, col = 2)
  legend(x = "topright", legend= c(paste("h =", toString(bw)), 
      paste("mse =", format(round(mse, 5), nsmall=5))))
}
