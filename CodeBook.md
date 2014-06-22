==================================================================
Human Activity Recognition Using Smartphones Dataset
Cleanning
Version 1.0
==================================================================
License:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

User:
Jiandong Jin
jjdblast@gmail.com
==================================================================
1.Merges the training and the test sets to create one data set.
    I read training set and test test in data_train and data_test 
    Use rbind() to merge two set 
==================================================================
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
    I use regex in R, find variables wherever include 'mean' or 'std', with R command:
    ds_x_extracts = ds_x[grep("mean|std", names(ds_x))]
==================================================================
3.Uses descriptive activity names to name the activities in the data set
    1-WALKING, 2-WALIKING_UPSTAIRS, 3-WALKING_DOWNSTAIRS, 4-SITTING, 5-STANDING, 6-LAYING
==================================================================
4.Appropriately labels the data set with descriptive variable names. 
    I extract activity names in features.txt with R command:
    readLines('./UCI HAR Dataset/features.txt')
    feature_names = unlist(strsplit(feature_lines,' '))[seq(2,2*length(feature_lines),2)]
    names(ds_x)= feature_names
==================================================================
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    I increase features "label" and "subject"
    and calculate the average of each variable for each activity and each subject
    finally get data.frame with 563 features
==================================================================
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
