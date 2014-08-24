---
title: "Readme file for run_analysis.R"
output: html_document
---
##Description

This script is to analyze the Samsung Data of the "Getting and Cleanning Data" class.
Before running the script, please set the working directory to "./UCI HAR Dataset".
This script include five steps from reading the raw data to output the final analysis.

###Step 1: Reading data from txt files.

In this part, training and testing data are imprted seperately. The combination of Train and Test is done in step 2 after the column names are given.

###Step 2: Name each column and combine Train/Test data set

In this part, column names are firstly read from features.txt. Then, all of the columns in both Train and Test data are named followed by extracting the mean and std columns out by searching "mean()" and "std()". After that, the extracted train and Test data are combined.

###Step 3: Descriptive activity names

The ActivityLabel values are replaced according to activity_labels.txt

###Step 4: Descriptive variable names

The name of each column is extracted. "-" is replaced by "_"; parenttheses are removed; "t" and "f" are replaced by "Time_" and "FFT_" respectively. New names are then imported to the data set to replace old names.

###Step 5: Average of each column

The data is subgrouped by subject and activity. Then each column in each subgroup is averaged. The new data set is output into "dataout.txt".

###Code Book

Column 1: ActivityLabel

Column 2: Subject

Column 3-68: Averages of mean and std values in the original data sets grouped by subject and each activity.

- "Time" indicates time domain signals, "FFT" indicates signals after FFT.

- "BodyAcc" and "GravityAcc" denote acceleration signals separated into body and gravity accelerations.

- Signals obtained from gyroscope are indicated by "GyroJeck" (Jeck signals) and "GyroMag" (magnitude signals)

- Mean values and standard deviations are specified by "Mean" and "Std" seperately.

- Directions are noted by "XYZ"


