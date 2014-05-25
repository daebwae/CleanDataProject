# Johns Hopkins: Getting and Cleaning Data

## File Structure 
* CodeBook.md: details of the data set 
* tidyWearable.txt: space-delimited tidy data set 
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

The script then saves the "data.summary" datset as a comma-delimited
data file int he directory wher you run your script. 


