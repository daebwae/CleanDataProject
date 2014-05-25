##############################################
#  Johns Hopkins: Getting and Cleaning Data  #  
#                                            #
# Course Project                             #
# Author: Stefan Zapf                        #
#                                            #
# Note: variable, function ... names follow  #
#       Google's R Style Guide               #
##############################################


####################
# Getting the Data 

url.zip <- paste0("https://d396qusza40orc.cloudfront.net/",
                  "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

path.data <- "./data/"
path.zip  <- paste0(path.data,"wearable.zip")

if(!file.exists(path.data)) {
  dir.create(path.data)
}

# use curl to avoid download issues with the SSL connection on Macs 
download.file(url.zip, path.zip, method="curl")
unzip(path.zip,overwrite=T)



