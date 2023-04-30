students <- c(7,9,10,11)

# A
epanechnikov_kernel <- function(x) {
  if (abs(x) > 1) return(0)
  else return(3/4 * (1 - x**2))
}

kernel_density_estimator <- function(x, data, kernel, h = 1) {
  sum <- 0
  for (xi in data) {
    sum = sum + kernel((x - xi) / h)
  }
  return(sum / (h * length(data)))
}

weights <- c(8, 9.5, 10.5)
for (w in weights) {
  print(kernel_density_estimator(w, students, epanechnikov_kernel))
}

# shortcut
d <- density(x = students, kernel = "epanechnikov", bw = 1 / sqrt(5))
# The density function chooses the scaling factor h such that bw is the 
# standard deviation of the scaled kernel. The standard deviation of the
# Epanechnikov kernel scaled by h is equal to the square root of one fifth
# of h to the power of 3. Hence bw is the inverse of the square root of 5.
plot(d)
kde <- approxfun(d)
for (w in weights) {
  print(kde(w))
}

# B
for (w in weights) {
  print(kernel_density_estimator(w, students, dnorm))
}
plot(density(x = students, kernel = "gaussian", bw = 1))
# For the Gaussian distribution the scaling parameter h is exactly the 
# corresponding standard deviation.
?density
