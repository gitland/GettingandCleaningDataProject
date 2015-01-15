# Code Book

#Introduction
This script is related to Course Project of Getting and Cleaning Data. This script contains the 5 steps mentioned in the project description.


  * Step 1 is to read and merge the training and test  sets to create on data set by first reading  all the data  from the files using `read.csv()` method. The data is read for `subject` , `activity` and `features`  files. After reading all the data , the data is being row binded using `rbind()`.Than the `subject` and `activity` row binded data are assigned specific variable names i.e. `subject` and `activity` and also variable names readed from feature variable file are given to features data. The data is than column binded and merged into one big data frame using `cbind()`.
  
  * Step 2 is to extract only measurement on the `mean` and `standard deviation` which is  achevied by extracting only  `mean` and `std` and `subject' and `activty` values using `subset()` from the big date set we have merged before.
  
  * Step 3  is to use descriptive names to the activies in the data set which is achevied by assigning activity labels read from `activity_label.txt` file using the `gsub()` inside `for loop` to the activities inside the data. The activities names are, 
      - `WALKING` 
      - `WALKING_UPSTAIRS` 
      - `WALKING_DOWNSTAIRS` 
      - `SITTING` 
      - `STANDING` 
      - `LAYING`
  
  * Step 4 is to give descriptive names to labels in the data set which is acheived by changing undescriptives names to be more descriptive using `gsub()`. For example `Acc` is converted to `Accelerometer`, `Gyro` is converted to `Gyroscope`, `Mag` is converted to `Magnitude`, `BodyBody` is converted to `Body` ,`t` is converted to `time` and `f` is converted to `frequency`.
  
  * Step 5 is to generate  independent tidy data set with the average of each variable for each activity and each subject from the data set we have generated in the Step 4, this is achevied by finding the `mean` of each `activity` and `subject` measurements by using `aggregate()` method provided by `plyr` library. And than order the resulting data by `subject` and `activity`, and file is created using `write.table()` containing the tidy data we generated.


# Variables Information
Following is the information of every variable used in the script.

  * `activityTest` contains data from `Y_test.txt` file.
  * `activityTrain` contains data from  `Y_train.txt` file.
   
  * `subjectTrain` contains data from `subject_train.txt` file.  
  * `subjectTest` contains data from `subject_test.txt` file.

  * `featuresTest` contains data from `X_test.txt` file.
  * `featuresTrain` contains data from `X_train.txt` file.
  
  * dataFeaturesVariableNames contains variable names from the 'features.txt' file that will be used for giving variable name.
  
  * `dataSubject` contains row merged data of `subjectTrain`,`subjectTest` files using `rbind()`.
  * `dataActivity` contains row merged data of `activityTrain`,`activityTest` files using `rbind()`.
  * `dataFeatures`contains row merged data of `featuresTrain`,`featuresTest` files using `rbind()`.
  
  * `combine` contains column merged data of `dataSubject`,`dataActivity` using `cbind()`.
  * `mergedData` contains column merged data of `dataFeatures`,`combine` using  `rbind()`.
  * `selectedData` contains extracted data with `mean` and `std` variables.
  * `actNamesData` contains data after giving them activity names.
  * `properNamesData` contains data after renaming the variables to proper names.
  * `tidyData` contains the independent tidy data set.
  * All these `mergedData`,`selectedData`,`actNamesData`,`properNamesData` are big datasets.
  
# The variables that were used for the data manipulations are: 
  * timeBodyAccelerometer-mean()-X
  * timeBodyAccelerometer-mean()-Y
  * timeBodyAccelerometer-mean()-Z
  * timeBodyAccelerometer-std()-X
  * timeBodyAccelerometer-std()-Y
  * timeBodyAccelerometer-std()-Z
  * timeGravityAccelerometer-mean()-X
  * timeGravityAccelerometer-mean()-Y
  * timeGravityAccelerometer-mean()-Z
  * timeGravityAccelerometer-std()-X
  * timeGravityAccelerometer-std()-Y
  * timeGravityAccelerometer-std()-Z
  * timeBodyAccelerometerJerk-mean()-X
  * timeBodyAccelerometerJerk-mean()-Y
  * timeBodyAccelerometerJerk-mean()-Z
  * timeBodyAccelerometerJerk-std()-X
  * timeBodyAccelerometerJerk-std()-Y
  * timeBodyAccelerometerJerk-std()-Z
  * timeBodyGyroscope-mean()-X
  * timeBodyGyroscope-mean()-Y
  * timeBodyGyroscope-mean()-Z
  * timeBodyGyroscope-std()-X
  * timeBodyGyroscope-std()-Y
  * timeBodyGyroscope-std()-Z
  * timeBodyGyroscopeJerk-mean()-X
  * timeBodyGyroscopeJerk-mean()-Y
  * timeBodyGyroscopeJerk-mean()-Z
  * timeBodyGyroscopeJerk-std()-X
  * timeBodyGyroscopeJerk-std()-Y
  * timeBodyGyroscopeJerk-std()-Z
  * timeBodyAccelerometerMagnitude-mean()
  * timeBodyAccelerometerMagnitude-std()
  * timeGravityAccelerometerMagnitude-mean()
  * timeGravityAccelerometerMagnitude-std()
  * timeBodyAccelerometerJerkMagnitude-mean()
  * timeBodyAccelerometerJerkMagnitude-std()
  * timeBodyGyroscopeMagnitude-mean()
  * timeBodyGyroscopeMagnitude-std()
  * timeBodyGyroscopeJerkMagnitude-mean()
  * timeBodyGyroscopeJerkMagnitude-std()
  * frequencyBodyAccelerometer-mean()-X
  * frequencyBodyAccelerometer-mean()-Y
  * frequencyBodyAccelerometer-mean()-Z
  * frequencyBodyAccelerometer-std()-X
  * frequencyBodyAccelerometer-std()-Y
  * frequencyBodyAccelerometer-std()-Z
  * frequencyBodyAccelerometerJerk-mean()-X
  * frequencyBodyAccelerometerJerk-mean()-Y
  * frequencyBodyAccelerometerJerk-mean()-Z
  * frequencyBodyAccelerometerJerk-std()-X
  * frequencyBodyAccelerometerJerk-std()-Y
  * frequencyBodyAccelerometerJerk-std()-Z
  * frequencyBodyGyroscope-mean()-X
  * frequencyBodyGyroscope-mean()-Y
  * frequencyBodyGyroscope-mean()-Z
  * frequencyBodyGyroscope-std()-X
  * frequencyBodyGyroscope-std()-Y
  * frequencyBodyGyroscope-std()-Z
  * frequencyBodyAccelerometerMagnitude-mean()
  * frequencyBodyAccelerometerMagnitude-std()
  * frequencyBodyAccelerometerJerkMagnitude-mean()
  * frequencyBodyAccelerometerJerkMagnitude-std()
  * frequencyBodyGyroscopeMagnitude-mean()
  * frequencyBodyGyroscopeMagnitude-std()
  * frequencyBodyGyroscopeJerkMagnitude-mean()
  * frequencyBodyGyroscopeJerkMagnitude-std()
  * subject
  * activity

  
  
  
 
 
 
  
  
  
  
  