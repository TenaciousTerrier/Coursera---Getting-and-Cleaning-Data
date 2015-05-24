==================================================================
Coursera
Getting and Cleaning Data
Course Project
==================================================================
Thomas Hepner
==================================================================

This file describes how the run_analysis.R file produces the tidy data set.
======================================

STEP 1: 
The R script reads in the data files from the Human Activity Recognition Using Smartphones Data Set. 

First, it reads in the test data sets, (1) subject_test, (2) Y_test, (3) X_test. Then it combines them columnwise. 

Secondly, it reads in the training data sets, (2) subject_train, (2) Y_train, (3) X_train. It then combines these columnwise. 

Lastly, it combines the new test and train data sets rowwise. 

STEP 2: 
Labels the column names with the names contained in the features.txt file. 

STEP 3: 
Creates two new data frames (1) means, (2) st_devs. The means data frame contains the means of all 561 measured variables in the dataset. 
The st_devs data frame contains the standard deviations of all 561 measured variables in the data. 

STEP 4: 
Rename the activity_labels column to Walking, Walking Upstairs, etc. instead of the 1-6 numerical system. 

STEP 5: 
Create and write the tidy data set. 