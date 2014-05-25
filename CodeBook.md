# Code Book 

The data is based on training and test data from [UCI]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
on wearable computing. 

To clean up the data, I first merged the training and test set to one data
set, then selected the a subset of the variables, added the variable
names to the data set, and created a new data set. 

## Which data was used? 
In the sub directory "Inertial Signals" are the unprocessed data. For our purposes, 
however, the data set uses the post processed UCI data that employed filters. 
Therefor the "Inertial Signals/\*" files were ignored and only the files
directly in the "./train/\*.txt" and "./test/\*.txt" are used. 


