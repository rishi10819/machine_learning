library(rpart)

#######################################################################
# Start of Answer, for Q-1
# Create a simple dataset where the outcome grows 0.75 units on average 
# for every increase in a predictor.
# fit a regression tree and saves the result to fit
#######################################################################

n <- 1000
sigma <- 0.25
set.seed(1)
x <- rnorm(n, 0, 1)
y <- 0.75 * x + rnorm(n, 0, sigma)
dat <- data.frame(x = x, y = y)

fit <- rpart(y ~ ., data = dat)

#######################################################################
# Start of Answer, for Q-2
# Create a plot
#######################################################################

plot(fit, margin = 0.1)
text(fit, cex = 0.75)

#######################################################################
# Start of Answer, for Q-3
# Make a scatter plot of y versus x along with the predicted values based on the fit
#######################################################################

library(tidyverse)

dat %>% 
  mutate(y_hat = predict(fit)) %>% 
  ggplot() +
  geom_point(aes(x, y)) +
  geom_step(aes(x, y_hat), col=2)


#######################################################################
# Start of Answer, for Q-4
# Now run Random Forests instead of a regression tree
# and remake the scatterplot with the prediction line.
#######################################################################

library(randomForest)

fit <- randomForest(y ~ x, data = dat) 

dat %>% 
  mutate(y_hat = predict(fit)) %>% 
  ggplot() +
  geom_point(aes(x, y)) +
  geom_step(aes(x, y_hat), col=2)

#######################################################################
# Start of Answer, for Q-5
# Draw plot 
#######################################################################

plot(fit)


#######################################################################
# Start of Answer, for Q-6
# Re-run the Random Forest but this time with a node size of 50 and a maximum of 25 nodes. 
# Remake the plot.
#######################################################################


fit <- randomForest(y ~ x, data = dat, nodesize = 50, maxnodes = 25) 

dat %>% 
  mutate(y_hat = predict(fit)) %>% 
  ggplot() +
  geom_point(aes(x, y)) +
  geom_step(aes(x, y_hat), col = 2)
