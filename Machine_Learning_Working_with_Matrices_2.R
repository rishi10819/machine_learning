library(tidyverse)
library(dslabs)
mnist <- read_mnist()

# List of 2
# $ images: int [1:60000, 1:784] 0 0 0 0 0 0 0 0 0 0 ...
# $ labels: int [1:60000] 5 0 4 1 9 2 1 3 1 4 ...
#str(mnist$train)

#x <- mnist$train$images[1:1000]
#y <- mnist$train$label[1:1000]

#y <- rowMeans(mnist$train$images>50 & mnist$train$images<205)
#qplot(as.factor(mnist$train$labels), y, geom = "boxplot")


boxplot(rowMeans(mnist$train$images)~mnist$train$labels) # generating boxplot
#class(mnist$train$images) # "matrix"
#class(mnist$train$labels) # "integer"

All_Pixles<-as.vector(mnist$train$images) # convert matrix to vector
#is.vector(All_Pixles) #  TRUE
#class(All_Pixles)     # "integer"
#typeof(All_Pixles)    # "integer"

hist(All_Pixles) # all area

hist(All_Pixles[All_Pixles >50 & All_Pixles<205]) # grey area only

z1 <- All_Pixles[All_Pixles >50 & All_Pixles<205]
mean(z1) # 128.2618

