install.packages("ggplot2")
library("ggplot2")

data <- c(179718,41370,41914,44280)
labels <- c("Army","Navy","Air Force","Marine")
piePercentage <- round(100*data/sum(data), 1)
pie(data,labels = piePercentage,radius=0.99,main = "Traumatic Brain Injury 2000-2014(Q2)",col = c("Red","Blue","Green","Yellow"),clockwise = "True")
legend("left", c("Army","Navy","Air Force","Marine"), cex = 0.8,
       fill = c("Red","Blue","Green","Yellow"))
