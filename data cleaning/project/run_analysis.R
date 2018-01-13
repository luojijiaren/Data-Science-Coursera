# You should create one R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

setwd('C:\\Users\\fzhan\\Documents\\GitHub\\Data Science Coursera\\data cleaning\\project\\UCI HAR Dataset')
label=read.table('activity_labels.txt',col.names = c('labels','activity'))
feature=read.table('features.txt',col.names = c('index','features'))
#read in test data
subject_test=read.table('test/subject_test.txt',col.names = 'subject.id')
X_test=read.table('test/X_test.txt')
#Appropriately labels the data set with descriptive variable names.
names(X_test)=feature$features
y_test=read.table('test/y_test.txt',col.names = 'activity')
test_bind=cbind(subject_test,X_test,y_test)
#Extracts only the measurements on the mean and standard deviation for each measurement.
test_sub=test_bind[,grepl('subject.id|labels|(mean|std)\\(\\)',names(test_bind))]
#Uses descriptive activity names to name the activities in the data set.
test=merge(test_sub,label,all=TRUE)

#read in training data
subject_train=read.table('train/subject_train.txt',col.names = 'subject.id')
X_train=read.table('train/X_train.txt')
names(X_train)=feature$features
y_train=read.table('train/y_train.txt',col.names = 'activity')
train_bind=cbind(subject_train,X_train,y_train)
train_sub=train_bind[,grepl('subject.id|labels|(mean|std)\\(\\)',names(train_bind))]
train=merge(train_sub,label,all=TRUE)

# Merges the training and the test sets
data=rbind(train,test)

# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
result=aggregate(data,by=list(subject.id,activity),FUN = mean)

#write the result to the data folder
write.table(result,file='tidy_data.txt',row.names = False)
