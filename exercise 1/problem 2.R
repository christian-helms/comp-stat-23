prob_infected <- 2970000 / 83000000

sensitivity <- 0.979
specificity <- 0.786

positive_posterior_probability <- function(share_of_infected) {
  num <- sensitivity * share_of_infected
  den <- num + (1 - specificity) * (1 - share_of_infected)
  return(num / den)
}

# A
print(prob_infected)
print(1 - prob_infected)

# B
print((1 - specificity) * (1 - prob_infected))

# C
ggplot(data.frame(x = c(0, 1)), aes(x = x)) + 
  stat_function(fun = positive_posterior_probability)
