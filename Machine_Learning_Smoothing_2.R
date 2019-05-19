library(broom)
library(dslabs)

mnist_27$train %>% 
  glm(y ~ x_2, family = 'binomial', data = .) %>% 
  tidy()

# # A tibble: 2 x 5
# term        estimate std.error statistic p.value
# <chr>          <dbl>     <dbl>     <dbl>   <dbl>
#  1 (Intercept)  -0.0907     0.247    -0.368   0.713
# 2 x_2           0.685      0.827     0.829   0.407


# returns 2 horizontal lines. 
# One line at y=-2 and x_2 range from 0.10 to 0.45
# second at y=-7 and x_2 range from 0.10 to 0.60.

qplot(x_2, y, data = mnist_27$train)


# Fit a smoothing model using loess

dat2 <- mnist_27$train %>% 
  mutate(y2 = recode(y, '2' = 1, '7' = 0))
#view (dat2)

fit2 <- loess(y2 ~ x_2, data = dat2, family = 'symmetric', degree = 1)
#view(fit2)


# Fit a loess line to the above data (with 2 horizontal lines)
dat2 %>% 
  mutate(smooth = predict(fit2, newdata = .)) %>% 
  ggplot() +
  geom_point(aes(x_2, y2)) +
  geom_line(aes(x_2, smooth))


# Shows there is predictive power and the conditional probability is non-linear. 

mnist_27$train %>% 
  mutate(y = ifelse(y=="7", 1, 0)) %>%
  ggplot(aes(x_2, y)) + 
  geom_smooth(method = "loess")
