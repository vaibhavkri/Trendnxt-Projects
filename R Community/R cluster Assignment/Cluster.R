rm(list=ls())
library(cluster)
library(stats)
library(ggplot2)

setwd("C:/Users/va20025797/Desktop/TopGear/R/Assignment 1/")
hotel = read.csv("hotel.csv")
ggplot(data = hotel, aes(x=lon, y=lat, color=district)) + geom_point() + ggtitle("Original") + scale_color_manual(values = c("red","green","blue"))


######### Hierarchical Clustering #########
hc = hclust(dist(hotel[,2:3], method = "euclidean"), method = "complete")

hcut = cutree(hc,3)

cluster = factor(hcut)
ggplot(data = hotel, aes(x=lon, y=lat, color=cluster)) + geom_point() + ggtitle("Hierarchical Clusters") + scale_color_manual(values = c("red","blue","green"))


######### K Means Clustering #########
km = kmeans(hotel[,2:3], centers = 3)
cluster = factor(km$cluster)
ggplot(data = hotel, aes(x=lon, y=lat, color=cluster)) + geom_point() + ggtitle("K Means Clusters") + scale_color_manual(values = c("green","blue","red"))


######### Accuracy ######### 
write("Original","")
table(hotel$district)
write("Hierarchical","")
table(hcut, hotel$district)
write("K Means","")
table(km$cluster, hotel$district)
