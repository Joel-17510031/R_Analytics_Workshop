A<- c("1.0","1.5","3.0","5.0","3.5","4.5","3.5")
B<- c("1.0","2.0","4.0","7.0","5.0","5.0","4.5")
marks<- data.frame(A,B)
plot(A,B)
marks
?kmeans
cl= kmeans(marks,2)
cl$iter
cbind(marks, cl$cluster)
plot(marks$A, marks$B, pch=10, col=cl$cluster)
cl$centers
points(cl$centers, col=1:2, pch=8, cex=2)
