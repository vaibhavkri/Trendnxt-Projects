# Graph Assignment -2

##########################  Question -1 ###################################

# The following screenshot plots the child mortality rate in selected
# countries Use chlmort.csv file to show the relationship between 
# the child mortality rate and Gross Domestic Product (GDP) of a country.  


child=read.csv("chlmort.csv",header = TRUE,sep = ",")
attach(child)
plot(child$gdp_bil,child$child,pch=20,col="#756bb1",xlim = c(0,max(child$gdp_bil)),ylim = c(0,190),
     xlab = "GDP in billions in current US$",ylab = "Child Mortality Rate",
     main = "Child Mortality Rate In selected Countries for 2012")
abline(h=(36.18),lwd=1,col="red")
text(8000,25,labels = c("Luxemborg"),cex=0.75)
text(600,182,labels = c("Sierra Leone"),col="red",cex = 0.75)
text(4000,50,labels = c("Average Child mortality"),col="red",cex=0.75)


###########################   ANother Method  -  Interactive chart #####################

# Please click on the Plot else the subsequent code won't run #############

child=read.csv("chlmort.csv")
View(child)
dim(child)
names(child)
#[1] "CountryName" "CountryCode" "child"       "gdp"        
#[5] "gdp_bil"

plot(child$child~child$gdp_bil,main = "Child Mortality Rate In selected Countries for 2012"
     ,xlab = "GDP in billions in current US$",ylab = "Child Mortality Rate",
     pch=16,cex=0.5,col=" Dark violet")

abline(h=mean(child$child),v=NA,col="red")
text(10,60, "Average Child Mortality", col = "Red", adj = c(-1.2, -.1),cex = 0.6)
box(which = "outer", lty = "solid",lwd=2)
#This is interactive function Please move your cursor to outliers and click
identify(child$child~child$gdp_bil, n=2, labels=child$CountryName) 

#########################  Question -2  #################################

# Use disable.csv file and generate Gantt Chart that 
# displays periods during which baseball players are disabled. 


base = read.csv("disable.csv")
data = data.frame(position= as.character(base$position), 
                  player= as.character(base$player),
                  start= as.POSIXct(base$start), 
                  end = as.POSIXct(base$end)) 
library(googleVis)

baseball= gvisTimeline(data = data,
             rowlabel="position",start="start", 
     end = "end",barlabel="player" , option= list(width= 1000,
           height= 900,timeline="{singleColor:'#002A3E'}")) 


plot(baseball)


############################## Another Method - Q-2      ##########################################
dis=read.csv("disable.csv",stringsAsFactors = F)
View(dis)
str(dis)
attach(dis)
library(googleVis)

dis$start= as.Date(as.POSIXct(dis$start))
dis$end=as.Date(as.POSIXct(dis$end))

tl=gvisTimeline(dis,rowlabel="position",barlabel = "player",start="start",end="end"
                ,options=list(timeline="{showRowLabels:true}",width=600, height=600))

plot(tl)


##############################  Question -3 #############################

# se crimeUSA.csv, googlevis package and gvisBubbleChart function
# And show crime per state bubble chart as shown below.
# Bubble Size is population

library(googleVis)
crm=read.csv("crimeusa.csv")
View(crime)
?gvisBubbleChart
bub1 = gvisBubbleChart(crm,idvar = "States",xvar= "Robbery", yvar=
                         "Burglary", sizevar ="Population", colorvar = "Year",
                       options = list(legend = "none",width = 900, height = 600,title
                                      =" Crime per State in 2012", sizeAxis ="{maxSize : 40, minSize
:0.5}",vAxis = "{title : 'Burglary'}",hAxis= "{title :
'Robbery'}", colorAxis="{colors: ['lightblue']}"))
bub2 = gvisBubbleChart(crm,idvar = "States",xvar= "Robbery", yvar=
                         "Burglary",sizevar ="Population",
                       options = list(legend = "none",width = 900, height = 600,title
                                      =" Crime per State in 2012", sizeAxis ="{maxSize : 40, minSize
:0.5}",vAxis = "{title : 'Burglary'}",hAxis= "{title :
'Robbery'}", colorAxis="{colors: ['lightblue', 'blue']}"))

mrg = gvisMerge(bub1,bub2, horizontal = TRUE)
plot(mrg)

###########################  Question 4 #####################################################

# Use infant.csv, create Bar graph that displays 
# infant mortality rate of India in 2011. Use Barplot fn


data=read.csv("infant.csv",header = TRUE)
View(data)

data=data[order(data$Total2011,decreasing = TRUE),]
#mean(data$Total2011)

new=ifelse(data$Total2011>12.2,"Yes","No")

data=cbind(data,new)

par(mar=c(10,5,5,5))


barplot(data$Total2011,las=2,names.arg = data$India,width = 0.80,border = NA
        ,ylim = c(0,20),col="#e34a33",main="Infant Mortality Rate of India in 2011")
abline(h=12.2,lwd=2,col="white",lty=2)




