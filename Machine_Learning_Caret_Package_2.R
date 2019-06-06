library(caret)
library(tidyverse)
library(dslabs)

#######################################################################
# Start of Answer, for Q-3
# Fit a classification tree to the tissue_gene_expression dataset. 
# And estimate the accuracy.
# Plot the accuracies to report the results of the best model. 
#######################################################################

data("tissue_gene_expression")
set.seed(1991)
x <- tissue_gene_expression$x
y <- tissue_gene_expression$y
fit <- train(x, y, method="rpart", tuneGrid = data.frame(cp = seq(0, 0.1, 0.01))) 
plot(fit)
fit

#######################################################################
# Start of Answer, for Q-4
# Get the confusion matrix for the best fitting classification tree
#######################################################################

confusionMatrix(fit)

#Prediction    cerebellum   colon  endometrium  hippocampus  kidney  liver  placenta
#cerebellum        19.3     0.0         0.3         1.1       0.3    0.0      0.2
#colon              0.3    16.5         0.1         0.0       0.1    0.0      0.1
#endometrium        0.1     0.2         5.6         0.1       1.5    0.1      1.3
#hippocampus        0.2     0.0         0.0        15.3       0.1    0.0      0.0
#kidney             0.3     0.3         1.7         0.1     18.7     0.5      0.3
#liver              0.0     0.0         0.3         0.0       0.3    12.6     0.2
#placenta           0.2     0.0         0.4         0.0       0.5    0.1      0.9

#Accuracy (average) : 0.8878
