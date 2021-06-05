sqldf(
  "select avg(Sepal_Length) as Sepal_Length_Mean, avg(Sepal_Width) as Sepal_Width_Mean
  ,avg(Petal_Length) as Petal_Length_Mean,avg(Petal_Width) as Petal_Width_Mean from iris"
)
print(c(mean(iris$Sepal_Length),mean(iris$Sepal_Width),mean(iris$Petal_Length),mean(iris$Petal_Width)))

