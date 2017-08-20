Codebook explaining the different variables used and any transformations applied in the "run_analysis.R" script for data cleaning project.

### Input Data
The script assumes the UCI dataset is extracted directly into ./UCI HAR Dataset/. 
See the README.md for further details.

### Variables
* x_train : training data
* y_train : train label data
* subject_train : file for subject numbers for training observations
* x_test : test data
* y_test : test label data
* subject_test : contains subject numbers for test observations
* features : file containing features name
* activity_labels : file containing activity text labels
* merged_train : contains joined list of data from train observations
* merged_test : contains joined list of data from test observations
* mergedData : contains joined train and test observations
* colNames : contains column names for "mergedData"
* ID_mean_std : vector contains column names from "mergedData" which have "activityId", "subjectId", "mean.." or "std.." in them
* DataForMeanAndStd : smaller dataset containing only the mean and std variables
* DataWithActivityNames : contains total set of observations combined with activity labels and subject numbers
* tidy_data : stores the final result grouped by subject and activity with average value of all features for each group.
* tidy_data.txt : final output of tidy data written to a text file sotred in the working directory

### Transformations
* textual columns heading have been given
* mergedData is prepared by doing row bind of training and the test sets to create one data set
* tidy_data is obtained by using dplyr library and chaining the functions groupby and summarize_all
* ID_mean_std uses the "grepl" function to capture all column names that contains "activityId", "subjectId", "mean.." or "std.." in its description. 
* "gsub" function is used in the "DataWithActivityNames" data set to replace all special chracters from the column names; in this case expecially "()" and "-"

### Output Data
* The resulting ./tidy_data.txt dataset includes mean and standard deviation variables for the following original variables:
* tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag. All three X, Y, Z directions are included.
* The above variables where choosen as they included either mean or std in their original names.
The data is grouped by subject and activity.

