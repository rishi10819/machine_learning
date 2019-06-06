library(tidyverse)
library(caret)

set.seed(1)
y <- rnorm(100, 0, 1)
set.seed(1)

indexes <- createResample(y, 10) #creates 10 sets of random numbers ranging from 1 to 100.
output <- matrix(ncol=1, nrow=10)

indexes
output # NA

#typeof(indexes) # "list"
#typeof(output)  # "double"

y <- rnorm(indexes)
y
# [1]  0.07730312 -0.29686864 -1.18324224  0.01129269  0.99160104  1.59396745 -1.37271127
# [8] -0.24961093  1.15942453 -1.11422235


count <- 1
#for(i in indexes){
for(i in y){  
  output[count,] <- quantile(y, 0.75)
  count <- count + 1 
}

output_frame <- data.frame(output)

mean(output_frame$output) # 0.7630266
sd(output_frame$output) # 0
