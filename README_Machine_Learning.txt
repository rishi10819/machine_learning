Build a machine learning algorithm using a dataset, iris.
Remove the setosa species and focus on the versicolor and virginica iris species.
Create an even split of the data into train and test partitions.


Find out the singular feature in the dataset that yields the greatest overall accuracy. 
Using only the train iris dataset, for each feature, perform a simple search to find the cutoff that produces the highest accuracy. 
Over the range of each feature use intervals of 0.1.
Which feature produces the highest accuracy?


Using the smart cutoff value calculated on the training data, what is the overall accuracy in the test data?


Is overall accuracy in the training data, different from overall accuracy in the test data?
This can happen often if we overtrain. 
Which feature best optimizes our overall accuracy?


Notice that Petal.Length and Petal.Width in combination could potentially be more information than either feature alone.
Optimize the the cutoffs for Petal.Length and Petal.Width separately in the train dataset.
Then, 
report the overall accuracy when applied to the test dataset by creating a rule that predicts 
virginica if 
Petal.Length is greater than the length cutoff OR 
Petal.Width is greater than the width cutoff, and 
versicolor otherwise.
What is the overall accuracy for the test data now?