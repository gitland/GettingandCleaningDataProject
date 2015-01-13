run_analysis <- function(){
  
  ## reading activity y test file
  activityTest <- readFile("test","Y_test.txt")
  ## reading activity y train file
  activityTrain <- readFile("train","Y_train.txt")
  
  ##reading train subject file
  subjectTrain <- readFile("train","subject_train.txt")
  ##reading test subject file
  subjectTest <- readFile("test","subject_test.txt")
  
  ##reading featurex x test file
  featuresTest <- readFile("test","X_test.txt")
  featuresTrain <-readFile("train","X_train.txt")
  
  ## concate data by rows
  
  dataSubject <- rbind(subjectTrain,subjectTest)
  dataActivity <- rbind(activityTrain,activityTest)
  dataFeatures <- rbind(featuresTrain,featuresTest)
  
  
  ## set variable names
  names(dataSubject) <- c("subject")
  names(dataActivity) <- c("activity")
  
  dataFeaturesVariableNames <- readFile("","features.txt")
  names(dataFeatures) <- dataFeaturesVariableNames$V2
  
  ## 1 Merges the training and the test sets to create one data set.
 
  combine <- cbind(dataSubject,dataActivity)
  Data <- cbind(dataFeatures,combine)
  
  ## 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
  
  meanstdFeaturesNames <- dataFeaturesVariableNames$V2[grep("mean\\(\\)|std\\(\\)",dataFeaturesVariableNames$V2)]
  selectedNamesOnly <- c(as.character(meanstdFeaturesNames),"subject","activity")
  Data <- subset(Data,select=selectedNamesOnly)
  
  ## 3 Uses descriptive activity names to name the activities in the data set
  
  Data <- setActNames(Data)
  
  ## 4 Appropriately labels the data set with descriptive variable names. 
  Data <- setProperNames(Data)
  
  
  ## 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  generateTidyDataset(Data)
  
  ##for codebook
  librayr(knitr)
  
  
  
}
generateTidyDataset <- function(Data)
{
  library(plyr)
  Data2 <- aggregate(.~subject+activity,Data,mean)
  Data2 <-Data2[order(Data2$subject,Data2$activity),]
  write.table(Data2,file="tidydata.txt",row.name=FALSE)
}
setProperNames<-function(df){
  ##t will be replace by time everywhere in the data
  names(df) <- gsub("^t","time",names(df))
  
  ##f will be replace by frequency everywhere in the data
  names(df) <-gsub("^f","frequency",names(df))
  
  ##Acc to Accelerometer 
  names(df) <-gsub("Acc","Accelerometer",names(df))
  
  ##Gyro to Gyroscope
  names(df) <- gsub("Gyro","Gyroscope",names(df))
  
  ##Mag to magnitude
  names(df) <- gsub("Mag","Magnitude",names(df))
  
  ##BodyBody to just simple Body
  names(df) <-gsub("BodyBody","Body",names(df))
  df
}
setActNames <- function(df){
  labelNames <- readFile("","activity_labels.txt") 
  activity.ID = 1
  for (ActivityLabel in labelNames$V2) {
    df$activity <- gsub(activity.ID, ActivityLabel, df$activity)
    activity.ID <- activity.ID + 1
  }
  df;
}
readFile <-function(folder,filename){
  file_path <- file.path("./data","UCI HAR Dataset")
  fileData <- read.table(file.path(file_path,folder,filename))
  fileData
}
