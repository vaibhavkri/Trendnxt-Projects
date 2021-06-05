#Data understanding:
setwd("D:/vaibhav/trend nxt/topgear/R Community/Data_Science_with_R")
#1.Import dataset
data <- read.csv(file="Steel_data.csv",header=TRUE,sep=",") 

#2.View 5 rows of data
head(data, 5) 

#3.See the structure and summary of the dataset
str(data)
summary(data)

#4.Number of numerical and categorical values
table(sapply(data, class))



#Data Preparation : Data Cleaning
#1.Remove duplicate values
#Total rows for the dataset
nrow(data)

#Removing duplicates
data<-unique(data)

#Total rows after removing duplicates
nrow(data)


#2.Checking type of data
str(data)

#As formability ,bore and width have wrong types changing them
data$formability <- as.factor(data$formability)
data$bore <- as.factor(data$bore)
data$width <- as.integer(data$width)

#Making sure they have been changed
str(data)


#3.Missing value treatment 
#Check colums having missing values
colSums(data == "?")

#Deleting columns with more number of missing values
data <- data[, -c(1,6,10:11,13:31,36,38)]


#Chagning remaining missing values with NA for proper treatment
data[data == "?"] <- NA


#Checking which variables have NA values
colSums(is.na(data))

#applying Label encoding on categorical varibales
data$product_type <- factor(data$product_type, levels="C", labels = "1")
data$steel <- factor(data$steel, levels = c("A","K","M","R","S","V","W"),
                     labels = c(1,2,3,4,5,6,7))
data$condition <- factor(data$condition, levels=c("A","S"), labels = c(1,2))
data$surface_quality <- factor(data$surface_quality, levels = c("D","E","F","G"),
                               labels = c(1,2,3,4))
data$shape <- factor(data$shape, levels=c("COIL","SHEET"), labels = c(1,2))
data$classes <- factor(data$classes, levels = c("1","2","3","5","U"), labels = c("1","2","3","5","4"))


#As steel has 70 condition has 270 and formability has 280 and surface_quality has 216 rows with NA values
#we will apply imputation for these columns

#As we generally use mode values hence writing a function to calculate the same
getmode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

c
tempmode <- 0
for (i in 1:ncol(data))
{
  print(c("round",i))
  if (sum(is.na(data)) != 0)
  {
    
    tempmode <- getmode(data[,i])
    print(tempmode)
    data[,i] <- replace(data[,i], which(is.na(data[,i])),tempmode)
  }
}

# Cross varifying Mode value imputation completed
colSums(is.na(data))
str(data)


#4.Outlier Treatment

#Make a subset of the dataset with all the numeric variables
numeric_data <- data[unlist(lapply(data, is.integer))]

#Checking the subset
head(numeric_data,5)


#print the summary of the subset
summary(numeric_data)
boxplot(numeric_data, use.cols=TRUE)


#Outlier detection:

#importing library scales
library(scales)

#Loop trough each column in the subset and treat outliers
for (cnt in 1:ncol(numeric_data))
{
  print(cnt)
  
  #getting outlier values
  print(numeric_data[, cnt][which(numeric_data[,cnt] %in% boxplot.stats(numeric_data[,cnt])$out)])
  
  #cap and floor and replace outlier values with the appropriate values
  numeric_data[, cnt] <- squish(numeric_data[, cnt], quantile(numeric_data[, cnt], c(.05, .95)))
}


#cross verifying  summary after the outlier treatment
summary(numeric_data)
str(numeric_data)
boxplot(numeric_data, use.cols=TRUE)



#Data Preparation Feature Engineering:
#1.Feature Transformation
#checking correlation
response <- cor(numeric_data ,method = c("pearson", "kendall", "spearman"))
cor(numeric_data)


library(corrplot)
corrplot(response, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45)
plot(numeric_data)


comboInfo <- findLinearCombos(numeric_data)
comboInfo

descrCor <- cor(numeric_data)
#checking the correlation result
highCorr <- summary(descrCor[upper.tri(descrCor)])
highCorr['Min.'] 
highCorr['Max.']
# finding the highly correlated variables 
highlyCorDescr <- findCorrelation(descrCor, cutoff = .75)
highlyCorDescr # There is no highly correlated variables

#Numerical variables are not in linear relationship


#2.Standardization
library(caret)

# calculate the pre-process parameters from the dataset
preprocessParams <- preProcess(numeric_data[,1:5], method=c("center", "scale"))
# summarize transform parameters
print(preprocessParams)
# transform the dataset using the parameters
transformed <- predict(preprocessParams, numeric_data[,1:5])
# summarize the transformed dataset
summary(transformed)



#3.Dummy encoding
typeof(data$steel)
dummies <- dummyVars( ~ steel, data = data)
result <- head(predict(dummies, newdata = data))

#checking no of dummy variables
ncol(result)
#steel variable has been encoded to total 7 other variables after imputation with mode

#close output file
sink()