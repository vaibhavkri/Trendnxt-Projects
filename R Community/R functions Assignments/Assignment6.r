data("mtcars")
library(dplyr)
arrange(mtcars,mtcars$mpg+mtcars$carb+mtcars$cyl)
