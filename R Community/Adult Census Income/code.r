input = read.csv("D:/vaibhav/trend nxt/topgear/R Community/adult_census_income/Adult Census Income Binary Classification dataset.csv", header=TRUE)
head(input)
summary(input)
str(input)
input$income2 = ifelse(input$income == " <=50K",0, 1 )
head(input)
input1 = read.csv("D:/vaibhav/trend nxt/topgear/R Community/adult_census_income/Adult Census Income Binary Classification dataset.csv", header=TRUE, na.strings = c(" ?", " "))
na.omit(input1)
head(input1)
summary(input1)
str(input1)
input1$income2 = ifelse(input1$income == " <=50K",0, 1 )
head(input1)
shuffle_index = sample(1:nrow(input1))
head(shuffle_index)
input1 = input1[shuffle_index,]
head(input1)

test_data_size = 0.8
data_size = nrow(input1)
train_sample = 1:(test_data_size*data_size)
train_data = input1[train_sample, ]
test_data = input1[-train_sample, ]

##install if package is not installed
##install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

fit <- rpart(income2 ~ age + workclass + fnlwgt + education + marital.status + occupation + relationship + race + sex + capital.gain + capital.loss + hours.per.week + native.country, data = train_data, method = 'class')
rpart.plot(fit, extra = 106)
predict_unseen <-predict(fit, test_data, type = 'class')
table_mat <- table(test_data$income2, predict_unseen)
table_mat
accuracy_Test <- sum(diag(table_mat)) / sum(table_mat)
accuracy_Test

