library(dslabs)
library(caret)
library(tidyverse)

#######################################################################
# Start of Answer, for Q-3
# Estimate the accuracy of QDA. 
#######################################################################

data("tissue_gene_expression")

#set.seed(1993, sample.kind = "Rounding") # use this line of code if you are using R 3.6 or later
set.seed(1993) # use this line of code if you are using R 3.5 or earlier

ind <- which(tissue_gene_expression$y %in% c("cerebellum", "hippocampus"))

y <- droplevels(tissue_gene_expression$y[ind])

x <- tissue_gene_expression$x[ind, ]
x <- x[, sample(ncol(x), 10)]

train_qda <- train(x, y, method="qda") 
#str(train_qda)

show(train_qda)
#  Accuracy   Kappa    
# 0.8147954  0.6339053


#######################################################################
# Start of Answer, for Q-4
# Plot the mean vectors against each other and 
# determine which 2 predictors (genes) appear to be driving the algorithm for QDA. 
#######################################################################

means_qda <- data.frame(t(train_qda$finalModel$means)) 
means_qda <- means_qda %>% mutate(gene = as.factor(rownames(means_qda)))

#install.packages("ggrepel") # I have already installed earlier.
library (ggrepel)

means_qda %>% ggplot(aes(x = cerebellum, y = hippocampus, colour = gene, label = gene)) +
  ggtitle("QDA Means - Cerebellum vs Hippocampus") +
  geom_point() +
  geom_text_repel(aes(label=gene)) +
  theme(legend.position="none")  

#######################################################################