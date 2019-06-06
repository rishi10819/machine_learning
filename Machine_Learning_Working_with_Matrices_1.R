#######################################################################
# Start of Answer, for Q-1, Q-2
# What size of matrixes, following lines of code will generate with 
# randomly generated normal numbers and assigns it to x1, x2, x3, x4?
#######################################################################

x1 <- matrix(rnorm(1000), 100, 100) # num [1:100, 1:100]
#class(x1)  # "matrix"

x2 <- matrix(rnorm(100*10), 100, 10) # num [1:100, 1:10]
dim(x2)  # 100  10
nrow(x2) # 100
ncol(x2) # 10

x3 <- matrix(rnorm(100*10), 10, 10) # num [1:10, 1:10]

x4 <- matrix(rnorm(100*10), 10, 100) # num [1:10, 1:100]

#######################################################################
# Start of Answer, for Q-3
# Following lines of code would add the scalar 
# 1 to row 1, the scalar 2 to row 2, and so on, for the matrix x2.
#######################################################################

x2 <- matrix(rnorm(100*10), 100, 10) # num [1:100, 1:10]
head(x2)

x21 <- x2 + seq(nrow(x2)) # num [1:100, 1:10]
head(x21)

x24 <- sweep(x2, 1, 1:nrow(x2),"+") # num [1:100, 1:10]
head(x24)

#####################################

x22 <- 1:nrow(x2) # int [1:100]

# This is for columns
x23 <- sweep(x2, 2, 1:nrow(x2),"+") # num [1:100, 1:10]
head(x23)


#######################################################################
# Start of Answer, for Q-4
# Following lines of code would add the scalar 
# 1 to column 1, the scalar 2 to column 2, and so on, for the matrix x2
#######################################################################

x2 <- matrix(rnorm(100*10), 100, 10) # num [1:100, 1:10]
head(x2)

x233 <- sweep(x2, 2, 1:ncol(x2), FUN = "+") # num [1:100, 1:10]
head(x233)

#####################################

x211 <- 1:ncol(x2) # int [1:100] 

x222 <- 1:col(x2)  # 1L
head(x222) # 1

x244 <- -x2 # num [1:100, 1:10]
head(x244)

#######################################################################