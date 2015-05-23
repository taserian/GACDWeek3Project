# Human Activity Recognition Using Smartphones Data Set

This is the Getting and Cleaning Data Week 3 course assignment. It involves processing the files corresponding to the Human Activity Recognition Using Smartphones Data Set that was built from recordings of 30 subjects performing activities of dailiy living while carrying a waist-mounted smartphone with embedded inertial sensors.

The original data here was obtained from:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

This data comes from the study linked:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#]

This script makes the following assumptions:

- This script assumes that the script is in the same folder as the data for this project. I.E. The "train" and "test" folders  and the files "activity_labels.txt", "features.txt", etc. should be in the same folder as this script.
- The working directory should be set to the location of the script and data.

In order to extract the tidy data, run the script in the same. It will save the results to a file called "TidyData.txt".

The script does the following:

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements having to do with the mean and standard deviation.
  3. Uses descriptive activity names to name the activities in the data set
  4. Labels the data set with descriptive variable names.
  5. Creates a tidy data set with the average of each variable for each activity and each subject.

As an aside, there is a variable added near the top of the script named cleanUp. It doesn't affect the extraction of "TidyData.txt" or change it in any way, but if you are interested in seeing the intermediate datasets that are created in order to derive "TidyData.txt", you can change the value of this variable.


To see all the intermediate datasets:
```
cleanUp <- c(FALSE, FALSE, FALSE, FALSE, FALSE)
```

To clean up everything so that only *tidyDataSet* remains:
```
cleanUp <- c(TRUE, TRUE, TRUE, TRUE, TRUE)
```

The locations in the vector correspond to steps 1-5 above; to clean up after everything except the last step:
```
cleanUp <- c(TRUE, TRUE, TRUE, TRUE, FALSE)
```


# References:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.