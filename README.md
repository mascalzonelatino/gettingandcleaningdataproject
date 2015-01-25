# gettingandcleaningdataproject

This repository hosts my solution for the Getting And Cleaning Data course project.

The aim of the project is to demonstrate the ability to extract a clean data set from a number of 
raw data sources to be used for later analysis. 

The raw data consists of measurements collected from the accelerometers on Samsung Galaxy S 
smartphones capturing a number of motion states from their users (walking, standing, etc.)  

Here's some more details on the source data:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script you will find in this repository, run_analysis.R, will process the data as follows: 

* the training and the test sets will be merged to create one data set.
* only the measurements on the mean and standard deviation for each measurement will be extracted, producing the "clean data" set.
* from the clean data set, a second data set will finally be created, containing the average of each variable for each activity and each subject. 

The script will also prettify variable and activity names for better readability. 


