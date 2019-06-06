n_val <- 100
B <- 10^5

set.seed(1)

# Run Monte Carlo
Q75s <- replicate(B, {
  
  #y_hat <- rnorm(n = n_val, mean = 0, sd = 1)
  
  y <- rnorm(100, 0, 1)
  y_hat <- y
  
  q75 <- quantile(y_hat, 0.75)
  
})

# Plot variables
par(mfrow=c(1,2))
hist(Q75s)
qqnorm(Q75s)
qqline(Q75s)

# expected value
mean(Q75s) # 0.6654465

# error
sd(Q75s) # 0.1351181



