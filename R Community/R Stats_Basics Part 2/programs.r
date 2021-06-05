#1

#perform the ANOVA and save the results to plantanova
plantanova<-aov(weight~group, PlantGrowth)

#view the ANOVA data
anova(plantanova)

#p-value = 0.0159. p-value is less than the significance level of 0.05, So we can reject the null hypothesis that the mean growth is the same for all treatments.

#p-value = 0.0159.This means that, if the effect of all three treatments were the same, we would have less than 2% chance of seeing differences between groups as large or larger than this

coef(plantanova)

#Control treatment gives an average weight of 5.032. The effect of treatment 1 (trt1) is to reduce weight by an average of -0.371 units compared to the control method, and the effect of treatment 2 (trt2) is to increase weight by an average of 0.494 units compared to the control method.

#2

bottles<-read.csv("bottles.csv")
ks.test(bottles$Volume, "pnorm", 500, 25)

#The p-value for the one-sample Kolmogorov-Smirnov test is 0.2108. As this is not less than the significance level of 0.05, we can not reject the null hypothesis. This means that there is no evidence that the bottle volumes are not drawn from the normal distribution.

#3

dbinom(2,10,1/6)
#The probability of throwing exactly two sixes, when a fair die is rolled 10 times is 0.29071 or 29.071%

#4

dpois(18,20)
# the probability that exactly eighteen lobsters will be ordered tomorrow is 8.4%

#5

airquality_dataset<-as.data.frame(airquality)
summary(airquality_dataset)
airquality_dataset=na.omit(airquality_dataset)

max_data<-apply(airquality_dataset,2,max)
min_data<-apply(airquality_dataset,2, min)
data_scaled<-scale(airquality_dataset,center=min_data,scale=max_data-min_data)
summary(data_scaled)

#6

airquality_dataset<-as.data.frame(airquality)
summary(airquality_dataset)
airquality_dataset=na.omit(airquality_dataset)

mean_data<-apply(airquality_dataset, 2, mean)
std_data<-apply(airquality_dataset, 2, sd)

data_scaled<-scale(airquality_dataset, center=mean_data, scale=std_data)
summary(data_scaled)