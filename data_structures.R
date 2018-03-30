#Vectors----

v1<- c("A","B","C")
v1
class(v1)
v2<- c(1,2,3)
class(v2)
v3<- c(TRUE, FALSE, TRUE)
class(v3)
(v4<- 100:200)
class(v4)
v5=seq(1,10,2)
class(v5)
v4[c(1,3,4)]
v7<- c("A", "C")
v1[v1 %in% v7]
#v1["A"] position not specified
v1[1]


v8<- 1:5
names(v8)<- c("anish","shlok", "jaimin", "bhavya", "nihali")
v8["anish"]
v8[2:4]

#dataframe ----
df<- data.frame(rollno=c(1,2,3),name=c("Rohit","Lalit","Hitesh"),course=c("MBA","BBA","MCA"),dept=c("Dept1","Dept1","Dept2"),marks=floor(runif(3,50,100)))
df
#df=fix(df)
df
str(df)
class(df)
summary(df)

ls()
df$gender <- c("M","M","F")
df$gender<- factor(df$gender)
df
str(df)
tapply(df$marks, df$gender, mean)

