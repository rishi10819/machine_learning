library(tidyverse)
library(dslabs)
library(caret)

data("tissue_gene_expression")

#view(tissue_gene_expression)

#str(tissue_gene_expression)
# $ x: num [1:189, 1:500] 9.83 9.63 9.69 9.99 9.58 ...
# ..- attr(*, "dimnames")=List of 2
# .. ..$ : chr [1:189] "cerebellum_1" "cerebellum_2" "cerebellum_3" "cerebellum_4" ...
# .. ..$ : chr [1:500] "MAML1" "LHPP" "SEPT10" "B3GNT4" ...
# $ y: Factor w/ 7 levels "cerebellum","colon",..: 1 1 1 1 1 1 1 1 1 1 ...

#class(tissue_gene_expression$x) # "matrix"
#class(tissue_gene_expression$y) # "factor"

set.seed(1)

ind <- createDataPartition(tissue_gene_expression$y, times = 1, p = 0.5,list = FALSE)

train_y <- tissue_gene_expression$y[ind] 
test_y <- tissue_gene_expression$y[-ind] 

train_x <- tissue_gene_expression$x[ind,] 
test_x <- tissue_gene_expression$x[-ind,]

ks <- seq(1, 11, 2) #ks  # 1  3  5  7  9 11

accuracy <- function(ks) { map_df(ks, function(x) { 
  
  fit <- knn3(train_x, train_y, k = x) 
  
  y_hat <- predict(fit, test_x, type = "class") 
  
  test_error <- confusionMatrix(data = y_hat, reference = test_y, mode = "everything")$overall["Accuracy"] 
  
  list(k = x, test_error) 
  
})}

z <- sapply(ks, accuracy)
z
#     [,1]       [,2]       [,3]       [,4]       [,5]       [,6]     
# k   1          3          5          7          9          11       
#     0.9895833  0.9791667  0.9479167  0.9166667  0.9166667  0.9166667

