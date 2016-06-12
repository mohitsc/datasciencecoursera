setwd("C:/Users/Mohit/Google Drive/Mohit/Data Science/DataCleaning/UCI HAR Dataset")

library("dplyr")
library("tidyr")

# import main training dataset
trainData <- tbl_df(read.table("./train/x_train.txt", header = FALSE))

#import features dataset; this dataset contains names for training dataset
features <- read.table("features.txt")
names(trainData) <- features$V2

#import subject labels and append them to train dataset to identify data for the 30 subjects in the study
subjectTrain <- tbl_df(read.table("./train/subject_train.txt"))
trainData$SubjectLabel <- subjectTrain$V1

# import train labels that have code for each activity type
trainLabels <- read.table("./train/y_train.txt")
names(trainLabels) <- c("ActivityLabel")

# import and rename activity labels for training data
trainTypes <- read.table("activity_labels.txt")
names(trainTypes) <- c("ActivityLabel", "Activity")




