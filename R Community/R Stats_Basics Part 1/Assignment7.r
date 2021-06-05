data("PlantGrowth")
View(PlantGrowth)

anova_results<-aov(PlantGrowth$weight~PlantGrowth$group, data = PlantGrowth)
summary(anova_results)
