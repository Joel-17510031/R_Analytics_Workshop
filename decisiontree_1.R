rollno <-paste(c("S"),1:30,sep="")
rollno
set.seed(12)
gender<- sample(x=c("Male","Female"), size=30, replace=T, prob= c(0.4,0.6))
gender
play<- sample(x=c("Play","Not Play"), size=30, replace=T, prob= c(0.3,0.7))
play

student<- data.frame(gender,play)
student
row.names(student)<- rollno

summary(student)
table(student)


#model1 decision tree
library(rpart)
#M1<- rpart(play~gender, data=student)
#M1<- rpart(play~gender, data=student, minsplit=4, minbucket=2)
#M1
library(rpart.plot)
#rpart.plot(M1, main="Classification Tree", nn=T)

predict(M1, newdata = data.frame(gender=c("Male","Female","Male")))

# add Married colum

set.seed(45)
married<- sample(x=c("Married","Unmarried"),size=30, replace=T, prob=c(0.4,0.6))

student2<- data.frame(gender, married, play)
student2
## Second Decision Tree
M2<- rpart(play ~ gender + married, data=student2, minsplit=5)
M2

rpart.plot(M2, type=2, extra=104 , tweak=1.2, under=T, shadow=c("brown","green","red"), main="2nd Classification Tree", nn=T)


gender_test<- sample(x=c("Male","Female"), size=5, replace=T, prob= c(0.5,0.5))
married_test<- sample(x=c("Married","Unmarried"), size=5, replace=T, prob= c(0.5,0.5))

test_df<- data.frame(gender_test,married_test)
colnames(test_df)<- c("gender","married")
test_df
predict(M2, newdata=test_df)

