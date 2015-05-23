# This script will create a tidy data file following the five steps 
# detailed in the project.

# If you'd like to reduce the memory footprint while this data is being 
# processed, set the cleanUp variable to c(TRUE, TRUE, TRUE, TRUE, TRUE).
# It's currently set to all FALSE so that, when you run it, you can verify 
# all steps have been completed properly. cleanUp[X] is used at 
# the end of step X to remove items in memory that aren't used in step X+1. 
# (My mother raised me to clean up after myself. Happy Mother's Day!)
cleanUp <- c(FALSE, FALSE, FALSE, FALSE, FALSE)

# 1.- Merge the training and the test sets to create one data set.

# This script assumes that the script is in the same folder as the data 
# for this project. I.E. The "train" and "test" folders  and the files 
# "activity_labels.txt", "features.txt", etc. should be in the
# same folder as this script.

library(plyr); library(dplyr)

# Starting with the training data, let's add labels and subjects.

trainingDataSet <- read.table("train/X_train.txt", sep="")

trainingDataSetLabels <- read.table("train/y_train.txt", sep="")
names(trainingDataSetLabels)[1] <- "A"
trainingDataSet <- cbind(trainingDataSetLabels, trainingDataSet)

trainingDataSetSubjects <- read.table("train/subject_train.txt", sep="")
names(trainingDataSetSubjects)[1] <- "S"
trainingDataSet <- cbind(trainingDataSetSubjects, trainingDataSet)

# We do the same with the test data, adding labels and subjects

testDataSet <- read.table("test/X_test.txt", sep="")

testDataSetLabels <- read.table("test/y_test.txt", sep="")
names(testDataSetLabels)[1] <- "A"
testDataSet <- cbind(testDataSetLabels, testDataSet)

testDataSetSubjects <- read.table("test/subject_test.txt", sep="")
names(testDataSetSubjects)[1] <- "S"
testDataSet <- cbind(testDataSetSubjects, testDataSet)

# Now we merge them

combinedDataSet <- rbind(testDataSet, trainingDataSet)

if (cleanUp[1]) {
  remove(testDataSet, testDataSetLabels, testDataSetSubjects, 
       trainingDataSet, trainingDataSetLabels, trainingDataSetSubjects)
}

# 2.- Extract only the measurements on the mean and standard deviation for 
# each measurement. 

# First, we should add the column names we have for these.

columnNamesFile <- read.table("features.txt", sep="")
columnNames <- as.character(columnNamesFile[, 2])

# Add the two column names we added to the training and test data sets,
# and are now in the combined data set.
columnNames <- c("Subject", "ActivityId", columnNames)
names(combinedDataSet) <- columnNames

# Now, we keep only the variables (columns) that have either "-mean()", 
# "-std()", "ActivityId" or "Subject" in their names

extractedColumnNames <- grep("-mean\\(\\)|-std\\(\\)|ActivityId|Subject",
                             columnNames)
extractedDataSet <- combinedDataSet[extractedColumnNames]

# Clean up!
if (cleanUp[2]) {
    remove(columnNamesFile, columnNames, combinedDataSet, extractedColumnNames)
}

# 3.- Use descriptive activity names to name the activities in the data set

# Let's make sure the activities are named instead of numbered.

activityNames <- read.table("activity_labels.txt", sep="", 
                                col.names=c("ActivityId", "Activity")) 
extractedDataSet <- merge(extractedDataSet, activityNames, by="ActivityId")

activityDataSet <- extractedDataSet[ ,
                        -which(names(extractedDataSet) %in% c("ActivityId"))]

#Clean up!
if (cleanUp[3]) {
    remove(activityNames, extractedDataSet)
}

# 4.- Appropriately label the data set with descriptive variable names. 

# The current names are kind of ugly, so I'll create a function ...

cleanUpNames <- function(columnName) {
    # Change "-mean()" to "Mean"
    columnName <- gsub("-mean\\(\\)", "Mean", columnName) 
    # Change "-std()" to "StdDev"
    columnName <- gsub("-std\\(\\)", "StdDev", columnName) 
    # Remove "-"
    columnName <- gsub("[-]", "", columnName)  
    # Columns that start with "f" should instead start with "Frequency"
    columnName <- gsub("^f", "Frequency", columnName)  
    # Columns that start with "t" should instead start with "Time"
    columnName <- gsub("^t", "Time", columnName)  
    # Change "BodyBody" to "Body"
    columnName <- gsub("BodyBody", "Body", columnName)
    
    columnName
}

# ... and lapply it to the extractedDataSet

activityDataSetColumns <- names(activityDataSet)
names(activityDataSet) <- lapply(activityDataSetColumns, cleanUpNames)

# Clean up!
if (cleanUp[4]) {
    remove(activityDataSetColumns, cleanUpNames)
}

# 5.- From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# plyr/dplyr is an immense help here.
# Apply the function colMeans across all columns that are not "Subject" 
# and "Activity", subsetted by each pair of Subject * Activity

tidyDataSet <- ddply(activityDataSet, .(Subject, Activity), 
              .fun = function(x) { colMeans(x[, 
          -which(names(activityDataSet) %in% c("Subject", "Activity"))])} )

# Clean up!
if (cleanUp[5]) {
    remove(activityDataSet)
}

remove(cleanUp)

write.table(tidyDataSet, "tidyData.txt", row.name = FALSE)


