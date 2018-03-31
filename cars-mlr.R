mtcars
names<- colnames(mtcars)
M1<- lm(mpg ~  disp + cyl + hp + drat +wt + qsec + carb, data=mtcars)
M1
summary(M1)
M2<- lm(mpg ~ disp + cyl + wt, data=mtcars)
M2
summary(M2)
compare<- anova(M2,M1)
compare
M3<- lm(mpg ~ cyl +wt,data=mtcars)
M3
summary(M3)
anova(M3,M2)
library(MASS)
M1a<- lm(mpg ~ disp + cyl + hp + drat +wt +qsec +carb, data=mtcars)
M1a
summary(M1a)
step=stepAIC(M1a,direction="both")
stepAIC

library(olsrr)
M<- lm(mpg ~ disp + hp + wt + qsec, data=mtcars)
k<- ols_step_all_possible(M)
plot(k)
k
