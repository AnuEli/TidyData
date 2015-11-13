# TidyData
Course Project work for Coursera

Script run_analysis.R

Script ran_analysis.R does all the functionalities listed in the project work.
First the given files were read to data tables and then subjects (subject_test.txt/ subject_train.txt) and activities (Y_test.txt/Y_train.txt) files were merged with test (X_test.txt) and training  (X-train.txt) data tables (cbind). Then train data table and test data table were merged by rbind()

Next, labels were added for subject and activity columns and measurement labels were added for the measurements from the features.txt file. Also activity ids (integers) were replaced by describing names/character string like 1 -> “WALKING”.

Mean and standard measurement were extracted from the data table by grep() by searching for column names including “mean()” or “std()”. Results were stored to the data table “X_extracted_data”.

The following marks were removed from the labels: ‘(‘, ‘)’, ‘-‘  to help future processing.

The data was grouped by subject and activity and average/mean was calculated for each group by aggregate() function. Results were stored to the data frame “Second_tidy_set” and that was written to the file “Second_tidy_set.txt”.

