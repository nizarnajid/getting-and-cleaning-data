# Code Book

## Information ##

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a 
[Butterworth low-pass filter](http://en.wikipedia.org/wiki/Butterworth_filter) into 
body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain. 



## Data Cleaning details

The following steps are applied to the input data in the script`run_analysis.R`:

     0. Download and read the dataset
     1. Merges the training and the test sets to create one single data set.
     2. Extracts only the measurements on the mean and standard deviation for each measurement. 
     3. Uses descriptive activity names to name the activities in the data set
     4. Appropriately labels the data set with descriptive variable names. 
     5. Creates a second, independent tidy data set with the average of each variable 
         for each activity and each subject.


### Merges the training and the test sets to create one single data set.

The following data files were merged:

* `train/X_train.txt` & `test/X_test.txt`

* `train/subject_train.txt` & `test/subject_test.txt`

* `train/y_train.txt` & `test/y_test.txt`

### Extracts only the measurements on the mean and standard deviation for each measurement. 

To perform this step, we use the file `features.txt`, and extracts only the columns referring to the 
*mean* and the *standard deviation* of each measurement/example.


### Uses descriptive activity names to name the activities in the data set ###

In this step, we use the file `activity_labels.txt`, and replace initial numbers in the data set by activity names:

- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

### Appropriately labels the data set with descriptive variable names. ###

we assign explicit column names to the dataset.


Variables represented by columns in the merged data set:

- "tbodyacc-mean-x" 
- "tbodyacc-mean-y" 
- "tbodyacc-mean-z" 
- "tbodyacc-std-x" 
- "tbodyacc-std-y" 
- "tbodyacc-std-z" 
- "tgravityacc-mean-x" 
- "tgravityacc-mean-y" 
- "tgravityacc-mean-z" 
- "tgravityacc-std-x" 
- "tgravityacc-std-y" 
- "tgravityacc-std-z" 
- "tbodyaccjerk-mean-x" 
- "tbodyaccjerk-mean-y" 
- "tbodyaccjerk-mean-z" 
- "tbodyaccjerk-std-x" 
- "tbodyaccjerk-std-y" 
- "tbodyaccjerk-std-z" 
- "tbodygyro-mean-x" 
- "tbodygyro-mean-y" 
- "tbodygyro-mean-z"
- "tbodygyro-std-y"
- "tbodygyro-std-z"
- "tbodygyrojerk-mean-x"
- "tbodygyrojerk-mean-y"
- "tbodygyrojerk-mean-z"
- "tbodygyrojerk-std-x"
- "tbodygyrojerk-std-y"
- "tbodygyrojerk-std-z"
- "tbodyaccmag-mean"
- "tbodyaccmag-std"
- "tgravityaccmag-mean"
- "tgravityaccmag-std"
- "tbodyaccjerkmag-mean"
- "tbodyaccjerkmag-std"
- "tbodygyromag-mean"
- "tbodygyromag-std"
- "tbodygyrojerkmag-mean"
- "tbodygyrojerkmag-std"
- "fbodyacc-mean-x"
- "fbodyacc-mean-y"
- "fbodyacc-mean-z"
- "fbodyacc-std-x"
- "fbodyacc-std-y"
- "fbodyacc-std-z"
- "fbodyaccjerk-mean-x"
- "fbodyaccjerk-mean-y"
- "fbodyaccjerk-mean-z"
- "fbodyaccjerk-std-x"
- "fbodyaccjerk-std-y"
- "fbodyaccjerk-std-z"
- "fbodygyro-mean-x"
- "fbodygyro-mean-y"
- "fbodygyro-mean-z"
- "fbodygyro-std-x"
- "fbodygyro-std-y"
- "fbodygyro-std-z"
- "fbodyaccmag-mean"
- "fbodyaccmag-std"
- "fbodybodyaccjerkmag-mean"
- "fbodybodyaccjerkmag-std"
- "fbodybodygyromag-mean"
- "fbodybodygyromag-std"
- "fbodybodygyrojerkmag-mean"
- "fbodybodygyrojerkmag-std"

The result is saved as `merged_and_labeled_dataset.txt`. 

### Create the Tidy Dataset

Finally, the script creates a second, and independent **tidy dataset** with the average
of each measurement for each activity and each subject.

Result is saved in the `tidy_dataset.txt` file.
