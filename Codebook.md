# Codebook.md

## Summarizing Human Activity Recognition Using Smartphones Dataset 

### Study Design

The original data here was obtained from:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

This data comes from the study linked:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#]

From the description of this study:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals BodyAcc-XYZ and GravityAcc-XYZ using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (BodyAccJerk-XYZ and BodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (BodyAccMag, GravityAccMag, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing BodyAcc-XYZ, BodyAccJerk-XYZ, BodyGyro-XYZ, BodyAccJerkMag, BodyGyroMag, BodyGyroJerkMag. 

The dataset in this project contains the average of each of the mean and standard deviation measurements in the original study, grouped across each subject and activity.

### Code book

Variables contained in the output data:

**Subject**

The subject ID.


**Activity**

The activity the subject was doing. It can be one of the following values:

  - LAYING
  - SITTING
  - STANDING
  - WALKING
  - WALKING_DOWNSTAIRS
  - WALKING_UPSTAIRS


**Time Domain Signals**

  - TimeBodyAccMeanX
  - TimeBodyAccMeanY
  - TimeBodyAccMeanZ
  - TimeBodyAccStdDevX
  - TimeBodyAccStdDevY
  - TimeBodyAccStdDevZ
  - TimeGravityAccMeanX
  - TimeGravityAccMeanY
  - TimeGravityAccMeanZ
  - TimeGravityAccStdDevX
  - TimeGravityAccStdDevY
  - TimeGravityAccStdDevZ
  - TimeBodyAccJerkMeanX
  - TimeBodyAccJerkMeanY
  - TimeBodyAccJerkMeanZ
  - TimeBodyAccJerkStdDevX
  - TimeBodyAccJerkStdDevY
  - TimeBodyAccJerkStdDevZ
  - TimeBodyGyroMeanX
  - TimeBodyGyroMeanY
  - TimeBodyGyroMeanZ
  - TimeBodyGyroStdDevX
  - TimeBodyGyroStdDevY
  - TimeBodyGyroStdDevZ
  - TimeBodyGyroJerkMeanX
  - TimeBodyGyroJerkMeanY
  - TimeBodyGyroJerkMeanZ
  - TimeBodyGyroJerkStdDevX
  - TimeBodyGyroJerkStdDevY
  - TimeBodyGyroJerkStdDevZ
  - TimeBodyAccMagMean
  - TimeBodyAccMagStdDev
  - TimeGravityAccMagMean
  - TimeGravityAccMagStdDev
  - TimeBodyAccJerkMagMean
  - TimeBodyAccJerkMagStdDev
  - TimeBodyGyroMagMean
  - TimeBodyGyroMagStdDev
  - TimeBodyGyroJerkMagMean
  - TimeBodyGyroJerkMagStdDev


**Frequency Domain Signals**

  - FrequencyBodyAccMeanX
  - FrequencyBodyAccMeanY
  - FrequencyBodyAccMeanZ
  - FrequencyBodyAccStdDevX
  - FrequencyBodyAccStdDevY
  - FrequencyBodyAccStdDevZ
  - FrequencyBodyAccJerkMeanX
  - FrequencyBodyAccJerkMeanY
  - FrequencyBodyAccJerkMeanZ
  - FrequencyBodyAccJerkStdDevX
  - FrequencyBodyAccJerkStdDevY
  - FrequencyBodyAccJerkStdDevZ
  - FrequencyBodyGyroMeanX
  - FrequencyBodyGyroMeanY
  - FrequencyBodyGyroMeanZ
  - FrequencyBodyGyroStdDevX
  - FrequencyBodyGyroStdDevY
  - FrequencyBodyGyroStdDevZ
  - FrequencyBodyAccMagMean
  - FrequencyBodyAccMagStdDev
  - FrequencyBodyAccJerkMagMean
  - FrequencyBodyAccJerkMagStdDev
  - FrequencyBodyGyroMagMean
  - FrequencyBodyGyroMagStdDev
  - FrequencyBodyGyroJerkMagMean
  - FrequencyBodyGyroJerkMagStdDev


