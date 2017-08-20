# Load necessary R packages
library(data.table)
library(dplyr)

# Read the data of train
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Read the data of test
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Read the features info
features <- read.table("./UCI HAR Dataset/features.txt")

# Read the activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Assign column names for the train tables 
colnames(x_train) <- features[, 2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

# Assign column names for the test tables
colnames(x_test) <- features[, 2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

# Assign column names for activity labels table
colnames(activity_labels) <- c("activityId", "activityType")

# Merge the training and the test sets to create one data set
merged_train <- cbind(y_train, subject_train, x_train)
merged_test <- cbind(y_test, subject_test, x_test)
mergedData <- rbind(merged_train, merged_test)

# Extract only the measurements on the mean and standard deviation for each measurement

# Read column names
colNames <- colnames(mergedData)

# Create a vector for measurements defining ID, mean and std
ID_mean_std <- (grepl("activityId", colNames) |
                 grepl("subjectId", colNames) |
                 grepl("mean..", colNames) |
                 grepl("std..", colNames)
                 )
# Subset the measurements of mean and std from mergedData
DataForMeanAndStd <- mergedData[, ID_mean_std == TRUE]

# Use descriptive activity names to name the activities in the data set
DataWithActivityNames <- merge(DataForMeanAndStd,
                               activity_labels,
                               by = 'activityId',
                               all.x = TRUE
                               )

# Cleanup column names to remove "() -"
colnames(DataWithActivityNames) <- gsub("[()-]","",colnames(DataWithActivityNames))

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- DataWithActivityNames %>% group_by(subjectId, activityId, activityType) %>% summarise_all(mean)

# Save the resulting dataset
write.table(tidy_data, file = "./UCI HAR Dataset/tidy_data.txt", row.names = FALSE)