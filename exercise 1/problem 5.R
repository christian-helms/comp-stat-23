data_raw <- read.delim("data/ex01_tumor_data.csv", sep=" ")
data <- as.matrix(data)
#image(intensity, asp = 65/30)

addGaussian <- function(data, sigma) {
  out <- matrix(nrow = nrow(data), ncol = ncol(data))
  for (x in 1:nrow(data)) {
    for (y in 1:ncol(data)) {
      out[x,y] = 0 # or data[x,y]
      for (i in 1:nrow(data)) {
        for (j in 1:ncol(data)) {
          out[x,y] = out[x,y] + 
            data[i,j] * dnorm(sqrt((x - i)^2 + (y - j)^2), sd=sigma)
        }
      }
    }
  }
  return(out)
}

par(mfrow=c(1,4))
image(addGaussian(data, 0.1), asp=65/30)
image(addGaussian(data, 1), asp=65/30)
image(addGaussian(data, 5), asp=65/30)
image(addGaussian(data, 10), asp=65/30)