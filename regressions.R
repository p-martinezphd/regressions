
library(ggplot2)
library(dplyr)
data(mtcars)



head(mtcars)
str(mtcars)


mtcars2<-mtcars


mtcars$am <- as.factor(mtcars$am)
levels(mtcars$am) <- c("automatic", "manual")
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$vs <- as.factor(mtcars$vs)
levels(mtcars$vs) <- c("V", "S")

# scatterplot
ggplot(data = mtcars,   # set data
       mapping = aes(     # map aesthetics to column values
               x = mpg,           # map x-axis to age            
               y = am,         # map y-axis to weight
               color = am)
)+     # map color to age
        geom_point() 



cors <- cor(mtcars2$mpg, mtcars2)
orderedCors <- cors[,order(-abs(cors[1,]))]
orderedCors


model1 <- lm(mpg ~ am, mtcars)
summary(model1)
res <- resid(model1)
plot(fitted(model1), res)



model2 <- lm(mpg ~ ., mtcars)
summary(model2)
res2 <- resid(model2)
