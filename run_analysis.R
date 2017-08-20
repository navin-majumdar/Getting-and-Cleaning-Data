# Load necessary R packages
library(data.table)
library(dplyr)

# Load the various datasets and Read data from the files
test_subject <- read.table("./test/subject_test.txt")
test_x <- read.table("./test/X_test.txt")
test_y <- read.table("./test/y_test.txt")

train_subject <- read.table("./train/subject_train.txt")
train_x <- read.table("./train/X_train.txt")
train_y <- read.table("./train/y_train.txt")

features <- read.table("./features.txt")
activity_labels <- read.table("./activity_labels.txt")

# Merge the test and train subject datasets
mysubject <- rbind(test_subject, train_subject)
colnames(mysubject) <- "subject"

# Merge the test and train labels, applying the textual labels
label <- rbind(test_y, train_y)
mylabel <- merge(label, activity_labels, by=1)[,2]

# Merge the test and train main dataset, applying the textual headings
mydata <- rbind(test_x, train_x)
colnames(mydata) <- features[, 2]

# Merge all three datasets
finaldata <- cbind(mysubject, mylabel, mydata)

# Rename column
colnames(finaldata)[2] <- "activity"

# Create a smaller dataset containing only the mean and std variables
search <- grep("-mean|-std", colnames(finaldata))
finalsubdata <- finaldata[,c(1,2,search)]

# Cleanup column names to remove "() -"
colnames(finalsubdata) <- gsub("[()-]","",colnames(finalsubdata))

# Compute the means, grouped by subject/label
averages <- finalsubdata %>% group_by(subject, activity) %>% summarize_all(mean)

# Save the resulting dataset
write.table(averages, file = "./tidy_data.txt", row.names = FALSE)

# Output final dataset
averages