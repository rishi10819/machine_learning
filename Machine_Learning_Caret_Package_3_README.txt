We only have only 6 placentas in the dataset. 
By default, rpart requires 20 observations before splitting a node. 
That means that it is difficult to have a node in which placentas are the majority. 
Allow rpart to split any node by using the argument minsplit = 0.
What is the accuracy now?