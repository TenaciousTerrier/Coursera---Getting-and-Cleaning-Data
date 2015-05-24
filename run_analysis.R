# Thomas Hepner
# Coursera: Getting and Cleaning Data
# Course Project 2
# 5/24/2015

setwd('C:/Users/thep3_000/Desktop/Coursera/Getting and Cleaning Data')
rm(list = ls())

# 1. Read Data Sets and Merge Training and Test Data Sets
subject_test = read.table('subject_test.txt')
X_test = read.table('X_test.txt')
Y_test = read.table('y_test.txt')
data = cbind(subject_test, Y_test, X_test)
remove(subject_test, X_test, Y_test)

subject_train = read.table('subject_train.txt')
X_train = read.table('X_train.txt')
Y_train = read.table('Y_train.txt')
train = cbind(subject_train, Y_train, X_train)
data = rbind(data, train)
remove(subject_train, Y_train, X_train, train)

# 2. Label with Descriptive Variable Names
names(data)[1:3] = c("subject", "activity_labels", "V1")
features =  read.table('features.txt')
names(data)[3:563] = as.character(features[,2])

# 3. Means and Standard Deviations for each Measurement
means = apply(data[, 3:563], 2, FUN = mean)
st_devs = apply(data[, 3:563], 2, FUN = sd)

# 4. Rename activity labels
data$activity_labels = ifelse(data$activity_labels == 1, "WALKING", data$activity_labels)
data$activity_labels = ifelse(data$activity_labels == 2, "WALKING UPSTAIRS", data$activity_labels)
data$activity_labels = ifelse(data$activity_labels == 3, "WALKING DOWNSTAIRS", data$activity_labels)
data$activity_labels = ifelse(data$activity_labels == 4, "SITTING", data$activity_labels)
data$activity_labels = ifelse(data$activity_labels == 5, "STANDING", data$activity_labels)
data$activity_labels = ifelse(data$activity_labels == 6, "LAYING", data$activity_labels)

# 5. Create tidy data set
tidy = aggregate(data[3:563], by = list(data$subject, data$activity_labels), FUN = mean)
names(tidy)[1:2] = c("subject", "activity_labels")
write.table(tidy, file = "tidy.txt", row.names = FALSE)
