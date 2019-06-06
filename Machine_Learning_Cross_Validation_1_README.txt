Generate a set of random predictors and outcomes.


Now, instead of using a random selection of predictors, we are going to search for those that are most predictive of the outcome. 
Produce p-values for each column -- i.e. each predictor.


Create an index ind with the column numbers of the predictors that were "statistically significantly" (rather close) associated with y -- i.e. the vector of outcomes.
Use a p-value cutoff of 0.01 to define "statistically significantly." 
How many predictors survive this cutoff?


Now re-run the cross-validation after redefinining x_subset to be the subset of x, defined by the columns showing "statistically significant" association with y.
What is the accuracy now?