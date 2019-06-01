library(dslabs)
library(caret)
library(tidyverse)

#######################################################################
# Start of Answer, for Q-1
# Estimate the accuracy of LDA. 
#######################################################################

data("tissue_gene_expression")

#set.seed(1993, sample.kind = "Rounding") # use this line of code if you are using R 3.6 or later

set.seed(1993) # use this line of code if you are using R 3.5 or earlier

ind <- which(tissue_gene_expression$y %in% c("cerebellum", "hippocampus"))
str(ind)  # int [1:69] 1 2 3 4 5 6 7 8 9 10 ...

y <- droplevels(tissue_gene_expression$y[ind])
str(y) # Factor w/ 2 levels "cerebellum","hippocampus": 1 1 1 1 1 1 1 1 1 1 ...

x <- tissue_gene_expression$x[ind, ]
x <- x[, sample(ncol(x), 10)]


train_lda <- train(x, y, method="lda") 
#str(train_lda)

show(train_lda)
# Accuracy   Kappa    
# 0.8707879  0.7358585

#######################################################################
# Start of Answer, for Q-2
# Plot the mean vectors against each other and 
# determine which 2 predictors (genes) appear to be driving the algorithm for LDA. 
#######################################################################

means_lda <- data.frame(t(train_lda$finalModel$means)) 
means_lda <- means_lda %>% mutate(gene = as.factor(rownames(means_lda)))

#install.packages("ggrepel") # I have already installed earlier.
library (ggrepel)

means_lda %>% ggplot(aes(x = cerebellum, y = hippocampus, colour = gene, label = gene)) +
  ggtitle("LDA Means - Cerebellum vs Hippocampus") +
  geom_point() +
  geom_text_repel(aes(label=gene)) +
  theme(legend.position="none")  

#######################################################################
# Start of Answer, for Q-5
# Re-run LDA with preProcess = "center". 
# Which TWO genes drive the algorithm after performing the scaling?
#######################################################################

train_lda_center <- train(x, y, method="lda", preProcess = "center") 
show(train_lda_center)

means_lda_center <- data.frame(t(train_lda_center$finalModel$means)) 
means_lda_center <- means_lda_center %>% mutate(gene = as.factor(rownames(means_lda_center)))

means_lda_center %>% ggplot(aes(x = cerebellum, y = hippocampus, colour = gene, label = gene)) +
  ggtitle("LDA_Center Means - Cerebellum vs Hippocampus") +
  geom_point() +
  geom_text_repel(aes(label=gene)) +
  theme(legend.position="none")  

