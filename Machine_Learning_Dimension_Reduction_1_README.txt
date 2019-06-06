We want to explore the tissue_gene_expression predictors by plotting them.
Plot the first two principal components with color representing tissue type.
Which tissue is in a cluster by itself? 

 
The predictors for each observation are measured using the same device and experimental procedure. 
This introduces biases that can affect all the predictors from one observation. 
For each observation, compute the average across all predictors, and then plot this against the first PC with color representing tissue. 
What is the correlation?

 
We see an association with the first PC and the observation averages. 
Redo the PCA but only after removing the center. 
