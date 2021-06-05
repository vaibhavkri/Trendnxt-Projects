str(iris)

model = lm(Petal.Width ~ . ,iris)

p = predict(model,iris)

cbind(p,iris$Petal.Width)

library(ggplot2)

ggplot(iris,aes(x = p,
                y = Petal.Width))+
  geom_point()+
  geom_smooth(method = "lm",se=T)
