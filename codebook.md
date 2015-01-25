Getting and Cleaning Data course project
========================================

This codebook describes variables, data, and the transformations performed to obtain the clean data.

The training and test data sets include the following files: 

- features.txt : a 561-feature vector with time and frequency domain variables.
- activity_labels.txt : the ID numbers for the different activities (6 in total) monitored 
- subject_train.txt / subject_test.txt : a list of all the identifiers of the subjects who carried out the experiments. 
- x_train.txt / x_test.txt : triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration;
  triaxial angular velocity from the gyroscope. 
- y_train.txt / y_ text.txt : activity labels describing the activity that was being performed when the measurements were collected (e.g. WALKING)

run_analysis.R will merge the test and training data sets into a single data set,
using the rbind function.

The column names will be set to the list of features provided and the the activity and 
subject ID fields will also be added. 

Because we are only interested in the mean and std measurements - i.e. a subset of 
all available columns - the clean data set is then processed to only extract the columns
containing the words 'mean' and 'std' in their column names, using the grep function.
 
This last step produces a smaller data set. The variable names are then prettified for better 
readability using the gsub function. 

Finally the aggregate function is used to create a final data set with the average of each variable 
for each activity and each subject. 

