library(ISLR)
attach(Default)
head(Default)
dim(Default)
summary(Default)
logit<- glm(default ~ income + balance +student, family="binomial", data=Default)
logit
