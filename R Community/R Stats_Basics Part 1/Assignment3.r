nor_hie <-
  shapiro.test(trees$Height) #shapiro test and storing the value in a variable
if (nor_hie$p.value < 0.05) {
  #checkign if the p value if less than significance value
  print("the tree heights does no follow a normal distribution")
} else {
  print("the tree heights follow a normal distribution")
}
