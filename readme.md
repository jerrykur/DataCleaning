Cleaning Data Course Project
============================

Introduction
------------

This project operates of a dataset containing information about the activies of users.  The information was gathered by equiping subjects with smartphones that tracked the user while they performed the following activities: LAYING, SITTING, STANDING, WALKING, WALKING_UPSTAIRS, and WALKING_DOWNSTAIRS.  During each of these activies various measurements were obtained and added to the data set.

The code in the project users R to read this data and created a tidy dataset from the data.  To create this tidy data set the following processing steps were performed :

	1.	Merge the training and test data set to create one data set.
	  The original data was provided in a series of files.  During this step the data in the files were combined to create a single data frame.  The data frame from had a column for the Subject ID, Activity ID, and each measurement of the activity. 
	2.	Extract only the measurements of the mean and standard deviation of each measurement.  
	In this step another data frame was created which eliminated all measurement columns except those containing mean and standard deviation data.
	3.	User descriptive activity names to name the activities in the data set.  
	In this step a new column was add to the data set that contained the Activity description associated with the Activity ID.
	4.	Appropiately label the dataset with descriptive variable names.
	 During this step, minor renaming of the measurement columns was performed. Also, the Activity ID column was dropped since we already had an Activity Name column.
	5. 	From data set in step 4, create a second, independent tidy data set with the average of each activity variable for each activity and each subject.
	In this step the data was "melted" from a "short and wide" data set with dozens of column of values for each measurement to a "tall and skinny" dataset that containing only 4 columns for the SubjectID, ActivtyName, Measurement name and associated value. Structurally this changed the data set from 10299 rows with 50 columns to 494352 rows with 4 columns.  I prefer tall and skinny because they are operated on faster in databases and if you have a lot of columns you may exceed the maximum row width for the database.  
	As a final bit of processing, the mean was computed for each subjectID, Activity, Measurement group and stored in the output data frame.  This final data frame still had four columns, but only 8640 rows.  Also, the value column and measurement columns were renamed.  The final column names are "SubjectId", "Activity", "Measurement", and "MeanOfMeasurement"


 
This repository contains the following files :

	*	readme.md - this readme file
	*	run_analysis.R - R program that implements the processing steps described above.  See comments for additional processing details
	*	CodeBook.md - an .md format file that describes the data in the final Tidy data set.
	*	TidyDF.txt - final tidy data produced by ReadFiles.R
	*	UCI HAR Dataset - folder containing the UCI HAR data files used as the source data.

