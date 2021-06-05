library(dplyr)
filter(iris,iris$Sepal_Length>2.5)#Sepal_Length>2.5
summarise(iris,mean(iris$Sepal_Length), mean(iris$Sepal_Width),mean(iris$Petal_Length),mean(iris$Petal_Width)) #mean
filter(emp,emp$Dept_Id==dept$Dept_Id)
inner_join(emp,dept,by="Dept_Id")
left_join(emp,dept,by="Dept_Id")
right_join(emp,dept,by="Dept_Id")
full_join(emp,dept,by="Dept_Id")
