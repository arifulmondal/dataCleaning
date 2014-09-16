Course Project: Getting and Cleaning Data
============

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Data Source
===========
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Objective
====
Simple R-script "run_analysis.R" that does the following:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


How run_analysis.R works
=========
run_analysis.R would read following data sets from present working directory:

Training data 
--------------
"UCI HAR Dataset/train/subject_train.txt" 
"UCI HAR Dataset/train/X_train.txt"
"UCI HAR Dataset/train/y_train.txt" 



