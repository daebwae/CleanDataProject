# Johns Hopkins: Getting and Cleaning Data

## File Structure 
* CodeBook.md: details of the data set 
* run\_analysis.R: R file that downloads the data and tidies it 
* .gitignore: the data directory will not be uploaded because the script
              downloads the data automatically  
* README.md: this file 

## How to create the tidy data set 
Just open up the "run\_analysis.R" in R studio or your favorite 
R editor. Run the code. 

The code will download the UCI wearable computing data and store it 
in the "./data" directory. It then reads the training and testing 
data set files. They are tidied up and two data sets are created 
as R variables: 

* data: contains the full set of observationss
* data.summary: contains the means for each variable by subject and activity

The script then saves the "data.summary" as "tidyWearable.txt" and
"data" as "wearable.txt" in your working directtory. The datsets are saved
as a comma-delimited files just as the original data. 

## Copyright Note 
The data that is used in this script is all based on work by:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

You can find their data [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 
