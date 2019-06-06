library(tidyverse)

#simulating a dataset for 100 schools. 
set.seed(1986)
n <- round(2^rnorm(1000, 8, 1))

set.seed(1)
mu <- round(80 + 2*rt(1000, 5))
range(mu) # 67  94

#assigning true quality
schools <- data.frame(id = paste("PS",1:100),
                      size = n,
                      quality = mu,
                      rank = rank(-mu))
#top 10 schools
schools %>% top_n(10, quality) %>% arrange(desc(quality))


set.seed(1)
scores <- sapply(1:nrow(schools), function(i){
  scores <- rnorm(schools$size[i], schools$quality[i], 30)
  scores
})

schools <- schools %>% mutate(score = sapply(scores, mean))

#######################################################################
# Start of Answer, for Q-1
# What is the ID of the top school based on the average score ?
# What is the average score of the 10th school ?
#######################################################################

schools %>% top_n(10, score) %>% arrange(desc(score))


#######################################################################
# Start of Answer, for Q-2
# What is the median school size overall? 
# What is the median school size of the of the top 10 schools based on the score?
#######################################################################

# median school size overall
nrow(schools)        # 1000
median(schools$size) # 261

# median school size of the of the top 10 schools based on the score
top_10_schools_by_score <- schools %>% top_n(10, score) # %>% select (size)
#top_10_schools_by_score
median(top_10_schools_by_score$size) # 136


#######################################################################
# Start of Answer, for Q-3
# What is the median school size of the bottom 10 schools based on the score? 
#######################################################################

#schools %>% top_n(-10, score) %>% arrange(desc(score))

bottom_10_schools_by_score <- schools %>% top_n(-10, score) # %>% select (size)
#bottom_10_schools_by_score
median(bottom_10_schools_by_score$size) # 146

