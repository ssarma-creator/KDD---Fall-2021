#First Name:Sudarshana
#Last Name: Sarma
#CWID: 10469063
#Section: A
#Problem: Naive Bayes
#Date:10/15/2021

rm(list=ls())
library(e1071)
library(class)
cancer<-read.csv("C:/Users/Joey/Downloads/breast-cancer-wisconsin.csv",na.strings = '?')
View(cancer)
table(cancer$Class)

#To factor the data set
cancer$Class <- factor(cancer$Class, levels = c(2,4),labels = c("Benign", "Malignant"))
omit<-na.omit(cancer)
View(omit)

# Splitting the data set into testing and training
idx<-sort(sample(nrow(omit),as.integer(.70*nrow(omit))))
training<-omit[idx,]
test<-omit[-idx,]

#Implementing Naive Bayes
model<-naiveBayes(Class~.,training)

#Prediction using test 
prediction<-predict(model,test)

#Forming the confusion matrix
confusion_matrix<-table(prediction,test$Class)
confusion_matrix
prop.table(table(prediction,test$Class))

#The error rate 
NB_wrong_prediction<-sum(prediction!=test$Class)
NB_wrong_prediction
wrong_prediction_rate<-NB_wrong_prediction/length(prediction)
wrong_prediction_rate

