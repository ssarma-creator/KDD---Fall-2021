
#First Name:Sudarshana
#Last Name: Sarma
#CWID: 10469063
#Section: A
#Problem: K Nearest Neighbor Classification
#Date:10/15/2021

rm(list=ls())
library(kknn)
# Load the "breast-cancer-wisconsin.data.csv"
cancer<-read.csv("C:/Users/Joey/Downloads/breast-cancer-wisconsin.csv",na.strings = '?')
View(cancer)
table(cancer$Class)

#To factor the data set
cancer$Class <- factor(cancer$Class, levels = c(2,4),labels = c("Benign", "Malignant"))
omit<-na.omit(cancer)
typeof(omit)
View(omit)

#Splitting the data set into testing and training 
idx<-sort(sample(nrow(omit),as.integer(.70*nrow(omit))))
training<-omit[idx,]
test<-omit[-idx,]

#Predicting and fitting the knn model for k=3
prediction_k3 <- kknn(formula=Class~., training, test, k=3,kernel ="rectangular" )
fit <- fitted(prediction_k3)
table(test$Class,fit)

#Predicting and fitting the knn model for k=5
prediction_k5 <- kknn(formula=Class~., training, test, k=5,kernel ="rectangular")
fit <- fitted(prediction_k5)
table(test$Class,fit)

#Predicting and fitting the knn model for k=10
prediction_k10 <- kknn(formula=Class~., training, test, k=10,kernel ="rectangular" )
fit <- fitted(prediction_k10)
table(test$Class,fit)

