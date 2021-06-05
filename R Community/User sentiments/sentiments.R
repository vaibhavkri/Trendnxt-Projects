
rm(list=ls())
library(tm)
library(sentimentr)
library(RCurl)
library(syuzhet)
library(stringr)
library(ggplot2)
library(httr)

dat = readLines("data.txt")
scriptcorpus = Corpus(VectorSource(dat))



scriptcorpus

meta(scriptcorpus[[1]])

as.character(scriptcorpus[[1]])
writeLines(as.character(scriptcorpus[[1]]))	# for the \n


getTransformations()

# [1] "removeNumbers"     "removePunctuation" "removeWords"      
# [4] "stemDocument"      "stripWhitespace"


scriptcorpus = tm_map(scriptcorpus, removePunctuation)
scriptcorpus = tm_map(scriptcorpus, removeNumbers)
# if content_transformer is not used in the next line, you lose the 
# file names in the DTM!
scriptcorpus = tm_map(scriptcorpus, content_transformer(tolower))
scriptcorpus= tm_map(scriptcorpus, removeWords, stopwords("english"))

writeLines(as.character(scriptcorpus[[2]]))
writeLines(as.character(scriptcorpus[[3]]))


# scriptcorpus[[1]]=removeWords(scriptcorpus[[1]],c('RT','QT','https'))
# scriptcorpus[[2]]=removeWords(scriptcorpus[[2]],c('RT','QT','https'))
# scriptcorpus = tm_map(scriptcorpus, removeWords, 
#                       c(stopwords("english"), "blockchain", "bitcoin", 
#                         "will","one",
#          "â???Ts","like","think", "also","donâ???Tt","ans", "using",
#            "can", "see","get","â???Ts","interviewee"))

scriptcorpus.dtm = DocumentTermMatrix(scriptcorpus)
nrow(scriptcorpus.dtm)
ncol(scriptcorpus.dtm)

# finding frequencies of terms

findFreqTerms(scriptcorpus.dtm, 5,9)

dtm2 = as.matrix(scriptcorpus.dtm)
freq = colSums(dtm2)
freq = sort(freq, decreasing=T)
high_frequecywords=head(freq,150)
hist(high_frequecywords)
class(high_frequecywords)

# finding word associations using correlations

findAssocs(scriptcorpus.dtm, "wood", 0.999)
# controlling sparsness
# removeSparseTerms(x, sparse):
# remove terms that have more than sparse percent of 0 freq cells
# 
# scriptcorpus.dtm.sparse = removeSparseTerms(scriptcorpus.dtm, 0.10)
# ncol(scriptcorpus.dtm.sparse)
# 
# inspect(scriptcorpus.dtm.sparse)


# Explore documents
some_doc=as.character(scriptcorpus) #need to add other files like 
#scriptcorpus[[2]]
length.some_doc <- length(some_doc)
length.some_doc

# Cleaning 1-  remove people name, RT text etc. 

some_txt1 = gsub("(RT|via)((?:\\b\\W*@\\w+)+)","",some_doc)

# Cleaning 2- remove html links
some_txt2 = gsub("http[^[:blank:]]+", "", some_doc)

# Cleaning 3- remove people names

some_txt3 = gsub("@\\w+", "", some_doc)

# Cleaning 4- remove Punctuations 

some_txt4 = gsub("[[:punct:]]", " ", some_doc)

# Cleaning 5- remove alphanumeric words

some_txt5 = gsub("[^[:alnum:]]", " ", some_doc)


# Creating wordcorpus and cleaning

some_txt6 <- Corpus(VectorSource(some_txt5))
some_txt6 <- tm_map(some_txt6, removePunctuation)
some_txt6 <- tm_map(some_txt6, content_transformer(tolower))
some_txt6 <- tm_map(some_txt6, removeWords, stopwords("english"))
some_txt6 <- tm_map(some_txt6, stripWhitespace)

# Sentiment Analysis




# Running on our data
scriptcorpus1=as.character(some_txt6)
mysentiment <- get_nrc_sentiment(scriptcorpus1)
SentimentScores <- data.frame(colSums(mysentiment[,]))
names(SentimentScores) <- "Score"
SentimentScores <- cbind("sentiment" = rownames(SentimentScores), SentimentScores)
rownames(SentimentScores) <- NULL
ggplot(data = SentimentScores, aes(x = sentiment, y = Score)) +
  geom_bar(aes(fill = sentiment), stat = "identity") +
  theme(legend.position = "none") +
  xlab("Sentiment") + ylab("Score") + ggtitle("Total Sentiment Score Based on Dataset")




































