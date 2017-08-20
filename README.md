# Getting-and-Cleaning-Data
#### Coursera-Data Science-Getting and Cleaning Data Project

This project contains one R script, run_analysis.R, which will calculate means per activity, per subject of the mean and Standard deviation of the Human Activity Recognition Using Smartphones Dataset Version 1.0. 

This dataset should be downloaded and extracted directly into the working directory (./UCI HAR Dataset).

It is assumed that the R script run_analysis.R will be kept in the same working directory (./UCI HAR Dataset).

Once executed, the resulting final tidy dataset will be found at ./tidy_data.txt
To read a tidy data set stored in tidy_Data.txt into R use read.table(path_to_file, header = TRUE)

Required R Packages:
1. data.table
2. dplyr

### run_analysis.R
This is the main script that is called to performed the cleaning and tidying of the dataset as described in the excercise and listed below.

* Read the data of train
* Read the data of test
* Read the features info
* Read the activity labels
* Assign column names for the train tables
* Assign column names for the test tables
* Assign column names for activity labels table
* Extract only the measurements on the mean and standard deviation for each measurement, including reading column names and subseting the measurements of mean and std from mergedData
* Use descriptive activity names to name the activities in the data set
* Cleans-up existing Column Names to give meaningful Column Names
* Create a second, independent tidy data set with the average of each variable for each activity and each subject
* Save a tidy dataset in txt file format 

For futher details, refer to CookBook.md

### References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012. activityrecognition@smartlab.ws
