#######################################################################
# Start of Answer, for Q-1
# Use the training set to build a model with several of the models available from the caret package. 
# Test out all of the following models.
#######################################################################

models <- c("glm", "lda",  "naive_bayes",  "svmLinear", 
            "gamboost",  "gamLoess", "qda", 
            "knn", "kknn", "loclda", "gam",
            "rf", "ranger",  "wsrf", "Rborist", 
            "avNNet", "mlp", "monmlp",
            "adaboost", "gbm",
            "svmRadial", "svmRadialCost", "svmRadialSigma")

library(caret)
library(dslabs)
set.seed(1)
data("mnist_27")

#Following takes few minutes to run.
fits <- lapply(models, function(model){ 
  print(model)
  train(y ~ ., method = model, data = mnist_27$train)
}) 

names(fits) <- models

#######################################################################
# Start of Answer, for Q-2
# Create a matrix of predictions for the test set. 
#######################################################################

fits_predicts <- sapply(
                        fits, 
                        function(fits){ predict(fits,mnist_27$test) }
                       )

class(fits_predicts) # "matrix"
#typeof(fits_predicts) # "character"

length(mnist_27$test$y) # 200
length(models) # 23

#######################################################################
# Start of Answer, for Q-3
# 
#######################################################################

library(caret)

accu <- lapply(models, function(model){ 
  print (model) 
  accc <- confusionMatrix (model, mnist_27$test$y)
}) 

accu <- lapply(models, function(model){ 
        print (model) 
        accc <- confusionMatrix (y_hat[[model]], mnist_27$test$y)
        accc[["overall"]][["Accuracy"]] 
        }) 

confusionvector <- sapply(c, function(c){
  + confusionMatrix(factor(pred[,c]), y_test)$overall["Accuracy"]})
