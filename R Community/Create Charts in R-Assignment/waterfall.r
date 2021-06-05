install.packages("plotrix")
library(plotrix)
sales = read.csv("waterfall.csv")
names(sales)[1] = "lbl"
staircase.plot( sales$value, totals = sales$logic, labels = sales$lbl, total.col = c("lightgreen"), inc.col = c("blue","red"))
