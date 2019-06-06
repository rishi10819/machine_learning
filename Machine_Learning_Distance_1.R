library(dslabs)

#######################################################################
# Start of Answer, for Q-1
# "tissue_gene_expression" matrix has the gene expression levels of 
# 500 genes from 189 biological samples representing seven different tissues. 
# Compute the Euclidean distance between each observation and store it in the object d.
#######################################################################

data("tissue_gene_expression")
str(tissue_gene_expression)

dim(tissue_gene_expression$x)  # 189 500

# Here are tissue types
# cerebellum       colon  endometrium hippocampus   kidney   liver  placenta 
#38               34              15          31       39      26         6
table(tissue_gene_expression$y)


d <- dist(tissue_gene_expression$x) 
class(d) # "dist"
head(d)  # 7.005922 6.635272 7.331041 5.191081 6.314908 6.568495


#######################################################################
# Start of Answer, for Q-2
# Compare the distances between observations 1 and 2 (both cerebellum), 
# observations 39 and 40 (both colon), and observations 73 and 74 (both endometrium).
#######################################################################


ind1 <- which(tissue_gene_expression$y %in% c("cerebellum"))  
ind2 <- which(tissue_gene_expression$y %in% c("colon"))       
ind3 <- which(tissue_gene_expression$y %in% c("endometrium")) 

ind1 # 1 2 ... 37 38
ind2 # 39 40 ... 71 72
ind3 # 73 74 ... 86 87

########################################

x1 <- tissue_gene_expression$x[ind1]
#x1 [1:2]  # 9.825680 9.631247

x1[1] # 9.825680
x1[2] # 9.631247
sqrt(sum((x1[1]-x1[2])^2)) # 0.1944329  # cerebellum

########################################

x2 <- tissue_gene_expression$x[ind2]
#x2 [1:2]  # 9.001219 9.071377

x2[1] # 9.001219
x2[2] # 9.071377
sqrt(sum((x2[1]-x2[2])^2)) # 0.07015813  # colon

########################################

x3 <- tissue_gene_expression$x[ind3]
#x3 [1:2]  # 9.446020 9.866022

x3[1] # 9.446020
x3[2] # 9.866022
sqrt(sum((x3[1]-x3[2])^2)) # 0.4200023  # endometrium


#######################################################################
# Start of Answer, for Q-3
# Make a plot of all the distances
#######################################################################

image(as.matrix(d))

image(as.matrix(d)[order(tissue_gene_expression$y), order(tissue_gene_expression$y)])


#######################################################################
