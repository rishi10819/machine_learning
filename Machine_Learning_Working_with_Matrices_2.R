library(tidyverse)
library(dslabs)
mnist <- read_mnist()

boxplot(rowMeans(mnist$train$images)~mnist$train$labels) # generating boxplot
#class(mnist$train$images) # "matrix"
#class(mnist$train$labels) # "integer"

All_Pixles<-as.vector(mnist$train$images) # convert matrix to vector
#is.vector(All_Pixles) #  TRUE
#class(All_Pixles)     # "integer"
#typeof(All_Pixles)    # "integer"

mean (All_Pixles >50 & All_Pixles<205) # 0.06183703

hist(All_Pixles) # all area

hist(All_Pixles[All_Pixles >50 & All_Pixles<205]) # grey area only
