# run_analysis.R - create a Tidy dataset from the data in the UCI HAR Dataset

# Load libraries
library(reshape)
library(dplyr)

# Column Names
actIdx <- "actIdx"
actName <- "Activity"
featColIdx <- "featColIdx"
featColName <- "featColName"
subIdx <- "SubjectID"
# Output file
tidyFilename <- "TidyDF.txt"
# Read activity Labels
actLabelDF<-read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c(actIdx, actName), header=FALSE, strip.white=TRUE)
# Read activity Labels
featColHeaderDF<-read.table("./UCI HAR Dataset/features.txt", col.names=c(featColIdx, featColName), header=FALSE, strip.white=TRUE)
# Filter to only the columns whose name contains "-mean()-" or "-std()-"
featMorSCols <- featColHeaderDF[grep("\\-mean\\(\\)-|\\-std\\(\\)-", featColHeaderDF$featColName),featColName]

# 1. Merge data from training and test sets
# Test Data files
#   Read in an X file
testValDF<-read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, strip.white=TRUE)
#   fix the columnnames
colnames(testValDF) = featColHeaderDF[,2]
#   Read in an Y file
testActDF<-read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c(actIdx), header=FALSE, strip.white=TRUE)
#   Read in the subject file
testSubDF<-read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c(subIdx), header=FALSE, strip.white=TRUE)
#   Combine test DFs
testDF <- cbind(testSubDF, testActDF, testValDF)
#
# Training Data files
#   Read in an X file
trainValDF<-read.table("./UCI HAR Dataset/train/X_train.txt", col.names=featColHeaderDF[, 2], header=FALSE, strip.white=TRUE)
#   fix the columnnames
colnames(trainValDF) = featColHeaderDF[,2]
#   Read in an Y file
trainActDF<-read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c(actIdx), header=FALSE, strip.white=TRUE)
#   Read in the subject file
trainSubDF<-read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c(subIdx), header=FALSE, strip.white=TRUE)
#   Combine train DFs
trainDF <- cbind(trainSubDF, trainActDF, trainValDF)
#
# Put the training and test frames together
fullDF <- rbind(trainDF, testDF)

# Step 2. Extract only the measurements on the mean and standard deviation for each measure
#   Added subject index, account index to  and mean/std columns
MandS.Cols <- append(actIdx, as.vector(featMorSCols),1  )
MandS.Cols <- append(subIdx, MandS.Cols,1 )
MandS.DF <- fullDF[MandS.Cols]

# Step 3. Use descriptive activity names to  name the activities in the data set
#   Add an activity name column to the data frame
MandS.DF <- merge(MandS.DF, actLabelDF, by="actIdx", type="left")

# Step 4. Appropriate lobels for data set with descriptive variable names
# I tried to pick descent default nanmes for the columns such as "Activity" and "SubjectId"
# Clean up measurement names.  Replace "mean()" with "Mean" and "std()" with "Std".
names(MandS.DF) <- gsub("std()", "Std", names(MandS.DF), fixed=TRUE)
names(MandS.DF) <- gsub("mean()", "Mean", names(MandS.DF), fixed=TRUE)
# As stated in features_into.txt, column names of the form t* are time-domain values and column names of the form f* 
#  are frequency domain based.  In addition, this code added the columns, actIdx for activity Index, subIdx for subject Index, 
#  and actName for activityName

# Step 5. Create Tidy dataframe
TidyStep1DF <- MandS.DF
#   Drop actIdx column since we already have the Activity column
TidyStep1DF$actIdx <- NULL
#   Melt the data to get measurements and values.  This will convert the dataframe from a wide table of the structure
#   SubjectID, Activity, measurement1, measurement2, ... to a narrow and tall table of the structure Subject ID,
#   Activity, variable, value.  Each of the measurement names appears in the variable column, and the associated value in the 
#   value column
TidyStep2DF <- melt(TidyStep1DF, id=c(subIdx, actName))
#   compute and add a mean column for each measurement grouped by the keys in order (SubjectID, Activity, Variable). The 
TidyDF <- aggregate(value ~ SubjectID + Activity + variable, TidyStep2DF, mean )
#   rename some of the columns to make it easier to understand what has happened
TidyDF <- rename(TidyDF, Measurement=variable, MeanOfMeasurement = value)

#  Write Tidy DF to a file 
write.table(TidyDF, tidyFilename, row.names=FALSE)