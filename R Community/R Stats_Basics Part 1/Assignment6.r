data("PlantGrowth")
View(PlantGrowth)

bartlett.test(PlantGrowth$weight~PlantGrowth$group)