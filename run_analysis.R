
# Store the parent folder name here in one place so it's easy to change if you need to 
SOURCE_DATA_FOLDER <- "UCI HAR Dataset"

# Load all the data in preparation for the merge 
train_data_x <- read.table(paste(SOURCE_DATA_FOLDER,"/train/X_train.txt", sep = ""))
train_data_y <- read.table(paste(SOURCE_DATA_FOLDER,"/train/y_train.txt", sep = ""))
train_data_subject <- read.table(paste(SOURCE_DATA_FOLDER,"/train/subject_train.txt",sep=""))

test_data_x <- read.table(paste(SOURCE_DATA_FOLDER,"/test/X_test.txt",sep=""))
test_data_y <- read.table(paste(SOURCE_DATA_FOLDER,"/test/y_test.txt",sep=""))
test_data_subject <- read.table(paste(SOURCE_DATA_FOLDER,"/test/subject_test.txt",sep=""))

features <- read.table(paste(SOURCE_DATA_FOLDER,"/features.txt",sep=""))

activity_types <- read.table(paste(SOURCE_DATA_FOLDER,"/activity_labels.txt",sep=""))

# Merge the test and training data into a single table  
data <- rbind(train_data_x,test_data_x)
activity_labels <- rbind(train_data_y,test_data_y)
subjects <- rbind(train_data_subject,test_data_subject)

# Set the column names for the merged data set to the ones in the feature table  
names(data) = features[[2]]

# Extract the 'clean data', i.e. only the measurements on the mean and standard deviation for each measurement
means_column_numbers <- grep("mean",features[[2]])
std_column_numbers <- grep("std",features[[2]])
means_and_std_columns <- unique(c(means_column_numbers,std_column_numbers)) 
clean_data <- data[means_and_std_columns]

# Add 'activity' and 'subject' to the merged data set  
names(subjects) = c("subject")
names(activity_labels) = c("activity_label")
names(activity_types) = c("activity_label","activity_type")
activity <- merge(activity_types,activity_labels,"activity_label")
clean_data$activity <- activity[[2]]
clean_data$subject <- subjects[[1]]

# Prettify the variable names: remove '-' , capitalize mean and std (Mean and Std), and get rid of the '()'   
names(clean_data) <- gsub("-","",names(clean_data))
names(clean_data) <- gsub("\\(\\)","",names(clean_data))
names(clean_data) <- gsub("std","Std",names(clean_data))
names(clean_data) <- gsub("mean","Mean",names(clean_data))

# This is not required but if you find it useful to have the subject and activity IDs before the feature columns, 
# you can enable this line here to prepend the last two columns to the beginning of the data frame  
# clean_data <- clean_data[c(81,80,1:79)]

# We can write the first table to file now 
write.table(clean_data, "clean_data.txt")

