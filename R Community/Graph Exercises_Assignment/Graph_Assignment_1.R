# Graph Excersize -1

######################## # Question 1 #######################################

#Use below data and create donut chart as shown in below figure.

# data = c(179718,41370,41914,44280


datainit = c(179718,41370,41914,44280)

#307282

(Army =(179718/307282)*100)

(Navy = (41370/307282)*100)

(Marines= (44280/307282)*100)

(Air_Force= (41914/307282)*100)



# load library
library(ggplot2)

# Create test data.
data<- data.frame(
  category=c("Army", "Navy ", "Marines","Air_Force"),
  count=c(58.48 , 13.46,14.413,13.641)
)
#E7B800
#"#00AFBB" "Red" "#FC4E07""#CC4E09"

# Compute a good label
data$label <- paste0(data$category,data$count,"%")
library(ggpubr)

ggdonutchart(data, "count", label = data$label,
             fill = "category", color = "white",
             palette = c("cyan2", "Red", "Blue","green") )


# Show group names and value as labels
#?paste0
#labs <- paste0(data$category,data$count,"%")
p=ggdonutchart(data, "count", label = data$label,
               fill = "category", color = "white",
               palette = c("cyan2", "Red", "Blue","green"))


# Change the position and font color of labels
p=ggdonutchart(data, "count", label = data$label,
               lab.pos = "out", lab.font = "Black",
               fill = "category", color = "white",
               palette = c("cyan2", "Red", "Blue","green"))



ggplot(data, aes(x = 2, y = count, fill = category)) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y", start = 0)+
  geom_text(aes(y = data$count, label = paste0(data$category,data$count, "%")), color = "Black")+
  scale_fill_manual(values = data$count) +
  theme_void() +
  xlim(.5, 2.5) +
  annotate(geom = 'text', x = 0.5, y = 0, label = "hello wrld")

p+
  annotate(geom = 'text',
           x = 0.5, y = 0.0001, label = "Traumatic Brain Injury:2000-2014")

############################## question -2 ##############################


# The Iraq body count is a database that maintains records of
# violent civilian deaths since 2003. The heat map clearly should
# show that the most civilian 
# deaths occurred in the 2006-2008 period and it declined thereafter


install.packages("pheatmap") 
library(pheatmap) 
irq= read.csv("iraqbdc.csv", header= TRUE, sep=",")
rownames(irq)=irq$yearsirq= data.matrix(irq) 
irq= data.matrix(irq[,2:13])
pheatmap(irq, cluster_row= FALSE, cluster_col= FALSE, main ="Iraq Body Count")

####################### Q-2  ANother Method    ###################################
iraq= read.csv("iraqbdc.csv")

View(iraq)
class(iraq)

a= iraq
library(lubridate)

#a$years=lubridate::year(a$years)

#a$years=as.POSIXlt.numeric(a$years,origin="1970-01-01")

class(a$years)
a$years=as.numeric(a$years)
b=a$years


str(iraq)
str(a)
iraq=lapply(iraq, as.numeric)
iraq=as.data.frame(iraq)
#iraq= as.data.frame(scale(iraq[,-1]))
iraq$years=b
iraq=as.numeric(as.data.frame((unlist(iraq))))
heatmap(iraq, scale="column")
heatmap(iraq, Colv = NA, Rowv = NA)
a
a=as.Date((a))

library(RColorBrewer)
coul <- colorRampPalette(brewer.pal(8, "PiYG"))(25)
#heatmap(m, scale="column", col = coul)

heatmap(as.matrix(a[, -1]))

m <- as.matrix(iraq[, -1])
rownames(m) <- iraq$years
heatmap(m, Colv = NA, Rowv = NA)

p=heatmap(m, Colv = NA, Rowv = NA, scale="column", col = coul,
          xlab="variable", ylab="car", main="Iraq Body Count")



m <- as.matrix(iraq[, -1])
rownames(m) <- iraq$years
heatmap(m, Colv = NA, Rowv = NA)

p=heatmap(m, Colv = NA, Rowv = NA, scale="column", col = coul,
          xlab="variable", ylab="car", main="Iraq Body Count")




library(reshape2)
melted_cormat <- melt(m)

library(dplyr)



#q=melted_cormat %>% 
#  filter(value!="Any_claim") %>% 
#  group_by(melted_cormat$Var2) %>% 
#  mutate(value1=sum(melted_cormat$value))
#q=as.data.frame(q)
#View(q)


library(sqldf)

r= sqldf("select *,
         SUM(value)AS volume_sales_split_Sum from
         melted_cormat
         GROUP BY  Var1
         ,Var2 ")
r=r[,-3]

colnames(r)<- c("Years","Months","Value")
View(r)

art=  ggplot(data = r, aes(x=Years, y=Months, fill=Value)) + 
  geom_tile()

# + +
#labs( title= "Petal and sepal \nlength of iris")
#ggtitle("hello")+
# theme(panel.border=element_rect(colour = "black", fill=NA, size=1))
# ggplot2::labs(title =" hello" )


art +ggtitle("Iraq Body Count")+
  theme(panel.background = element_rect(fill = "White"),
        plot.margin = margin(0.1, 0.3, 0.01, 0.1, "cm"),
        plot.background = element_rect(
          fill = "white",
          colour = "Black",
          size = 1),
        axis.title  =
          element_text(family = NULL, face = NULL, colour = NULL,
                       size = NULL, hjust = NULL, vjust = 1.8, angle = NULL,
                       lineheight = NULL, color = NA, margin = NULL, debug = NULL,
                       inherit.blank = FALSE),
        title = element_text(family = NULL, face = NULL, colour = NULL,
                             size = NULL, hjust = 0.5, vjust = NULL, angle = NULL,
                             lineheight = NULL, color = NULL, margin = NULL, debug = NULL,
                             inherit.blank = FALSE),
        plot.title = element_text(family = NULL, face = NULL, colour = "Black",
                                  size = NULL, hjust = 0.5, vjust = 1.7, angle = NULL,
                                  lineheight = NULL, color = NULL, margin = NULL, debug = NULL,
                                  inherit.blank = FALSE),
        legend.text = element_text(family = NULL, face = NULL, colour = "Black",
                                   size = NULL, hjust = 0.5, vjust = NULL, angle = NULL,
                                   lineheight = NULL, color = NULL, margin = NULL, debug = NULL,
                                   inherit.blank = FALSE),
        legend.title = element_text(family = NULL, face = NULL, colour = "White",
                                    size = NULL, hjust = 0.5, vjust = NULL, angle = NULL,
                                    lineheight = NULL, color = NULL, margin = NULL, debug = NULL,
                                    inherit.blank = FALSE))

############################# Question  - 3 ####################################################


# Generate a word cloud in R.
# A word cloud is simply a graphical representation in which the
# size of the font used for the word corresponds to its frequency 
# relative to others. 
# Bigger the size of the word, higher is its frequency. 


library(wordcloud)
library(RColorBrewer)
pal=brewer.pal(6,"RdGy")

wordcloud("I also want to thank all the members of Congress and myadministration who are here today for the wonderful work that they do. 
          I want to thank Mayor Gray and
          everyone here at THEARC for having me",min.freq=1,scale=c(2,0.5),
          random.color = TRUE,color=pal)

############################################################################################################
























