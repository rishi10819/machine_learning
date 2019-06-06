library(tidyverse)
library(dslabs)

#######################################################################
# Start of Answer, for Q-1
#
#######################################################################

data("movielens")

#colnames(movielens)
#"movieId"   "title"     "year"      "genres"    "userId"    "rating"    "timestamp"

p <- movielens %>% count(year)
#typeof(p) # "list"


#plot(p)
p %>% ggplot(aes(x=year, y=sqrt(n))) + geom_point()

#To find the year with the max number of ratings:
p[which(p$n==max(p$n)),] # So, the answer is 1995

# A tibble: 1 x 2
#     year     n
#     <int>  <int>
#  1  1995   6635


movielens %>%   
  group_by(year) %>% 
  ggplot(aes(x=year, y=sqrt(rating), fill=year)) + 
  geom_col() + 
  ggtitle("Movies") +
  scale_fill_gradientn(colours = rainbow(100)) +
  scale_x_continuous(breaks = seq(1900,2020, 10)) +
  theme(legend.position="none")


#From the above plot we can see that maximum reviews year is between 1990 and 2000
#So, here I am narrowing down the result.
movielens %>%   
  filter(movielens$year >= 1990 & movielens$year <= 2000) %>%  
  group_by(year) %>% 
  ggplot(aes(x=year, y=sqrt(rating), fill=year)) + 
  geom_col() + 
  ggtitle("Movies") +
  scale_fill_gradientn(colours = rainbow(100)) +
  scale_x_continuous(breaks = seq(1900,2020, 10)) +
  theme(legend.position="none")


#######################################################################
# Start of Answer, for Q-5
#
#######################################################################

movielens2 <- movielens
colnames(movielens2)
head(movielens2)
movielens2 <- mutate(movielens2, date = as_datetime(timestamp)) 
colnames(movielens2)
head(movielens2)

#######################################################################

library(lubridate)

last_year_Forrest <- movielens %>% 
  filter(title == unique(grep('Forrest Gump', movielens$title, ignore.case = TRUE, value= TRUE))) %>% 
  arrange(desc(timestamp)) %>% 
  slice(1) %>% 
  select(timestamp) %>% 
  as.numeric() %>% 
  as.POSIXct(origin = "1970-01-01") %>% 
  year()

last_year_Forrest # 2016


last_year_Shawshank <- movielens %>% 
  filter(title == unique(grep('Shawshank Redemption', movielens$title, ignore.case = TRUE, value= TRUE))) %>% 
  arrange(desc(timestamp)) %>% 
  slice(1) %>% 
  select(timestamp) %>% 
  as.numeric() %>% 
  as.POSIXct(origin = "1970-01-01") %>% 
  year()

last_year_Shawshank # 2016

######################


movielens %>%   
  filter(movielens$year >= 1993 & movielens$year <= last_year_Forrest) %>%  
  filter(title == unique(grep('Forrest Gump', movielens$title, ignore.case = TRUE, value= TRUE))) %>% 
  group_by(year) %>% 
  ggplot(aes(x=year, y=sqrt(rating), fill=year)) + 
  geom_col() + 
  ggtitle("Movies Forrest Gump") +
  scale_fill_gradientn(colours = rainbow(100)) +
  scale_x_continuous(breaks = seq(1993,last_year_Forrest, 10)) +
  theme(legend.position="none")


movielens %>%   
  filter(movielens$year >= 1993 & movielens$year <= last_year_Shawshank) %>%  
  filter(title == unique(grep('Shawshank Redemption', movielens$title, ignore.case = TRUE, value= TRUE))) %>% 
  group_by(year) %>% 
  ggplot(aes(x=year, y=sqrt(rating), fill=year)) + 
  geom_col() + 
  ggtitle("Movies Shawshank Redemption") +
  scale_fill_gradientn(colours = rainbow(100)) +
  scale_x_continuous(breaks = seq(1993,last_year_Shawshank, 10)) +
  theme(legend.position="none")


###############################################################











x <- unique(movielens$year[movielens$year >= 1994]) # returns 1994 to 2016. NA.
x 

#returns total number of unique records
x <- length(unique(movielens$year[movielens$year >= 1994])) 
x # 24

#Error: n() should only be called in a data context
x <- ( avg = n() / length(unique(movielens$year[movielens$year >= 1994])) )

#rlang::last_error()


y <- unique(movielens$year[movielens$year >= 1994])
y






#boxplots
#movies %>% 
movielens %>%
  ggplot(aes(x=year, y=sqrt(tot_ratings), fill=year)) + # object 'tot_ratings' not found
  ggplot(aes(x=year, y=sqrt(rating), fill=year)) + 
  geom_boxplot(aes(group=year)) + 
  ggtitle("Movies") +
  scale_fill_gradientn(colours = rainbow(100)) +
  scale_x_continuous(breaks = seq(1900,2020, 10)) +
  theme(legend.position="none")

#calculate the medians directly and then plot with cols:
ggplot(data = medians, aes(x=year, y=medi, fill=year)) + # object 'medians' not found
  geom_col() + 
  scale_fill_gradientn(colours = rainbow(100)) +
  scale_x_continuous(breaks = seq(1900,2020, 10)) +
  ggtitle("Movies")

