# Getting-and-Cleaning-Data-Course-Project

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The project requirements are to create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of 
   each variable for each activity and each subject.

The R script, run_analysis.R, does the following:
 1. Downloads the data for the project and unzips the file if it has not already done so
 2. Loads any necessary libraries (I only needed data.table)
 3. Load the feature data and limit it to the measurements for mean and standard deviation
 4. Loads the training file for only those columns required using the feature list determined in step 3
 5. Loads the training labels and subjects
 6. Combines the files created in steps 3-5
 7. Loads the test file for only those columns required using the feature list determined in step 3
 8. Loads the test labels and subjects
 9. Combines the files created in steps 6-8
10. Combines the training and test files together
11. Loads the activity labels data
12. Merges the combined file and the activity labels on activityID
13. Removes activityID from the file
14. Creates a tidy dataset with the average of each of the measurements by Subject and Activity
15. Writes the tidy dataset out as a .csv file for further analysis

