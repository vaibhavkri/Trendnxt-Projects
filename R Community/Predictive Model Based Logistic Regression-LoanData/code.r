# Loading the required libraries
if(!require("caret")) install.packages("caret")
if(!require("e1071")) install.packages("e1071")
if(!require("randomForest")) install.packages("randomForest")
if(!require("caTools")) install.packages("caTools")
if(!require("rpart")) install.packages("rpart")
if(!require("rpart.plot")) install.packages("rpart.plot")
if(!require("ggplot2")) install.packages("ggplot2")
if(!require("gridExtra")) install.packages("gridExtra")
if(!require("mice")) install.packages("mice")
if(!require("quantreg")) install.packages("quantreg")
if(!require("pbkrtest")) install.packages("pbkrtest")
if(!require("VIM")) install.packages("VIM")
if(!require("corrplot")) install.packages("corrplot")
if(!require("RColorBrewer")) install.packages("RColorBrewer")
if(!require("ROCR")) install.packages("ROCR")


set.seed(108)
work_path = "D:/vaibhav/trend nxt/topgear/R Community/Predictive Model Based Logistic Regression-LoanData"
setwd(work_path)
###Loading the csv,data preprocessing###

# Some NAs are coded as empty strings , hence converting them to NA
data <- read.csv("Loan_data.csv", header=T, na.strings=c(""," ","NA"))
original_data=data
head(data)
summary(data)
str(data)
nrow(data)
ncol(data)
any(is.na(data))
sum(is.na(data))
### HAving a look at missing data
md.pattern(data)
aggr_plot <- aggr(data, col=c('Blue','Yellow'), numbers=TRUE, sortVars=TRUE, labels=names(data), cex.axis=.5,cex.numbers=.9, gap=1, ylab=c("Histogram of missing data","Pattern"))

# dropping the ID column
Loan_ID = data$Loan_ID
data$Loan_ID = NULL
data$Credit_History=factor(data$Credit_History)

# Exploratory Analysis (Univariate)
p1= qplot(Gender,data = data,geom="auto")
p2 = qplot(Married, data=data,geom="auto")
p3 = qplot(Dependents,data = data,geom="auto")
p4 = qplot(Education,data = data,geom="auto")
p5 = qplot(Self_Employed,data = data,geom="auto")
p6 = qplot(Credit_History,data = data,geom="auto")
p7 = qplot(Property_Area,data = data,geom="auto")
p8 = qplot(Loan_Status,data = data,geom="auto")
grid.arrange(p1,p2,p3,p4,p5,p6,p7,p8,nrow=3,ncol=3)

# Imputation
NAsubset = data[c("Gender","Married","Dependents","Self_Employed","LoanAmount","Loan_Amount_Term","Credit_History")]
summary(NAsubset)
set.seed(108)
imputed=complete(mice(NAsubset))
data$Gender=imputed$Gender
data$Married=imputed$Married
data$Dependents=imputed$Dependents
data$Self_Employed=imputed$Self_Employed
data$LoanAmount=imputed$LoanAmount
data$Loan_Amount_Term=imputed$Loan_Amount_Term
data$Credit_History=imputed$Credit_History
summary(data)


#####----######

plottable1=table(data$Loan_Status,data$Property_Area)
barplot(plottable1, main="Loan Approval vs Property Area", xlab="Property Area",col=c("LightBlue","LightYellow"),legend=rownames(plottable1),beside = TRUE)
plottable2=table(data$Loan_Status,data$Credit_History)
barplot(plottable2, main="Loan Approval vs Credit History", xlab="Credit History",col=c("LightBlue","LightYellow"),legend=rownames(plottable2),beside = TRUE)
plottable3=table(data$Loan_Status,data$Loan_Amount_Term)
barplot(plottable3, main="Loan Approval v sLoan Amount term", xlab="Loan amount term",col=c("LightBlue","LightYellow"),legend=rownames(plottable3),beside = TRUE)
plottable4=table(data$Loan_Status,data$Self_Employed)
barplot(plottable4, main="Loan Approval vs Self Employed", xlab="Self_Employed",col=c("LightBlue","LightYellow"),legend=rownames(plottable4),beside = TRUE)
plottable5=table(data$Loan_Status,data$Education)
barplot(plottable5, main="Loan Approval vs Education", xlab="Education",col=c("LightBlue","LightYellow"),legend=rownames(plottable5),beside = TRUE)
plottable6=table(data$Loan_Status,data$Dependents)
barplot(plottable6, main="Loan Approval vs Dependents", xlab="Dependents",col=c("LightBlue","LightYellow"),legend=rownames(plottable6),beside = TRUE)
plottable7=table(data$Loan_Status,data$Married)
barplot(plottable7, main="Loan Approval vs Marital Status", xlab="Marriage",col=c("LightBlue","LightYellow"),legend=rownames(plottable7),beside = TRUE)
plottable8=table(data$Loan_Status,data$Gender)
barplot(plottable8, main="Loan Approval vs Gender", xlab="Gender",col=c("LightBlue","LightYellow"),legend=rownames(plottable8),beside = TRUE)

# Correlation Analysis
numeric_features= data[c("ApplicantIncome","CoapplicantIncome","LoanAmount","Loan_Amount_Term")]
corTable=cor(numeric_features)
corTable
corrplot( cor(as.matrix(numeric_features), method = "pearson", use = "complete.obs") ,is.corr = FALSE, type = "lower", order = "hclust", tl.col = "black", tl.srt = 360)

# applicant income and loan amount correlated
# Feature Engineering
# Add a new feature has a coapplicant
coAppIn=data$CoapplicantIncome
for(i in data$CoapplicantIncome){
	data$CoapplicantIncome[data$CoapplicantIncome!=0.00] = 1.00
	}
data$Coapplicant= as.factor(data$CoapplicantIncome)
# data$CoapplicantIncome= coAppIn
## Training & Testing Set
set.seed(108)
split=sample.split(data$Loan_Status,SplitRatio = .7)
train=subset(data,split==T)
test=subset(data,split==F)

## Model Building & CV Using GLM
Status=glm(Loan_Status~Married+LoanAmount+Credit_History+Property_Area,data=train,family="binomial")
predGlm=predict(Status,type="response",newdata=test)
summary(Status)
# Computing accuracy
table(test$Loan_Status,predGlm>.5)
(27+123)/(27+123+31+4)
set.seed(108)
# Decision Tree Model
numFolds = trainControl( method = "cv", number = 10 )
cpGrid = expand.grid( .cp = seq(0.01,0.5,0.01)) 
train(Loan_Status~Married+LoanAmount+Credit_History+Property_Area,data=train,method="rpart",trControl=numFolds,tuneGrid=cpGrid)
decisionTreeModel=rpart(Loan_Status~Married+LoanAmount+Credit_History+Property_Area,data=train,method="class",cp=.37)
rpart.plot(decisionTreeModel,extra=104, box.palette="GnBu",branch.lty=3, shadow.col="gray", nn=TRUE)
## CV with rpart
predDT=predict(decisionTreeModel,newdata = test,type = "class")
table(test$Loan_Status,predDT)
# Accuracy
(27+123)/(27+123+31+4)

# RF Model
set.seed(108)
randomForestModel=randomForest(Loan_Status~Married+LoanAmount+Credit_History+Property_Area,data=train,ntree=50,nodesize=10)
predictRF=predict(randomForestModel,newdata=test)
table(test$Loan_Status,predictRF)
# Accuracy
(29+122)/(29+122+29+5)

# AUC Calculation
glm_ROC=predict(Status,test,type="response")
pred_glm=prediction(glm_ROC,test$Loan_Status)
perf_glm=performance(pred_glm,"tpr","fpr")

dt_ROC=predict(decisionTreeModel,test)
pred_dt=prediction(dt_ROC[,2],test$Loan_Status)
perf_dt=performance(pred_dt,"tpr","fpr")

RF_ROC=predict(randomForestModel,test,type="prob")
pred_RF=prediction(RF_ROC[,2],test$Loan_Status)
perf_RF=performance(pred_RF,"tpr","fpr")

auc_glm <- performance(pred_glm,"auc")
auc_glm <- round(as.numeric(auc_glm@y.values),3)
auc_dt <- performance(pred_dt,"auc")
auc_dt <- round(as.numeric(auc_dt@y.values),3)
auc_RF <- performance(pred_RF,"auc")
auc_RF <- round(as.numeric(auc_RF@y.values),3)
print(paste('AUC of Logistic Regression:',auc_glm))
print(paste('AUC of Decision Tree:',auc_dt))
print(paste('AUC of Random Forest:',auc_RF))

# ROC Curves
plot(perf_glm, main = "ROC curves for the models", col='blue')
plot(perf_dt,add=TRUE, col='red')
plot(perf_RF, add=TRUE, col='green3')
legend('bottom', c("Logistic Regression", "Decision Tree", "Random Forest"), fill = c('blue','red','green3'), bty='n')

