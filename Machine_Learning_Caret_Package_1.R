install.packages("Rborist")

library(caret)
library(randomForest)
library(tidyverse)
library(dslabs)
library(Rborist)

#######################################################################
# Start of Answer, for Q-1
# Create a simple dataset where the outcome grows 0.75 units on average 
# for every increase in a predictor.
# Tune the minNode to minimizes the estimated RMSE.
#######################################################################

n <- 1000
sigma <- 0.25
set.seed(1)
x <- rnorm(n, 0, 1)
y <- 0.75 * x + rnorm(n, 0, sigma)
dat <- data.frame(x = x, y = y)

fit <- train(y~ .,
             method = "Rborist",
             tuneGrid = data.frame(predFixed = 1, minNode = seq(25, 100, 25)),
             data = dat)

plot(fit)

fit

#   minNode  RMSE       Rsquared   MAE      
#   25      0.2839030  0.8793810  0.2255377
#   50      0.2812410  0.8817069  0.2216274
#   75      0.2849125  0.8786149  0.2227375
#   100     0.2948620  0.8701899  0.2285878


#######################################################################
# Start of Answer, for Q-2
# Create a plot
#######################################################################

dat %>% 
  mutate(y_hat = predict(fit)) %>% 
  ggplot() +
  geom_point(aes(x, y)) +
  geom_step(aes(x, y_hat), col = 2) 

#######################################################################
