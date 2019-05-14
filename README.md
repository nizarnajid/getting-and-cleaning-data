Getting and Cleaning Data - Coursera Project
==============


## Description ##

The purpose of this project is to demonstrate the ability to collect, work with, and clean a 
data set. 
The goal is to prepare tidy data that can be used for later analysis.  

The following elements are expected to be done in order to validate the assignment:
    1) a tidy data set as described below;
    2) a link to a Github repository with your script for performing the analysis; 
    3) a Code book that describes the variables, the data, and any transformations performed 
    to clean up the data called.

### Data Description:
The data considered for the Project represent data collected from the 
accelerometers from the Samsung Galaxy S smartphone.

A full description is available at the web site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]().

The whole data package can be downloaded at the following link:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]()

## Data Analysis ##

In order to use this data cleaning project, you must perform the following steps:

* Clone this repository into a folder on the local machine:
    `git clone https://github.com/nizarnajid/getting-and-cleaning-data` 

*  Set the Working Directory to the folder where the Git repository has been cloned:

    
* Source the `run_analysis.R` script: 

        source("run_analysis.R")

  Sourcing the `run_analysis.R` script will perform the actual analysis. In particular:
     - Download and read the Dataset
     - Merges the training and the test sets to create one single data set.
     - Extracts only the measurements on the mean and standard deviation for each measurement. 
     - Uses descriptive activity names to name the activities in the data set
     - Appropriately labels the data set with descriptive variable names. 
     - Creates a second, independent tidy data set with the average of each variable 
         for each activity and each subject.

  After performing the analysis, the following files will be created:

    - `merged_and_labeled_dataset.txt` 
    - `tidy_dataset.txt` 
 