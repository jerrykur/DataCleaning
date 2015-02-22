CodeBook for Course Project
===========================

Purpose
-------
The file TidyDF.txt contains the results produced by the script run_analysis.R.
This script reads data UCI HAR Dataset outputs, combines data, filters to only
have mean and standard deviation values.  This data is output into a data frame TinyDF

TinyDF is structured as a "tall and skinny" Data Frame.  That is, it contains 
few columns and contain columns Data Name and value pairs. In TidyDF the 
Data Names are "Measurement" column and their cooresponding values are in the
"MeanOfMeasurement" column.

Data Description
----------------

Below are the descriptions of the fields found in the Tidy data set located in TidyDF.txt.  

*SubjectID* - number - a number uniquely identifying the subject. Values from 1 to 30.

*Activity* - character - a string describing the activity. Valid values are: LAYING, SITTING, STANDING, WALKING, WALKING_UPSTAIRS, and WALKING_DOWNSTAIRS

*Measurement*- character - a string describing the measurement.  The format of the description is:
1st character (t = time-domain data or f = frequency domain data), 2nd to first dash "-" description of measurement such as "BodyAccJerkMag" for Body Acceleration Jerk Magnitide, following first dash, measurement statistic "Mean" = mean or "Std" = standard deviation.  Following the second dash the measurement axis (X, Y, or Z).  Note: The "Measurement" name is the same as the original study's field with "mean()" replaced by "Mean" and "std()" replaced by "Std".  See below for a list of "Measurement" values for which the mean as calculated. 

*MeanOfMeasurement* - number - Mean value of all measurements with the same SubjectID, Activity, and Measurement.  For example MeanOfMeasurement for the row containing SubjectID=1, Activity="SITTING", and Measurement="tBodyAcc-Mean-X" is the mean for all measurements.

A numeric mean was calculated for the following fields:
"tBodyAcc-Mean-X"      "tBodyAcc-Mean-Y"      "tBodyAcc-Mean-Z"      "tBodyAcc-Std-X"      
 "tBodyAcc-Std-Y"       "tBodyAcc-Std-Z"       "tGravityAcc-Mean-X"   "tGravityAcc-Mean-Y"   "tGravityAcc-Mean-Z"   "tGravityAcc-Std-X"   
"tGravityAcc-Std-Y"    "tGravityAcc-Std-Z"    "tBodyAccJerk-Mean-X"  "tBodyAccJerk-Mean-Y"  "tBodyAccJerk-Mean-Z"  "tBodyAccJerk-Std-X"  
"tBodyAccJerk-Std-Y"   "tBodyAccJerk-Std-Z"   "tBodyGyro-Mean-X"     "tBodyGyro-Mean-Y"     "tBodyGyro-Mean-Z"     "tBodyGyro-Std-X"     
"tBodyGyro-Std-Y"      "tBodyGyro-Std-Z"      "tBodyGyroJerk-Mean-X" "tBodyGyroJerk-Mean-Y" "tBodyGyroJerk-Mean-Z" "tBodyGyroJerk-Std-X" 
"tBodyGyroJerk-Std-Y"  "tBodyGyroJerk-Std-Z"  "fBodyAcc-Mean-X"      "fBodyAcc-Mean-Y"      "fBodyAcc-Mean-Z"      "fBodyAcc-Std-X"      
"fBodyAcc-Std-Y"       "fBodyAcc-Std-Z"       "fBodyAccJerk-Mean-X"  "fBodyAccJerk-Mean-Y"  "fBodyAccJerk-Mean-Z"  "fBodyAccJerk-Std-X"  
"fBodyAccJerk-Std-Y"   "fBodyAccJerk-Std-Z"   "fBodyGyro-Mean-X"     "fBodyGyro-Mean-Y"     "fBodyGyro-Mean-Z"     "fBodyGyro-Std-X"     
"fBodyGyro-Std-Y"      "fBodyGyro-Std-Z" 

