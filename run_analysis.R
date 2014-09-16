#Program: run_analysis.R
#Author: Ariful Mondal
#Date: 15-September-2014

#Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#The data linked to from the course website represent data collected from the accelerometers 
#from the Samsung Galaxy S smartphone. A full description is available at the site where the
#data was obtained: 

#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Attribute Information:
# ======================================       
# For each record in the dataset it is provided: 
# - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
# - Triaxial Angular velocity from the gyroscope. 
# - A 561-feature vector with time and frequency domain variables. 
# - Its activity label. 
# - An identifier of the subject who carried out the experiment.
#
# For each record it is provided:
# ======================================
# - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
# - Triaxial Angular velocity from the gyroscope. 
# - A 561-feature vector with time and frequency domain variables. 
# - Its activity label. 
# - An identifier of the subject who carried out the experiment.
#-------------------------------------------------------------------------------------------------

# Optional Section
#-------------------------------------------------------------------------------------------------
# This section can be done manually
# -- Setting working directory right - Always
# -- Downloading file from the web. - Can be done manually from the link
# -- Check available file/directory within in working directory after downloading and uncompression.
#    This can done manualy by checking the project directory from explorer 
# Note: You can uncomment this section of cdodes if you have not done things already!
#------------------------------------------------------------------------------------------------

#Setting working directory - Please change with your working directory
#setwd("C:\\coursera\\GettingandCleaningData\\Assignment")

#Dowloding files from the web - source
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
#              destfile="UCIHARDataset.zip")

#Unzip files
#unzip("UCIHARDataset.zip")

#List contents in the working directory
dir()
# "UCI HAR Dataset"
# "UCIHARDataset.zip"

dir("UCI HAR Dataset")
# [1] "activity_labels.txt" "features.txt"  "features_info.txt"  "README.txt"  "test"               
# [6] "train"       

dir("UCI HAR Dataset/train")
#[1] "Inertial Signals"  "subject_train.txt" "X_train.txt"  "y_train.txt"  

dir("UCI HAR Dataset/train/Inertial Signals")
# [1] "body_acc_x_train.txt"  "body_acc_y_train.txt"  "body_acc_z_train.txt"  "body_gyro_x_train.txt"
# [5] "body_gyro_y_train.txt" "body_gyro_z_train.txt" "total_acc_x_train.txt" "total_acc_y_train.txt"
# [9] "total_acc_z_train.txt"

dir("UCI HAR Dataset/test")
# [1] "Inertial Signals" "subject_test.txt" "X_test.txt"  "y_test.txt"

dir("UCI HAR Dataset/test/Inertial Signals")
# [1] "body_acc_x_test.txt"  "body_acc_y_test.txt"  "body_acc_z_test.txt"  "body_gyro_x_test.txt" 
# "body_gyro_y_test.txt"
# [6] "body_gyro_z_test.txt" "total_acc_x_test.txt" "total_acc_y_test.txt" "total_acc_z_test.txt"
##----------------------------------------------------------------------------------------

##                         Processing Training Data sets
##-----------------------------------------------------------------------------------------

## Loading Training Data sets - raw files: "subject_train.txt" "X_train.txt" "y_train.txt" 
# ======================================
x_train_data<-as.data.frame(read.csv("UCI HAR Dataset/train/x_train.txt",sep="", header=FALSE))
y_train_data<-as.data.frame(read.csv("UCI HAR Dataset/train/y_train.txt",sep="", header=FALSE))
subj_train_data<-as.data.frame(read.csv("UCI HAR Dataset/train/subject_train.txt",sep="", header=FALSE))
head(y_train_data)
head(subj_train_data)
# Know number of columns and rows in training data sets
ncol(x_train_data) 
#[1] 561
nrow(x_train_data)
#[1] 7352
ncol(y_train_data)
#[1] 1
nrow(y_train_data)
#[1] 7352
ncol(subj_train_data)
#[1] 1
nrow(subj_train_data)
#[1] 7352

# Consolidate all the train files "subject_train.txt" "X_train.txt" "y_train.txt" 
# ======================================
smt_ph_train_data<-as.data.frame(cbind(x_train_data,y_train_data,subj_train_data))
ncol(smt_ph_train_data)
#[1] 563
nrow(smt_ph_train_data)
#[1] 7352

# House Keeping: If you do not need some data, can be removed to free up space
#----------------
# rm(x_train_data)
# rm(y_train_data)
# rm(subj_train_data)


## Processing Test Data sets
## ======================================
## [[Loading Test Data sets - raw files: "subject_test.txt" "X_test.txt" "y_test.txt"
x_test_data<-as.data.frame(read.csv("UCI HAR Dataset/test/x_test.txt",sep="", header=FALSE))
y_test_data<-as.data.frame(read.csv("UCI HAR Dataset/test/y_test.txt",sep="", header=FALSE))
subj_test_data<-as.data.frame(read.csv("UCI HAR Dataset/test/subject_test.txt",sep="", header=FALSE))
# Know number of columns and rows in test data sets
ncol(x_test_data)
#[1] 561
nrow(x_test_data)
#[1] 2947
ncol(y_test_data)
#[1] 1
nrow(y_test_data)
#[1] 2947
ncol(subj_test_data)
#[1] 1
nrow(subj_test_data)
#[1] 2947
##]]

# Consolidate all the test files "subject_test.txt" "X_test.txt" "y_test.txt" 
# ======================================
smt_ph_test_data<-as.data.frame(cbind(x_test_data,y_test_data,subj_test_data))
ncol(smt_ph_test_data)
#[1] 563
nrow(smt_ph_test_data)
#[1] 2947

# House Keeping: If you do not need some data, can be removed to free up space
#----------------
# rm(x_test_data)
# rm(y_test_data)
# rm(subj_test_data)



# Problem 1: Merges the training and the test sets to create one data set.
# Merging Training and Test Data together to create smt_ph_HAR_data
# ======================================
smt_ph_HAR_data<-as.data.frame(rbind(smt_ph_train_data,smt_ph_test_data))
ncol(smt_ph_HAR_data)
#[1] 563
nrow(smt_ph_HAR_data)
#[1] 10299

# House Keeping: If you do not need some data, can be removed to free up space
#----------------
#rm(smt_ph_train_data)
#rm(smt_ph_test_data)

## Processing Feature Data
## ======================================
features_data<-as.data.frame(read.csv("UCI HAR Dataset/features.txt",sep="",
                                      header=FALSE, colClasses=c("integer","character")))
nrow(features_data)
#[1] 561
head(features_data)
# V1                V2
# 1  1 tBodyAcc-mean()-X
# 2  2 tBodyAcc-mean()-Y
# 3  3 tBodyAcc-mean()-Z
# 4  4  tBodyAcc-std()-X
# 5  5  tBodyAcc-std()-Y
# 6  6  tBodyAcc-std()-Z

# Need some clean-up "-","()", "," to make the variable name nicer and R-compatible

features_data$V2 = gsub('-mean', '_Mean_', features_data$V2)
features_data$V2 = gsub('-std', '_Std_', features_data$V2)
features_data$V2 = gsub('[()-]', "", features_data$V2)
features_data$V2 = gsub('[,]', "_", features_data$V2)
head(features_data)
# V1              V2
# 1  1 tBodyAcc_Mean_X
# 2  2 tBodyAcc_Mean_Y
# 3  3 tBodyAcc_Mean_Z
# 4  4  tBodyAcc_Std_X
# 5  5  tBodyAcc_Std_Y
# 6  6  tBodyAcc_Std_Z

## Processing Activity Data
## ======================================
activity_label<-as.data.frame(read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE))
head(activity_label)
# V1                 V2
# 1  1            WALKING
# 2  2   WALKING_UPSTAIRS
# 3  3 WALKING_DOWNSTAIRS
# 4  4            SITTING
# 5  5           STANDING
# 6  6             LAYING

colnames(activity_label)<-c("activity","actLabel")

# For all 563 column labels we can use below piece of codes.
#colnames(smt_ph_HAR_data) <- c(features_data$V2, "Activity", "Subject")
#head(smt_ph_HAR_data)

# Problem 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# Subsetting data: Only for Mean, Sd, Activity (col 562) and Subject (col 563)
#=====================================================

featur_select_logic<-grepl("*Mean*|*Std*",features_data$V2)
myFeatures<-features_data[featur_select_logic,]
nrow(myFeatures)
#[1]86
tail(myFeatures)
# V1                                 V2
# 556 556  angletBodyAccJerkMean_gravityMean
# 557 557     angletBodyGyroMean_gravityMean
# 558 558 angletBodyGyroJerkMean_gravityMean
# 559 559                 angleX_gravityMean
# 560 560                 angleY_gravityMean
# 561 561                 angleZ_gravityMean

# Creating First Level of Tidy Data. 
# =====================================
# Note: You can also change the variable descriptions with lower(), upper() functions.

My_SmPH_Data<-smt_ph_HAR_data[,c(myFeatures$V1, 562,563)]

# Problem 3: Uses descriptive activity names to name the activities in the data set
# activities 1-5
#=========================================================

Int_activity <- 1

#colnames(activity_label)<-c("activity","actLabel")

for(label in activity_label$actLabel){
        My_SmPH_Data$Activity <-gsub(Int_activity, label,  My_SmPH_Data$Activity) 
        Int_activity<-Int_activity+1
        
}

head(My_SmPH_Data)
# angleZ_gravityMean Activity Subject
# 1        -0.05862692 STANDING       1
# 2        -0.05431672 STANDING       1
# 3        -0.04911782 STANDING       1
# 4        -0.04766318 STANDING       1
# 5        -0.04389225 STANDING       1
# 6        -0.04212638 STANDING       1
tail(My_SmPH_Data)
# angleX_gravityMean angleY_gravityMean angleZ_gravityMean         Activity Subject
# 10294         -0.6467543          0.2821502          0.1811516 WALKING_UPSTAIRS      24
# 10295         -0.6517323          0.2746268          0.1847843 WALKING_UPSTAIRS      24
# 10296         -0.6551809          0.2735783          0.1824121 WALKING_UPSTAIRS      24
# 10297         -0.6553568          0.2744788          0.1811835 WALKING_UPSTAIRS      24
# 10298         -0.6597186          0.2647816          0.1875629 WALKING_UPSTAIRS      24
# 10299         -0.6600802          0.2639362          0.1881034 WALKING_UPSTAIRS      24


# Problem 4: Appropriately labels the data set with descriptive variable names.
## Getting Nice and tidy column names
#===================================================================

col_names<-c(myFeatures$V2,"Activity","Subject")
colnames(My_SmPH_Data) <- col_names

#head(My_SmPH_Tidy_Data)
nrow(My_SmPH_Data)
#[1] 10299
ncol(My_SmPH_Data)
#[1] 88

# House Keeping: If you do not need some data, can be removed to free up space
#----------------
# rm(features_data)
# rm(myFeatures)
# rm(featur_select_logic)

# Problem 5: From the data set in step 4, creates a second, independent tidy
# data set with the average of each variable for each activity and each subject..
# Summary functions can be used - such as aggregate, lapply and group by activity and subject
#===================================================================
library(data.table)
DT <- data.table(My_SmPH_Data)
tidy_summary_data<-DT[, lapply(.SD,mean), by=list(Activity, Subject)]

#Altrenatively we can summarize using aggregate() function
# tidy_summary_data_1 = aggregate(My_SmPH_Data, 
#                                 by=list( activity=My_SmPH_Data$Activity, 
#                                 subject=My_SmPH_Data$Subject), mean, na.rm=TRUE)
# tidy_summary_data_1$Activity<-NULL
# tidy_summary_data_1$Subject<-NULL

# Write summaries into flat txt file.
# ===================================
write.table(tidy_summary_data,"tidy_avg_activity.txt", row.name=FALSE) 

# 

##----------------------End of Data Processing-----------------------------------------------------------



