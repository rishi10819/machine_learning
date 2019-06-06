library(tidyverse)
library(dslabs)
library(caret)

#######################################################################
# Start of Answer, for Q-1
# Generate a set of random predictors and outcomes
#######################################################################

set.seed(1996)
n <- 1000
p <- 10000

x <- matrix(rnorm(n*p), n, p)
class(x)  # "matrix"
dim(x)    # 1000 10000
nrow(x)   # 1000
ncol(x)   # 10000
  
colnames(x) <- paste("x", 1:ncol(x), sep = "_")
y <- rbinom(n, 1, 0.5) %>% factor()

x_subset <- x[ ,sample(p, 100)]

fit <- train(x_subset, y, method = "glm")

fit$results
#    parameter    Accuracy         Kappa    AccuracySD       KappaSD
# 1      none    0.5078406    0.01318925    0.02336971    0.04626366


#######################################################################
# Start of Answer, for Q-2
# Now, instead of using a random selection of predictors, 
# we are going to search for those that are most predictive of the outcome. 
#
# Produce p-values for each column -- i.e. each predictor. 
#######################################################################

#install.packages("devtools") 
library(devtools)

#first I ran only following but then library(genefilter) did not work.
#devtools::install_bioc("genefilter")

# Then I performing following steps.
#install.packages("BiocManager")
library("BiocManager")
#BiocManager::install("genefilter")

library(genefilter)

tt <- colttests(x, y)

pvals <- tt$p.value 
is.vector(pvals) # TRUE
typeof(pvals)    # "double"
class(pvals)     # "numeric"


#######################################################################
# Start of Answer, for Q-3
# Create an index ind with the column numbers of the predictors 
# that were "statistically significantly" (rather close) associated with y. 
# -- i.e. the vector of outcomes. 
# Use a p-value cutoff of 0.01 to define "statistically significantly." 
# How many predictors survive this cutoff?
#######################################################################

ind <- which(pvals <= 0.01)
length(ind)  # 108


#######################################################################
# Start of Answer, for Q-4
# Now re-run the cross-validation after redefinining x_subset to be 
# the subset of x defined by the columns showing "statistically significant" association with y.
# What is the accuracy now?
#######################################################################

x_subset <- x[,ind]
view(x_subset)

fit <- train(x_subset, y, method = "glm")

fit$results
#    parameter    Accuracy      Kappa   AccuracySD      KappaSD
# 1      none   0.7571395   0.5134142   0.01922097   0.03805696


#######################################################################
