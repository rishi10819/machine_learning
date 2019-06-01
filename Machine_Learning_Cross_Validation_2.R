library(dslabs)
library(tidyverse)
library(caret)

data("tissue_gene_expression")

x <- tissue_gene_expression$x
y <- tissue_gene_expression$y

str(x)
str(y)

train_knn <- train(x, y, method = "knn", tuneGrid = data.frame(k = seq(1, 7, 2)))

train_knn$results

#   k   Accuracy       Kappa    AccuracySD    KappaSD
#1  1   0.9915016   0.9896984   0.01301569  0.01578643
#2  3   0.9820525   0.9782926   0.01279615  0.01546261
#3  5   0.9755655   0.9703986   0.02406968  0.02922711
#4  7   0.9728702   0.9670728   0.03076907  0.03736788

