#install.packages("ROCR")
#library(ROCR)

library(tidyverse)
library(caret)

#sessionInfo()

data(iris)

# "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
colnames(iris)

iris <- iris[-which(iris$Species=='setosa'),]
y <- iris$Species

y # Levels: setosa versicolor virginica

################################################
# Start of Answer, for Q-1
################################################

set.seed(2)
test_index <- createDataPartition(y,times=1,p=0.5,list=FALSE) #answer
test <- iris[test_index,]
train <- iris[-test_index,]

################################################
# Start of Answer, for Q-2
################################################
# 1- Sepal Length

#min(iris$Sepal.Length) # 4.9
#max(iris$Sepal.Length) # 7.9
#cutoff_sep_len <- seq (4.8, 8, by = 0.1)

cutoff_sep_len <- seq (range(iris$Sepal.Length)[1], range(iris$Sepal.Length)[2], by = 0.1)
cutoff_sep_len

accuracy_sep_len <- map_dbl(cutoff_sep_len, function(x){
  y_hat <- ifelse(train$Sepal.Length > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == train$Species)
})

accuracy_sep_len

max(accuracy_sep_len) # 0.7

#typeof(accuracy_sep_len) # "double"
#class(accuracy_sep_len)  # "numeric"


################################################
# 2- Sepal Width

#min(iris$Sepal.Width) # 2
#max(iris$Sepal.Width) # 3.8
#cutoff_sep_width <- seq (2, 4, by = 0.1)

cutoff_sep_width <- seq (range(iris$Sepal.Width)[1], range(iris$Sepal.Width)[2], by = 0.1)

accuracy_sep_width <- map_dbl(cutoff_sep_width, function(x){
  y_hat <- ifelse(train$Sepal.Width > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == train$Species)
})
accuracy_sep_width
max(accuracy_sep_width) # 0.62


################################################
# 3- Petal Length

#min(iris$Petal.Length) # 3
#max(iris$Petal.Length) # 6.9
#cutoff_pet_len <- seq (3, 7, by = 0.1)

cutoff_pet_len <- seq (range(iris$Petal.Length)[1], range(iris$Petal.Length)[2], by = 0.1)

accuracy_pet_len <- map_dbl(cutoff_pet_len, function(x){
  y_hat <- ifelse(train$Petal.Length > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == train$Species)
})
accuracy_pet_len
max(accuracy_pet_len) # 0.96


################################################
# 4- Petal Width

#min(iris$Petal.Width) # 1
#max(iris$Petal.Width) # 2.5
#cutoff_pet_width <- seq (1, 2.5, by = 0.1)

cutoff_pet_width <- seq (range(iris$Petal.Width)[1], range(iris$Petal.Width)[2], by = 0.1)

accuracy_pet_width <- map_dbl(cutoff_pet_width, function(x){
  y_hat <- ifelse(train$Petal.Width > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == train$Species)
})
accuracy_pet_width
max(accuracy_pet_width) # 0.94


################################################
# Start of Answer, for Q-3
################################################
# 3- Petal Length


cutoff_pet_len <- seq (range(iris$Petal.Length)[1], range(iris$Petal.Length)[2], by = 0.1)

accuracy_pet_len <- map_dbl(cutoff_pet_len, function(x){
  y_hat <- ifelse(test$Petal.Length > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == test$Species)
})

max(accuracy_pet_len) # 0.90


################################################



################################################
# Start of Answer, for Q-4
################################################
# 1- Sepal Length


cutoff_sep_len <- seq (range(iris$Sepal.Length)[1], range(iris$Sepal.Length)[2], by = 0.1)

accuracy_sep_len <- map_dbl(cutoff_sep_len, function(x){
  y_hat <- ifelse(test$Sepal.Length > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == test$Species)
})

max(accuracy_sep_len) # 0.78


################################################
# 2- Sepal Width


cutoff_sep_width <- seq (range(iris$Sepal.Width)[1], range(iris$Sepal.Width)[2], by = 0.1)

accuracy_sep_width <- map_dbl(cutoff_sep_width, function(x){
  y_hat <- ifelse(test$Sepal.Width > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == test$Species)
})

max(accuracy_sep_width) # 0.64


################################################
# 3- Petal Length


cutoff_pet_len <- seq (range(iris$Petal.Length)[1], range(iris$Petal.Length)[2], by = 0.1)

accuracy_pet_len <- map_dbl(cutoff_pet_len, function(x){
  y_hat <- ifelse(test$Petal.Length > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == test$Species)
})

max(accuracy_pet_len) # 0.90


################################################
# 4- Petal Width


cutoff_pet_width <- seq (range(iris$Petal.Width)[1], range(iris$Petal.Width)[2], by = 0.1)

accuracy_pet_width <- map_dbl(cutoff_pet_width, function(x){
  y_hat <- ifelse(test$Petal.Width > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == test$Species)
})

max(accuracy_pet_width) # 0.94


################################################



################################################
# Start of Answer, for Q-5
################################################
# 1- Petal Length (train data set)

cutoff_pet_len <- seq (range(iris$Petal.Length)[1], range(iris$Petal.Length)[2], by = 0.1)

accuracy_pet_len <- map_dbl(cutoff_pet_len, function(x){
  y_hat <- ifelse(train$Petal.Length > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == train$Species)
})

max(accuracy_pet_len) # 0.96
best_cutoff_pet_len <- cutoff_pet_len[which.max(accuracy_pet_len)]
best_cutoff_pet_len # 4.7

################################################
# 2- Petal Width (train data set)

cutoff_pet_width <- seq (range(iris$Petal.Width)[1], range(iris$Petal.Width)[2], by = 0.1)

accuracy_pet_width <- map_dbl(cutoff_pet_width, function(x){
  y_hat <- ifelse(train$Petal.Width > x, "virginica", "versicolor") %>%
    factor (levels = levels(test$Species))
  mean(y_hat == train$Species)
})

max(accuracy_pet_width) # 0.94
best_cutoff_pet_width <- cutoff_pet_width[which.max(accuracy_pet_width)]
best_cutoff_pet_width # 1.5

################################################
# Petal Length and Petal Width (test data set)

y_hat <- ifelse(test$Petal.Length > best_cutoff_pet_len | test$Petal.Width > best_cutoff_pet_width, "virginica", "versicolor") %>%
  factor (levels = levels(test$Species))

levels(y_hat)        # "versicolor" "virginica" "setosa"
levels(test$Species) # "versicolor" "virginica" "setosa"

mean(y_hat == test$Species) # 0.88

################################################