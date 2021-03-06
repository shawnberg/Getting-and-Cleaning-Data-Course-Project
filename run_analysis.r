# Getting and Cleaning Data Course Project

# Download the data file and unzip it (check first to see if this is already done)

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(zipUrl, zipFile, mode = "wb")
}

if (!file.exists("UCI HAR Dataset")) {
  unzip(zipFile)
}


# Load necessary libraries
library("data.table")

# Select the mean and std features
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "featureNames"))
desiredFeatures <- grep("(mean|std)\\(\\)", features[, "featureNames"])
measurements <- features[desiredFeatures, "featureNames"]
measurements <- gsub('[()]', '', measurements)

# Read training data files into tables
trainingSet <- read.table("UCI HAR Dataset/train/X_train.txt")[, desiredFeatures]
setnames(trainingSet, colnames(trainingSet), measurements)

trainingLabels <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("activityID"))

trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subjectID"))

training <- cbind(trainingSubjects, trainingLabels, trainingSet)

# Read test data files into tables
testSet <- read.table("UCI HAR Dataset/test/X_test.txt")[, desiredFeatures]
setnames(testSet, colnames(testSet), measurements)

testLabels <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("activityID"))

testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subjectID"))

testing <- cbind(testSubjects, testLabels, testSet)

combinedData <- rbind(training, testing)

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityID","activity"))

combinedData <- merge(x = combinedData, y = activityLabels)

combinedData = subset(combinedData, select = -c(activityID) )

tidyData <- aggregate(combinedData[, 2:67], list(subjectID = combinedData$subjectID, activity = combinedData$activity), mean)

write.table(tidyData, "tidydata.txt", row.names = FALSE, quote = FALSE)



