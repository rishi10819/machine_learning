library(tidyverse)
library(dslabs)
library(caret)

data("heights")

# str(heights)
# 'data.frame':	1050 obs. of  2 variables:
# $ sex   : Factor w/ 2 levels "Female","Male": 2 2 2 2 2 1 1 1 1 2 ...
# $ height: num  75 70 68 74 61 65 66 62 66 67 ...

set.seed(1)

test_index <- createDataPartition(heights$sex, times = 1, p = 0.5, list = FALSE)    
train_set <- heights[-test_index,]
test_set <- heights[test_index,]

my_k <- seq(1, 101, 3)

accuracy <- function(my_k) { 
  
  map_df(my_k, function(k) {
    
    fit<- knn3(sex~height, data = train_set, k = k)
    y_hat<-predict(fit, test_set, type="class")
    F_val<-F_meas(data = y_hat, reference = factor(test_set$sex))
    #F_val<-F_meas(data = y_hat, reference = factor(train_set$sex))
    list(k = k, F_val = F_val)
  })
}

x <- sapply(my_k, accuracy)
x # k = 46. F_val = 0.6019417

#view(accuracy) 
#my_k[which.max(accuracy$F_val)] # 46
#accuracy %>% ggplot(aes(k,F_val)) + geom_line()

