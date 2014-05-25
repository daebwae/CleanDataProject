# Code Book 

The data is based on training and test data from [UCI]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
on wearable computing. The source data set is about a study in which
participants recorded their activity levels via their phones' sensors. 
Researchers watched the participants' activities via video footage and 
labeled each observation with an activity like "walking". 
This can be used to understand whether the wearable computer sensors 
can be used to determine the wearer's current activity. 

To clean up the data, I first merged the training and test set to one data
set, then selected a subset of the variables, added the variable
names to the data set, and created a new data set. 

## Which data was used? 
In the sub directory "Inertial Signals" are the unprocessed data. For our purposes, 
however, the data set uses the post processed UCI data that employed filters. 
Therefore the "Inertial Signals/\*" files were ignored and only the files
directly in "./train/\*.txt" and "./test/\*.txt" are used. 

## What variables are excluded? 
Only the mean and standard deviation of each measurement is used. For 
example for the body acceleration only the mean ("fBodyAcc-mean()-\*")
and standard deviation ("fBodyAcc-std()-\*") are used. In particular 
the "fBodyAcc-meanFreq()-\*" is not used because this is the mean 
frequency of the measurement, i.e. how often a value was 
measured on average, rather than the mean of the values of the 
measurements. 

## What variables are included? 
The variables in the data set are a subset of the variables of the [UCI]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
data set on wearable computing. Included in the data set are the mean
values and the standard deviation of the following measurements: 

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* ttBodyGyro-XYZ
* ttBodyGyroJerk-XYZ
* ttBodyAccMag
* ttGravityAccMag
* ttBodyAccJerkMag
* ttBodyGyroMag
* ttBodyGyroJerkMag
* tfBodyAcc-XYZ
* tfBodyAccJerk-XYZ
* tfBodyGyro-XYZ
* tfBodyAccMag
* tfBodyAccJerkMag
* tfBodyGyroMag
* fBodyGyroJerkMag

The -XYZ variables have three separate variables for each axis of
three-dimensional space. Additionally each of these variables has 
two seperate entries for both their mean and the standard deviation
which are named -mean() and -std() respectively. 


## Two Datasets 
When you run the R script "run\_analysis.R" two data sets 
are generated and saved in your working directory (see README.md for
details on the format). 

Both datasets share the variables above but they differ in the 
number of observations. 

### Dataset: data (wearable.txt)
This data set contains all observations. It is the basis on which 
the tidy data set was generated. 

### Dataset: data.summary (tidyWearable.txt) 
This data set summarizes the "data" dataset (wearable.txt) by activity 
and subject. For each participant and their activity, the mean value 
of the sensor data of the wearable computer's measurements is recorded. 

This could be used to determine whether the different activities have 
significant differences in the sensors' mean values to correctly label 
the activity. 

