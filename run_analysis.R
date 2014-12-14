# load the train and test files into memory
testd <- read.table("UCI/test/X_test.txt", header=F,sep="")
train <- read.table("UCI/train/X_train.txt", header=F,sep="")

# now load the header
features <- read.table("UCI/features.txt", header=F,sep="")

# we only want the mean and std columns
f_mean_and_std_only <- features[grep("mean\\(\\)|std\\(\\)",features[, "V2"]),]

# set column names of meta data
colnames(f_mean_and_std_only) <- c("idx", "colName")

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
testd_m_and_s_only <- testd[,f_mean_and_std_only[,"idx"]]
train_m_and_s_only <- train[,f_mean_and_std_only[,"idx"]]

#4.  Appropriately labels the data set with descriptive variable names. 
colnames(testd_m_and_s_only) <- f_mean_and_std_only[, "colName"]
colnames(train_m_and_s_only) <- f_mean_and_std_only[, "colName"]

# read subject and merge subject into dataframe
testSubj <- read.table("UCI/test/subject_test.txt", header=F,sep="")
testd_m_and_s_only$SubjectID <- testSubj[, "V1"]
trainSubj <- read.table("UCI/train/subject_train.txt", header=F,sep="")
train_m_and_s_only$SubjectID <- trainSubj[, "V1"]

# read activities and merge activities into dataframe
testActv <- read.table("UCI/test/y_test.txt", header=F,sep="")
testd_m_and_s_only$ActivityKey <- testActv[, "V1"]
trainActv <- read.table("UCI/train/y_train.txt", header=F,sep="")
train_m_and_s_only$ActivityKey <- trainActv[, "V1"]

#1. Merges the training and the test sets to create one data set.
mergedData <- rbind(testd_m_and_s_only, train_m_and_s_only)

#4. Appropriately labels the data set with descriptive variable names. 
actMap <- read.table("UCI/activity_labels.txt", header=F,sep="")
colnames(actMap) <- c("ActivityKey", "ActivityDescription")
mergedData <- merge(mergedData, actMap, by.x="ActivityKey", by.y="ActivityKey", sort=FALSE)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
meanBySubjectAndActivity <- aggregate(mergedData[, 2:67], list(mergedData$SubjectID, mergedData$ActivityDescription), mean)

colnames(meanBySubjectAndActivity)[colnames(meanBySubjectAndActivity)=="Group.1"] <- "SubjectID"
colnames(meanBySubjectAndActivity)[colnames(meanBySubjectAndActivity)=="Group.2"] <- "ActivityDescription"

# write the data down to a file for submission
write.table(meanBySubjectAndActivity, file="meanBySubjectAndActivity.txt", row.name=FALSE)