library(dslabs)      
library(caret)
library(tidyverse)

#######################################################################
# Start of Answer, for Q-6
# Estimate the accuracy of LDA using all tissue types. 
#######################################################################

data("tissue_gene_expression")

set.seed(1993) 

y <- tissue_gene_expression$y

x <- tissue_gene_expression$x
x <- x[, sample(ncol(x), 10)]

train_lda_all_tissue_types <- train(x, y, method="lda") 
#str(train_lda_all_tissue_types)

show(train_lda_all_tissue_types)

#   Accuracy   Kappa    
# 0.8194837  0.7816682