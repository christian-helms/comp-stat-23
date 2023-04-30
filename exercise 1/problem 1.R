# plotting the density of the exponential distribution


lambda <- 2
x <- seq(0, 10, length=10000)
y <- lambda * exp(-lambda * x)
# or using the stats function dexp
y <- dexp(x, lambda)

# base R plot function from the graphics package
plot(x, y, type = "l", lwd = 1.5, axes = TRUE, xlab = "", ylab = "")

# ggplot2
  # version I
library(ggplot2)
ggplot(data.frame(x, y), aes(x=x, y=y)) + geom_line()
  # version II
ggplot(data.frame(x = c(0, 10)), aes(x=x)) + 
  stat_function(fun = dexp, args = 2)

# curve function from the graphics package:
curve(dexp, 0, 10, lwd=1.5, axis = FALSE, xlab="", ylab="")
