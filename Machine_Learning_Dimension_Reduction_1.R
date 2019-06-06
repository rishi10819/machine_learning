library(caret)
library(dslabs)
library(tidyverse)

#######################################################################
# Start of Answer, for Q-1
# 
#######################################################################

data("tissue_gene_expression")
dim(tissue_gene_expression$x) # 189  500

pc <- prcomp(tissue_gene_expression$x)
data.frame(pc_1 = pc$x[,1], pc_2 = pc$x[,2], 
           tissue = tissue_gene_expression$y) %>%
  ggplot(aes(pc_1, pc_2, color = tissue)) +
  geom_point()  

#######################################################################
# Start of Answer, for Q-2
# 
#######################################################################

table(tissue_gene_expression$y)
#cerebellum     colon   endometrium   hippocampus    kidney   liver   placenta 
#        38        34            15            31        39      26         6 

typeof(table(tissue_gene_expression$x)) # integer
typeof(table(tissue_gene_expression$y)) # integer

cor(tissue_gene_expression$x, tissue_gene_expression$y)

#######################################################################
# Start of Answer, for Q-3
# 
#######################################################################

x <- with(tissue_gene_expression, sweep(x, 1, rowMeans(x))) 
pc <- prcomp(x)
data.frame(pc_1 = pc$x[,1], pc_2 = pc$x[,2], 
           tissue = tissue_gene_expression$y) %>%
  ggplot(aes(pc_1, pc_2, color = tissue)) +
  geom_point()  
