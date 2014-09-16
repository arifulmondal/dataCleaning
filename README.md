Course Project: Getting and Cleaning Data
============

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Data Source
===========
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

About run_analysis.R
====
Simple R-script "run_analysis.R" that does the following using raw data mentioned below

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


Raw Data Description
=========
run_analysis.R would read following data sets from the directory "UCI HAR Dataset"  within present working directory:


The dataset includes the following files:
=========================================

- 'UCI HAR Dataset/README.txt'

- 'UCI HAR Dataset/features_info.txt': Shows information about the variables used on the feature vector.

- 'UCI HAR Dataset/features.txt': List of all features.

- 'UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name.

- 'UCI HAR Dataset/train/X_train.txt': Training set.

- 'UCI HAR Dataset/train/y_train.txt': Training labels.
- 'UCI HAR Dataset/train/subject_train.txt': Subject ID

- 'UCI HAR Dataset/test/X_test.txt': Test set.

- 'UCI HAR Dataset/test/y_test.txt': Test labels.
- 'UCI HAR Dataset/test/subject_test.txt': Subject ID


For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

About Tidy Data:
=========
From the completed data set run_analysis.R creates a second, independent tidy data  "tidy_avg_activity.txt"  with the average of each variable for each activity and each subject


