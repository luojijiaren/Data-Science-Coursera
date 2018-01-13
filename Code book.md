I took the following steps to clean and reshape the data:
1.	Read the files containing the labels for activities and features of vector
2.	Read the test data
-	Read the data identifying subjects for test observations and rename columns.
-	Read the data containing the feature list for test observations and add descriptions.
-	Read the data identifying type of activity for test observations and rename columns 
-	Column bind files under 2.1, 2.2 and 2.3 to get the complete table for test observations 
-	Keep only necessary columns, Subject.Id, Activity and columns containing mean in their description 
-	Add the description for activity type to produce the final test data for observations
3.	Read the training data
Reproduce steps 2.1 -> 2.6 for training data to get the final training data for observations
4.	Row bind Training and Test data to create one data set.
5.	Reshape the above data to produce the desired format for data aggregation
6.	Wrote tiny data to txt file in the Data folder.
