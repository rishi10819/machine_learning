library(caret)
library(randomForest)
library(tidyverse)
library(dslabs)
library(Rborist)
data("tissue_gene_expression")
set.seed(1991)
x <- tissue_gene_expression$x
y <- tissue_gene_expression$y
fit <- train(x, y, method="rpart", tuneGrid = data.frame(cp = seq(0, 0.1, 0.01)), minsplit = 0) 

#####################################
#I get error after following statement
#fit <- train(x, y, method="rpart", tuneGrid = data.frame(cp = seq(0, 0.1, 0.01)), control = rpart.control(minsplit = 0)) 

#Something is wrong; all the Accuracy metric values are missing:
#  Accuracy       Kappa    
#Min.   : NA   Min.   : NA  
#1st Qu.: NA   1st Qu.: NA  
#Median : NA   Median : NA  
#Mean   :NaN   Mean   :NaN  
#3rd Qu.: NA   3rd Qu.: NA  
#Max.   : NA   Max.   : NA  
#NA's   :11    NA's   :11   
#Error: Stopping
#In addition: There were 50 or more warnings (use warnings() to see the first 50)
#####################################


plot(fit)

fit

#cp    Accuracy   Kappa    
#0.00  0.8668036  0.8384748
#0.01  0.8656543  0.8370646
#0.02  0.8656543  0.8370646
#0.03  0.8645649  0.8356391
#0.04  0.8640016  0.8349533
#0.05  0.8564958  0.8253203
#0.06  0.8558988  0.8244822
#0.07  0.8527767  0.8205727
#0.08  0.8495762  0.8166189
#0.09  0.8402422  0.8049469
#0.10  0.8402422  0.8049469


confusionMatrix(fit)

#Prediction    cerebellum colon endometrium hippocampus kidney liver placenta
#cerebellum        18.2   0.1         0.2         1.3    0.3   0.0      0.1
#colon              0.3  17.2         0.1         0.0    0.0   0.1      0.1
#endometrium        0.4   0.4         5.3         0.2    0.9   0.1      1.0
#hippocampus        0.7   0.0         0.2        13.9    0.1   0.1      0.0
#kidney             0.2   0.5         1.3         0.3   18.5   0.3      1.0
#liver              0.0   0.1         0.1         0.0    0.3  12.7      0.0
#placenta           0.2   0.1         1.1         0.0    1.0   0.3      1.0

#Accuracy (average) : 0.8665

