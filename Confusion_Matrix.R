install.packages("caret")
install.packages('e1071', dependencies=TRUE)

library(tidyverse)
library(dslabs)
library(dplyr)
library(lubridate)

library(caret)

#################################################

data("reported_heights")

dat <- mutate(reported_heights, date_time = ymd_hms(time_stamp)) %>%
  filter(date_time >= make_date(2016, 01, 25) & date_time < make_date(2016, 02, 1)) %>%
  mutate(type = ifelse(day(date_time) == 25 & hour(date_time) == 8 & between(minute(date_time), 15, 30), "inclass","online")) %>%
  select(sex, type)

levels(dat$sex) # NULL

y <- factor(dat$sex, c("Female", "Male"))
x <- dat$type

y
x

dat_inclass <- dat %>% filter (type == "inclass") 
dat_online  <- dat %>% filter (type == "online")

total         <- nrow ( dat ) 
total_inclass <- nrow ( dat_inclass )
total_online  <- nrow ( dat_online ) 

total  # 150
total_inclass # 39
total_online # 111

summary_dat_inclass <- dat_inclass %>%
  group_by (sex) %>%
  summarize ( percent = n() / nrow( dat_inclass ) )

# Female 0.667
# Male 0.333

summary_dat_inclass

summary_dat_online <- dat_online %>%
  group_by (sex) %>%
  summarize ( percent = n() / nrow( dat_online ) )

# Female 0.378
# Male 0.622

summary_dat_online

#################################################

# Answer for question 2

y_hat<- ifelse(x=="inclass","Female","Male") %>%
  factor(levels = c("Female", "Male"))
  #factor(levels = levels(dat$sex)) #This is NULL. So, I had to use above line.


typeof(y)     # "integer"
typeof(y_hat) # "integer"


class(y)     # "factor"
class(y_hat) # "factor"


levels(y)     # "Female" "Male"
levels(y_hat) # "Female" "Male"

#for y_hat, if I use, factor(levels = levels(dat$sex))
#levels(y_hat) # character(0) 


levels(dat$sex) # NULL

#levels(y_hat) <- c("Female", "Male")

levels(y)     # "Female" "Male"
levels(y_hat) # "Female" "Male"


y     # Levels: Female Male
y_hat # Levels: Female Male

#for y_hat, if I use, factor(levels = levels(dat$sex))
#y_hat # does not show any levels


mean(y == y_hat) # 0.6333333


#################################################

# Answer for question 3

table(y_hat, y)

#################################################

# Answer for question 4, 5, 6

confusionMatrix(data = y_hat, reference = factor(y))

#################################################
