library(dslabs)
library(tidyverse)
library(caret)

#######################################################################
# Start of Answer, for Q-1
# Create 10 bootstrap samples for the mnist_27 dataset
# How many times do 3, 4, and 7 appear in the first resampled index?
#######################################################################

data("mnist_27")

#rm(list=ls())
set.seed(1995)

#creates 10 sets of random numbers ranging from 1 to 800.
indexes <- createResample(mnist_27$train$y, 10)

#Here I am visually checking just the first sample so I can verify my answer.
#indexes$Resample01

#names(indexes)
# "Resample01" "Resample02" "Resample03" "Resample04" "Resample05" "Resample06" "Resample07"
# "Resample08" "Resample09" "Resample10"

sum(indexes[[1]]==3) # 1
sum(indexes[[1]]==4) # 4
sum(indexes[[1]]==7) # 0

#######################################################################
# Start of Answer, for Q-2
# What is the total number of times that 3 appears in all of the resampled indexes?
#######################################################################

samples <- seq(1,10,1)

sum_vect3 <- map_int(samples, function(i)
{
  sum(indexes[[i]] == 3)
  
})

sum(sum_vect3) # 11

#############################

sum_vect4 <- map_int(samples, function(i)
{
  sum(indexes[[i]] == 4)
  
})
sum(sum_vect4) # 16

#############################

sum_vect7 <- map_int(samples, function(i)
{
  sum(indexes[[i]] == 7)
  
})
sum(sum_vect7) # 15


####################################################
####################################################
