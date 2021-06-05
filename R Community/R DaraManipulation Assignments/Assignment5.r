iris[which(iris$Sepal_Length>2.5),]#iris data frame with Sepal Length>2.5
Sepal_Length_Mean<-sum(iris$Sepal_Length)/nrow(iris)#mean using data frame operations
Sepal_Width_Mean<-sum(iris$Sepal_Width)/nrow(iris)
Petal_Length_Mean<-sum(iris$Petal_Length)/nrow(iris)
Petal_Width_Mean<-sum(iris$Petal_Width)/nrow(iris)
merge(emp,dept,by="Dept_Id")#inner join
merge(emp,dept,by="Dept_Id",all = TRUE)#outer join
merge(emp,dept,by="Dept_Id",all.x = TRUE)#left join
merge(emp,dept,by="Dept_Id",all.y = TRUE)#right join
