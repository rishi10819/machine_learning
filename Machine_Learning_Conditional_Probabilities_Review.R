library(tidyverse)

set.seed(1)
disease <- sample(c(0,1), size=1e6, replace=TRUE, prob=c(0.98,0.02))
test <- rep(NA, 1e6)
test[disease==0] <- sample(c(0,1), size=sum(disease==0), replace=TRUE, prob=c(0.90,0.10))
test[disease==1] <- sample(c(0,1), size=sum(disease==1), replace=TRUE, prob=c(0.15, 0.85))

################################################

# (D) = Disease.        (ND) = Not-Disease.  
# (+) = Test-Positive.  (-)  = Test-Negative
#
# The test is positive 85% of the time when tested on a patient with the disease 
# (high sensitivity. True Positive): P(test+|disease) = P(+|D) = 0.85
# This means 0.15 miss to detect the disease. P(test-|disease). P(-|D).
#
# P(+|D) + P(-|D) = 100%
#
# The test is negative 90% of the time when tested on a healthy patient 
# (high specificity. True Negative): P(test-|healthy) = P(-|ND) = 0.90
# This means 0.10 detects the disease when there is no disease. P(test+|healthy). 
# P(+|ND).
#
# P(+|ND) + P(-|ND) = 100%
#
# The disease is prevalent in about 2% of the community: P(disease) = P(D) = 0.02
# This means 0.98 is not_disease. P(ND).
#
######################

# disease: 2%.  So, not_disease: 98%
#
#                  actually_pos (2%)   actually_neg (98%)
# predicted_pos      85 %                10 %
# predicted_neg      15 %                90 %
#
# Now above table looks like following.
#
#                  actually_pos (2%)   actually_neg (98%)
# predicted_pos      2% * 85%            98% * 10%
# predicted_neg      2% * 15%            98% * 90%
#
# Now above table looks like following.
#
#                  actually_pos (2%)   actually_neg (98%)   
# predicted_pos      .0170 (TP)          .9800 (FP)             
# predicted_neg      .0030 (FN)          .8820 (TN)


################################################
# Start of Answer, for Q-2
# What is the probability that a test is positive?
################################################

# wrong answers
# 0.0170 + 0.9800 = 0.9970
# 0.0170 / (0.0170 + 0.9800) = 0.01705115

mean(test) # 0.114509


################################################
# Start of Answer, for Q-3
# What is the probability that an individual has the disease if the test is negative?
################################################
mean(test == 0 & disease == 1)  # 0.003065
  

################################################
# Start of Answer, for Q-4
# What is the probability that you have the disease if the test is positive?
################################################

mean(disease[test == 1]) # 0.1471762


################################################
# Start of Answer, for Q-5
# If the test is positive, what is the relative risk of having the disease?
################################################

mean(disease[test == 1]) / mean(disease == 1) # 7.389106

################################################