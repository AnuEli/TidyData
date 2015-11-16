Second_tidy_data_set description

Variables in the file:

Subject
	Id of the subject. Values 130.
Activity
   Character string having one of the following values:
   WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING.  LAYING

    Note:eAll following columns are type float and include average (mean) counted for each variable grouped by subject & activity.

tBodyAccmeanX
    Float, including the average (mean) counted for tBodyAccmeanX variable grouped by subject & activity.
tBodyAccmeanY
    Float, including the average (mean) counted for tBodyAccmeanYvariable grouped by subject & activity.
tBodyAccmeanZ
    Float, including the average (mean) counted for variable grouped by subject & activity.
tBodyAccstdX
    Float, including the average (mean) counted for variable grouped by subject & activity.
tBodyAccstdY
	  Same as earlier….
tBodyAccstdZ
tGravityAccmeanX
tGravityAccmeanY
tGravityAccmeanZ
tGravityAccstdX
tGravityAccstdY
tGravityAccstdZ
tBodyAccJerkmeanX
tBodyAccJerkmeanY
tBodyAccJerkmeanZ
tBodyAccJerkstdX
tBodyAccJerkstdY
tBodyAccJerkstdZ	
tBodyGyromeanX
tBodyGyromeanY
tBodyGyromeanZ
tBodyGyrostdX	
tBodyGyrostdY
tBodyGyrostdZ
tBodyGyroJerkmeanX
tBodyGyroJerkmeanY
tBodyGyroJerkmeanZ
tBodyGyroJerkstdX
tBodyGyroJerkstdY
tBodyGyroJerkstdZ
tBodyAccMagmean()
tBodyAccMagstd()
tGravityAccMagmean()
tGravityAccMagstd()
tBodyAccJerkMagmean()
tBodyAccJerkMagstd()
tBodyGyroMagmean()
tBodyGyroMagstd()
tBodyGyroJerkMagmean()
tBodyGyroJerkMagstd()
fBodyAccmeanX
fBodyAccmeanY
fBodyAccmeanZ
fBodyAccstdX
fBodyAccstdY
fBodyAccstdZ
fBodyAccJerkmeanX
fBodyAccJerkmeanY
fBodyAccJerkmeanZ
fBodyAccJerkstdX
fBodyAccJerkstdY
fBodyAccJerkstdZ
fBodyGyromeanX
fBodyGyromeanY
fBodyGyromeanZ
fBodyGyrostdX
fBodyGyrostdY
fBodyGyrostdZ
fBodyAccMagmean
fBodyAccMagstd
fBodyBodyAccJerkMagmean
fBodyBodyAccJerkMagstd
fBodyBodyGyroMagmean
fBodyBodyGyroMagstd
fBodyBodyGyroJerkMagmean
fBodyBodyGyroJerkMagstd
      
Transformations for the data

First the given files were read to data tables and then subjects (subject_test.txt/ subject_train.txt) and activities (Y_test.txt/Y_train.txt) files were merged with test (X_test.txt) and training  (Xtrain.txt) data. Next the training and test data tables were merged.
Next, labels were added for subject and activity columns and measurement labels were added for the measurements from the features.txt file. Also activity ids (intergers) were replaced by describing names/character string like 1 -> “WALKING”.
Mean and standard measurement were extracted from the data table by grep() by searching for column names including “mean()” or “std()”. Results were stored to the data table “X_extracted_data”.
The following marks were removed from the labels: ‘(‘, ‘)’, ‘-‘  to help future processing.
The data was grouped by subject and activity and average/mean was calculated for each group by aggregate() function. Results were stored to the data frame “Second_tidy_set” and that was written to the file “Second_tidy_set.txt”.

Enter file contents here
