library(ISLR)
attach(Default)
head(Default)
dim(Default)
summary(Default)
logit<- glm(default ~ income + balance +student, family="binomial", data=Default)
summary(logit)

library(dplyr)
# genertaing testing data
ndata<- (slice(Default,seq(0,n(),500)))
ndata

# seing the percentage of student 
prop.table(table(Default$default,Default$student))
addmargins(prop.table(table(Default$default,Default$student)))

# seeing the propability of prediction on testing data
predicted_values<- predict(logit, newdata=ndata, type="response")
# column binding predicted values to original data
cbind(ndata,predicted_values)
# Add the predict as Yes/No based on prediced values
ndata %>% mutate(predict=ifelse(predicted_values<0.5,"No","Yes"))
