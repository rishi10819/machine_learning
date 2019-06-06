Create a dataset of samples from just cerebellum and hippocampus, two parts of the brain, and a predictor matrix with 10 randomly selected columns.
Estimate the accuracy of LDA. 
For this question, use the entire tissue_gene_expression dataset: do not split it into training and test sets.
What is the accuracy?


In this case, LDA fits two 10-dimensional normal distributions. 
Look at the fitted model by looking at the finalModel component of the result of train. 
Notice there is a component called means that includes the estimated means of both distributions. 
Plot the mean vectors against each other and determine which predictors (genes) appear to be driving the algorithm. 
Which TWO genes appear to be driving the algorithm?


Now center or scale each column in train and re-run LDA.
Which TWO genes drive the algorithm after performing the scaling?