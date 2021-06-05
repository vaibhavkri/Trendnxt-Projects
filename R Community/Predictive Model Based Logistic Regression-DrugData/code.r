# Loading libraries
if(!require("randomForest")) install.packages("randomForest")
if(!require("caTools")) install.packages("caTools")
if(!require("rpart")) install.packages("rpart")
if(!require("caret")) install.packages("caret",dependencies = T)
if(!require("rpart.plot")) install.packages("rpart.plot")
if(!require("ggplot2")) install.packages("ggplot2")
if(!require("gridExtra")) install.packages("gridExtra")
if(!require("mice")) install.packages("mice")
if(!require("quantreg")) install.packages("quantreg")
if(!require("pbkrtest")) install.packages("pbkrtest")
if(!require("VIM")) install.packages("VIM")
if(!require("corrplot")) install.packages("corrplot")
if (!require("RColorBrewer")) install.packages("RColorBrewer")
if (!require("ROCR")) install.packages("ROCR")
if(!require("party")) install.packages("party")

set.seed(108)
work_path = "D:/vaibhav/trend nxt/topgear/R Community/Predictive Model Based Logistic Regression-DrugData"
setwd(work_path)

# Loading & cleaning the dataset
data <- read.csv("Drug_data.csv", header=T, na.strings=c(""," ","NA"))
data$X=NULL
data<-data[!(is.na(data$ID)),] #  Last row is empty
original_data=data
head(data)
data$X=NULL
summary(data)
str(data)
nrow(data)
ncol(data)
any(is.na(data))
sum(is.na(data))

# HAving a look at missing data
md.pattern(data)
aggr_plot <- aggr(data, col=c('LightBlue','LightYellow'), numbers=TRUE, sortVars=TRUE, labels=names(data), cex.axis=.5,cex.numbers=.9, gap=1, ylab=c("Histogram of missing data","Pattern"))

# Replacing the NAs
hist(data$AGE)
boxplot(data$AGE)
Age =subset(data, is.na(data$AGE)== F,select=c(AGE))$AGE
range(Age)
mean(Age)
m=median(Age)
data$AGE[is.na(data$AGE)] = m

# cleaning further
data$ID= NULL
data$RACE= as.factor(data$RACE)
data$DFREE=as.factor(data$DFREE)

# Exploratory Analysis

plottable1=table(data$DFREE,data$IVHX)
barplot(plottable1, main="Drug Free vs IV Drug use History", xlab="Drug Use History",col=c("LightGreen","Grey"),legend=rownames(plottable1),beside = TRUE)
plottable2=table(data$DFREE,data$RACE)
barplot(plottable2, main="Drug Free vs Race", xlab="Race",col=c("LightGreen","Grey"),legend=rownames(plottable2),beside = TRUE)
plottable3=table(data$DFREE,data$Sex)
barplot(plottable3, main="Drug Free vs SEX", xlab="SEX",col=c("LightGreen","Grey"),legend=rownames(plottable3),beside = TRUE)
plottable4=table(data$DFREE,data$SITE)
barplot(plottable4, main="Drug Free vs Treatment Site", xlab="Treatment Site",col=c("LightGreen","Grey"),legend=rownames(plottable4),beside = TRUE)

# Correlation Analysis
numeric_features= data[c("AGE","BECK","NDRUGTX")]
corTable=cor(numeric_features)
corTable
corrplot( cor(as.matrix(numeric_features), method = "pearson", use = "complete.obs") ,is.corr = FALSE, type = "lower", order = "hclust", tl.col = "black", tl.srt = 360)

# Splitting the Data
set.seed(108)
split=sample.split(data$DFREE,SplitRatio = .7)
train=subset(data,split==T)
test=subset(data,split==F)

## Model Building & CV 

# Before selecting attributes, we try to check the attributes significance
cf1 <- cforest(DFREE ~. , data=train, control=cforest_unbiased(mtry=2,ntree=50)) 
varimp(cf1) # get variable importance, based on mean decrease in accuracy

# GLM
model1=glm(DFREE~.-SITE-Sex-RACE,data=train,family = binomial)
predGlm=predict(model1,type="response",newdata=test)
summary(model1)
# Computing accuracy
table(test$DFREE,predGlm>.5)
(127+0)/(127+0+1+44)

# Decision Tree Model
set.seed(108)
numFolds = trainControl( method = "cv", number = 10 )
cpGrid = expand.grid( .cp = seq(0.01,0.5,0.01)) 
train(DFREE~AGE,data=train,method="rpart",trControl=numFolds,tuneGrid=cpGrid)
decisionTreeModel=rpart(DFREE~AGE,data=train,method="class",cp=.01)
rpart.plot(decisionTreeModel,extra=104, box.palette="GnBu",branch.lty=3, shadow.col="gray", nn=TRUE)
# Accuracy of Decision Tree
predDT=predict(decisionTreeModel,newdata = test,type = "class")
table(test$DFREE,predDT)
# Accuracy
(127+1)/(127+1+1+43)

# Random Forest
set.seed(108)
randomForestModel=randomForest(DFREE~.-SITE-Sex-RACE,data=train,ntree=100,nodesize=18)
predictRF=predict(randomForestModel,newdata=test)
table(test$DFREE,predictRF)
# Accuracy of RF
(126+3)/(126+3+2+41)

# AUC Calculation
glm_ROC=predict(model1,test,type="response")
pred_glm=prediction(glm_ROC,test$DFREE)
perf_glm=performance(pred_glm,"tpr","fpr")

dt_ROC=predict(decisionTreeModel,test)
pred_dt=prediction(dt_ROC[,2],test$DFREE)
perf_dt=performance(pred_dt,"tpr","fpr")

RF_ROC=predict(randomForestModel,test,type="prob")
pred_RF=prediction(RF_ROC[,2],test$DFREE)
perf_RF=performance(pred_RF,"tpr","fpr")

auc_glm <- performance(pred_glm,"auc")
auc_glm <- round(as.numeric(auc_glm@y.values),3)
print(paste('AUC of Logistic Regression:',auc_glm))

auc_dt <- performance(pred_dt,"auc")
auc_dt <- round(as.numeric(auc_dt@y.values),3)
print(paste('AUC of Decision Tree:',auc_dt))

auc_RF <- performance(pred_RF,"auc")
auc_RF <- round(as.numeric(auc_RF@y.values),3)
print(paste('AUC of Random Forest:',auc_RF))

# ROC Curves
plot(perf_glm, main = "ROC curves for the models", col='blue')
plot(perf_dt,add=TRUE, col='red')
plot(perf_RF, add=TRUE, col='green3')
legend('bottom', c("Logistic Regression", "Decision Tree", "Random Forest"), fill = c('blue','red','green3'), bty='n')

