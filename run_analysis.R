
run_analysis <- function(){

  library( dplyr )  
  
  # Read all needed txt files
  
  X_testData <- read.table("C:\\Users\\maajaanu\\Tieto works\\Coursera\\UCI HAR Dataset\\test\\X_test.txt")
  X_trainData <- read.table("C:\\Users\\maajaanu\\Tieto works\\Coursera\\UCI HAR Dataset\\train\\X_train.txt" )
  trainSubjects <- read.table("C:\\Users\\maajaanu\\Tieto works\\Coursera\\UCI HAR Dataset\\train\\subject_train.txt")
  testSubjects <- read.table("C:\\Users\\maajaanu\\Tieto works\\Coursera\\UCI HAR Dataset\\test\\subject_test.txt")
  Y_testData <-  read.table("C:\\Users\\maajaanu\\Tieto works\\Coursera\\UCI HAR Dataset\\test\\Y_test.txt")
  Y_trainData <- read.table("C:\\Users\\maajaanu\\Tieto works\\Coursera\\UCI HAR Dataset\\train\\Y_train.txt")
  
  # Merge Subjects and activities with X train and test data
  
  X_testData_with_subjects_and_activity <- cbind( testSubjects, Y_testData, X_testData )
  X_trainData_with_subjects_and_activity <- cbind( trainSubjects, Y_trainData,  X_trainData )
  
  
  # Merge X test and train data to one file 
  
  X_merged_set <- rbind( X_testData_with_subjects_and_activity, X_trainData_with_subjects_and_activity )
  
  # Read Feature and activity_labels files
  
  features <- read.table("C:\\Users\\maajaanu\\Tieto works\\Coursera\\UCI HAR Dataset\\features.txt")
  activity_labels <- read.table("C:\\Users\\maajaanu\\Tieto works\\Coursera\\UCI HAR Dataset\\activity_labels.txt")
  
  # Remove unused tables
  
  rm( X_testData)
  rm( X_trainData)
  rm(trainSubjects)
  rm(testSubjects)
  rm(Y_testData)
  rm(Y_trainData)
  
  # Add column names
  
  names( X_merged_set)[1] <- "Subject"
  names( X_merged_set)[2] <- "Activity"
  for ( i in 1:( nrow( X_merged_set )) ){
      X_merged_set[i, "Activity" ] <- as.character( activity_labels[ (X_merged_set[i, "Activity" ]),2 ])
  }

  #  Add activity names
  
  j <- 1
  for ( i in 3:563 ) {
         names( X_merged_set )[i] <- as.character( features[ j, 2] )
         j <- j + 1
  }
  
  # Extract columns with mean() and std()
  
  print( extractLines_mean <- grep( "mean\\(\\)", names( X_merged_set )))
  print( extractLines_std <- grep( "std\\(\\)", names( X_merged_set )))
  extractLines_all <- c(1,2)
  extractLines_all <- append( extractLines_all, extractLines_mean )
  extractLines_all <- append( extractLines_all,extractLines_std )
  
  extractLines_all <- sort( extractLines_all )
  X_extracted_data <- X_merged_set[, extractLines_all ]
  
  names( X_extracted_data ) <- gsub("\\(\\)","", names( X_extracted_data ))
  names( X_extracted_data ) <- gsub("-","", names( X_extracted_data ))

  # Group file by subject and activity
  
  grouped_by_subject_and_activity <- group_by( X_extracted_data, "Subject", "Activity" )
  
  # Count mean for each varible in the group
  
  #count_mean <- function(x,y) { summarize( x, avg_mean= mean( y ))}

  # Create second_tidy_set including average for each variable grouped by subject and activity
  
  second_tidy_set <- aggregate( X_extracted_data[, 3:ncol( X_extracted_data )], list( X_extracted_data$Subject, X_extracted_data$Activity), mean ) 
  # Rename columns
  names( second_tidy_set )[ names( second_tidy_set) == "Group.1" ] <- "Subject"
  names( second_tidy_set )[ names( second_tidy_set) == "Group.2" ] <- "Activity"

  
  #second_tidy_set[, 3:ncol(second_tidy_set)] <- aggregate( second_tidy_set[ , 3:ncol(second_tidy_set)], FUN=round(,3) )
  second_tidy_set[, 3:ncol(second_tidy_set)] <- round( second_tidy_set[ , 3:ncol(second_tidy_set)], 3 )
  write.table( second_tidy_set, file = "C:\\Users\\maajaanu\\Tieto works\\Coursera\\secondTidyDataSet.txt", sep=" ", eol = "\n", dec= ".", col.names = TRUE, row.name =FALSE  )
}
