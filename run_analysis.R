##############################################################################
#
# FILE
#   run_analysis.R
#
# DESCRIPTION
#  This file performs the following tasks:
#
#       Donwloading zip file containing data and reading data
#       Merging the training and the test sets to create one data set
#       Extracting only the measurements on the mean and standard deviation for each measurement
#       Using descriptive activity names to name the activities in the data set
#       Appropriately labeling the data set with descriptive variable names


library(dplyr)

#---------------------------------------------------------------------------------------------------
#0. Donwloading zip file containing data and reading data

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
        download.file(zipUrl, zipFile, mode = "wb")
}

# unzipping file if directory doesn't exist
dataPath <- "UCI HAR Dataset"
if (!file.exists(dataPath)) {
        unzip(zipFile)
}


xTrain <- read.table(file.path(dataPath, "train", "X_Train.txt"))
xTest <- read.table(file.path(dataPath, "test", "X_Test.txt"))

yTrain <- read.table(file.path(dataPath, "train", "y_Train.txt"))
yTest <- read.table(file.path(dataPath, "test", "y_Test.txt"))

subjectTrain <- read.table(file.path(dataPath, "train", "subject_train.txt"))
subjectTest <- read.table(file.path(dataPath, "test", "subject_test.txt"))

features <- read.table(file.path(dataPath, "features.txt"))

activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"))

#---------------------------------------------------------------------------------------------------
#1. Merging the training and the test sets to create one data set

#1.1. Merging labels
y<- rbind(yTrain, yTest)

#1.2. Merging test & training sets
x <- rbind(xTrain, xTest)

#1.3. Merging Subjects data
subjects <- rbind(subjectTrain, subjectTest)




#---------------------------------------------------------------------------------------------------
#2. Extracting only the measurements on the mean and standard deviation for each measurement

filtered_features <- features[, 2]
filtered_features <- grep("-mean\\(\\)|-std\\(\\)", filtered_features)

x <- x[, filtered_features]
names(x) <- features[filtered_features, 2]


#---------------------------------------------------------------------------------------------------
#3. Using descriptive activity names to name the activities in the data set

y[,1] <- activityLabels[y[,1], 2]
names(y) <- "activity"


#---------------------------------------------------------------------------------------------------
#4. Appropriately labeling the data set with descriptive variable names

names(subjects) <- "subject"

mergedData <- cbind(subjects, y, x)

write.table(mergedData, "merged_and_labeled_dataset.txt", row.names = FALSE, quote = FALSE)


#---------------------------------------------------------------------------------------------------
#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject

mergedDataMean <- mergedData %>% 
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

write.table(mergedDataMean, "tidy_dataset.txt", row.names = FALSE, quote = FALSE)




