library(data.table)
# n_features = 561
# training set
data_train_x = read.table('./UCI HAR Dataset/train/X_train.txt', header = F)
data_train_y = read.table('./UCI HAR Dataset/train/y_train.txt', header = F)
# test set
data_test_x = read.table('./UCI HAR Dataset/test/X_test.txt', header = F)
data_test_y = read.table('./UCI HAR Dataset/test/y_test.txt', header = F)
########################################################################################################
# 1.Merges the training and the test sets to create one data set.
# merge dataset
ds_x = rbind(data_train_x,data_test_x)
ds_y = rbind(data_train_y,data_test_y)
# name each variable
feature_lines = readLines('./UCI HAR Dataset/features.txt')
feature_names = unlist(strsplit(feature_lines,' '))[seq(2,2*length(feature_lines),2)]
names(ds_x)= feature_names
########################################################################################################
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# extracts by regex, wherever include 'mean' or 'std'
ds_x_extracts = ds_x[grep("mean|std", names(ds_x))]
########################################################################################################
# 3.Uses descriptive activity names to name the activities in the data set
# 1-WALKING, 2-WALIKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING
names(ds_y) = 'label'
ds_y[ds_y==1]='WALKING'; ds_y[ds_y==2]='WALKING_UPSTAIRS'; ds_y[ds_y==3]='WALKING_DOWNSTAIRS'; 
ds_y[ds_y==4]='SITTING'; ds_y[ds_y==5]='STANDING'; ds_y[ds_y==6]='LAYING';
########################################################################################################
# 4.Appropriately labels the data set with descriptive variable names
# just do it in step1, name each variable by it's in features.txt
########################################################################################################
# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# match each subject with their activities' records
subject_train = read.csv('./UCI HAR Dataset/train/subject_train.txt', header=F);
names(subject_train)='subject'
subject_test = read.csv('./UCI HAR Dataset/test/subject_test.txt', header=F);
names(subject_test)='subject';
# merge subject data
subject = rbind(subject_train, subject_test)
ds_label = cbind(ds_x, ds_y)
ds_subject = cbind(ds_label, subject)
# find each subjct's activities and calculate the average of features
ds_avg=matrix(nrow=1, ncol=length(ds_subject))
for (i in 1:30){
  ds_i = ds_subject[ds_subject$subject==i,]
  ds_j=matrix(nrow=1, ncol=length(ds_subject))
  for (j in unique(ds_i$label)){
    avg = colMeans(ds_i[ds_i$label==j,][1:561]);
    avg$label = j;avg$subject = i;
    ds_j = rbind(ds_j,avg)
  }
  # remove NA
  ds_j = ds_1 = ds_j[-1,]
  ds_avg = rbind(ds_avg, ds_j)
}
# remove NA
ds_new = as.data.frame(ds_avg[-1,])
a=as.matrix(ds_new)
write.table(a,'mydata1.txt')



