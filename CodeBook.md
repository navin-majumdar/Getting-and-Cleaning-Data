Codebook explaining the different variables used and any transformations applied in the "run_analysis.R" script for data cleaning project.

### Input Data
The script assumes the UCI dataset is extracted directly into ./UCI HAR Dataset/. 
See the README.md for further details.

### Variables
* test_subject : contains subject numbers for test observations
* test_x : test data
* test_y : test label data
* train_subject : file for subject numbers for training observations
* train_x : training data
* train_y : train label data
* features : file containing features name
* activity_labels : file containing activity text labels
* mysubject : contains joined list of subjects from train and test observations
* label : contains joined labels for train and test observations
* mylabel : contains textual labels applied to "label" by joining with "activity_labels"
* mydata : contains joined train and test observations
* finaldata : contains total set of observations combined with activity labels and subject numbers
* search : contains column names from "finaldata" which have "-mean" or "-std" in them
* finalsubdata : smaller dataset containing only the mean and std variables
* averages : stores the final result grouped by subject and activity with average value of all features for each group.
* tidy_data.txt : final output of tidy data written to a text file sotred in the working directory

### Transformations
* textual columns heading have been given
* mydata is prepared by doing column bind of observations, activity labels and subject numbers
* averages is obtained by using dplyr library and chaining the functions groupby and summarize_all
* finalsubdata uses the "grep" function to capture all column numbers and column names that contains "mean" or "std" in its description. 
* Once the original feature names are available it uses "gsub" function to replace all special chracters from the text; in this case expecially "()" and "-"

### Output Data
* The resulting ./tidy_data.txt dataset includes mean and standard deviation variables for the following original variables:
* tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag. All three X, Y, Z directions are included.
* The above variables where choosen as they included either mean or std in their original names.
The data is grouped by subject and activity.
