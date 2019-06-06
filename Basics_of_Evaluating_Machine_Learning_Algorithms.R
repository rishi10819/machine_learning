library (dslabs)

###########################

mnist <- read_mnist()
head(mnist)
ncol(mnist$train$images)

###########################

y <- mnist$train$labels

typeof(y) # integer

y[5] # 9
y[6] # 2

y[5] + y[6] # 9 + 2 = 11

y[5] > y[6] # TRUE.

###########################