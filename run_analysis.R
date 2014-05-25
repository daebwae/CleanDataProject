##############################################
#  Johns Hopkins: Getting and Cleaning Data  #  
#                                            #
# Course Project                             #
# Author: Stefan Zapf                        #
#                                            #
# Note: variable, function ... names follow  #
#       Google's R Style Guide               #
##############################################

#######################
# Load libraries 
library(plyr)
library(reshape2)

############################## 
# Set path and URL variables 

# paste0 concats strings 
url.zip <- paste0("https://d396qusza40orc.cloudfront.net/",
                  "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

path.data <- "./data/"
# the subdirecty where the data reside after unzipping them 
path.data.sub <- paste0(path.data, "UCI HAR Dataset/")
path.zip  <- paste0(path.data,"wearable.zip")

# Train data 
path.train <- paste0(path.data.sub, "train/")
path.train.X <- paste0(path.train, "X_train.txt")
path.train.Y <- paste0(path.train, "y_train.txt")
path.train.subject <- paste0(path.train, "subject_train.txt")

# Test data 
path.test <- paste0(path.data.sub, "test/")
path.test.X <- paste0(path.test, "X_test.txt")
path.test.Y <- paste0(path.test, "y_test.txt")
path.test.subject <- paste0(path.test, "subject_test.txt")

# feature descriptions 
path.features <- paste0(path.data.sub, "features.txt")

# activity labels 
path.activities <- paste0(path.data.sub, "activity_labels.txt")
 

################ 
# Download data  

if(!file.exists(path.data)) {
  dir.create(path.data)
}

# use curl to avoid download issues with the SSL connection on Macs 
download.file(url.zip, path.zip, method="curl")

# unzip but make sure not to change existing files
unzip(path.zip, exdir=path.data, overwrite=FALSE)

############################## 
# Read data

# read feature labels which are in the second column of the features file
# the labels are later used as colnames, so we save some casting by reading
# them in as strings 
label.features <- read.table(file=path.features, stringsAsFactors=F)[2]
# for colnames we need a vector rather than a data.frame 
label.features <- as.vector(t(data.features))

# data features 
data.width <- 16
# the number of features is given by the number of labels 
data.number.features <- length(label.features)
data.widths <- rep(data.width, data.number.features)
# increases parseing speed 
data.types  <- rep("numeric" , data.number.features) 

# read in space seperated data files (we could also use read.fwf, but the 
# read.table implementation is much faster)
data.train.X  <- read.table(file=path.train.X, colClasses=data.types)
data.train.Y  <- read.table(file=path.train.Y)
data.train.subject <- read.table(file=path.train.subject) 

data.test.X   <- read.table(file=path.test.X, colClasses=data.types)
data.test.Y   <- read.table(file=path.test.Y)
data.test.subject <- read.table(file=path.test.subject)

# add colnames
label.Y <- "y"
label.subject <- "subjectID"

colnames(data.train.X) <- label.features
colnames(data.train.Y) <- label.Y
colnames(data.train.subject) <- label.subject

colnames(data.test.X) <- label.features
colnames(data.test.Y) <- label.Y
colnames(data.test.subject) <- label.subject
 

############################## 
# Merge test and train set 

# merge the columns of train and test sets 
data.train <- cbind(data.train.subject, data.train.Y, data.train.X)
data.test <- cbind(data.test.subject, data.test.Y, data.test.X)

# merge test and train set with the full variable set
data.full <- rbind(data.train,data.test)

###################################################
# Restrict the variables  to std() and mean() vals

# Filter for std() and mean() to select the right variable names 
vars.sel <- Filter(f=function(x) { grepl("-(mean|std)\\(",x)}, label.features)

# add subject id and label 
vars.sel <- c(label.subject, label.Y, vars.sel)

# restric to selected variables 
data <- data.full[, vars.sel]



##################################
# Add descriptive activity labels 

# read labels 
label.activity <- read.table(file=path.activities)
colnames(label.activity) <- c("y", "activity")

# add activity labels 
data <- join(label.activity, data)

# now that we have activity labels, we drop th numeric representation 
data <- data[, seq(2, ncol(data))]

###########################################################
# Create tidy data set with the average of each variable 
# for each activity and each subject

# melt 
data.summary <- melt(data, id.vars=c("activity","subjectID"))

# summarize
means <- ddply(data.summary, .(activity,subjectID, variable), 
               summarize, mean=mean(value))  

# combine 
data.summary <- dcast(means, activity + subjectID~variable, value.var="mean")

################
# save data set

# I decided to use the same format as the original data file 
write.table(data,file="wearable.txt",sep=" ",row.names=F, quote=F)

# I decided to use the same format as the original data file 
write.table(data.summary,file="tidyWearable.txt",sep=" ",row.names=F, quote=F)