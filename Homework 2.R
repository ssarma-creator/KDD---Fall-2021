###############################################
#First Name:Sudarshana
#Last Name: Sarma
#CWID: 10469063
#Section: A
#Problem: Exploratory Data Analysis
#Date:Oct/09/2021
###############################################

#Problem 1

#1.Summarizing each column 
rm(list=ls())
cancer<-read.csv("C:/Users/Joey/Downloads/breast-cancer-wisconsin.data.csv",na.strings = '?')
View(cancer)
summary(cancer)
df<-data.frame(cancer)
View(df)

#2. Identifying missing values
colSums(is.na(df))
which(rowSums(is.na(df))!=0)

#3.Replacing the missing values with the "mean" of the column
#m<-mean(df[['F6']],na.rm=TRUE)
#df[is.na(df$F6)]<-m
for(i in 1:ncol(df)){
  df[is.na(df[,i]), i] <- mean(df[,i], na.rm = TRUE)
}
View(df)
summary(df)

#4.Displaying the frequency table of "Class" vs. F6
table(df$Class,df$F6)

#5.Displaying the scatter plot of F1 to F6, one pair at a time
plot(df$F1, df$F2, main="Scatterplot for F1 and F2 ", xlab="F1 ", ylab="F2 ", pch=19)
plot(df$F2, df$F3, main="Scatterplot for F2 and F3 ", xlab="F2 ", ylab="F3 ", pch=19)
plot(df$F3, df$F4, main="Scatterplot for F3 and F4 ", xlab="F3 ", ylab="F4 ", pch=19)
plot(df$F4, df$F5, main="Scatterplot for F4 and F5 ", xlab="F4 ", ylab="F5 ", pch=19)
plot(df$F5, df$F6, main="Scatterplot for F5 and F6 ", xlab="F5 ", ylab="F6 ", pch=19)

#6.Show histogram box plot for columns F7 to F9
boxplot(df[8:10])
hist(df$F7)
hist(df$F8)
hist(df$F9)

#Problem 2
rm(list=ls())
cancer<-read.csv("C:/Users/Joey/Downloads/breast-cancer-wisconsin.data.csv",na.strings = '?')
df<-data.frame(cancer)
View(df)
omit<-na.omit(df)
View(omit)