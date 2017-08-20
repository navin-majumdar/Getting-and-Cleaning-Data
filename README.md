# Getting-and-Cleaning-Data
#### Coursera-Data Science-Getting and Cleaning Data Project

This project contains one R script, run_analysis.R, which will calculate means per activity, per subject of the mean and Standard deviation of the Human Activity Recognition Using Smartphones Dataset Version 1.0. 

This dataset should be downloaded and extracted directly into the working directory (./UCI HAR Dataset).

It is assumed that the R script run_analysis.R will be kept in the same working directory (./UCI HAR Dataset).

Once executed, the resulting final tidy dataset will be found at ./tidy_data.txt

Required R Packages:
1. data.table
2. dplyr

### run_analysis.R
This is the main script that is called to performed the cleaning and tidying of the dataset as described in the excercise and listed below.

* Load the various files which make-up the UCI dataset.
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names.
* Creates a smaller second dataset, containing only mean and std variables.
* Cleans-up existing Column Names to give meaningful Column Names
* Computes the means of this secondary dataset, group by subject/activity.
* Saves this last tidy dataset to ./data/tidy_data.txt

For futher details, refer to CookBook.md

### References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012. activityrecognition@smartlab.ws
