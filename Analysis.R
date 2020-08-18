library(MASS)
carprice = datasets_383055_741735_CarPrice_Assignment



set.seed(100)
Fitstart = lm(price ~ ., data = carprice)
head(carprice)
summary(Fitstart)

step = stepAIC(Fitstart, direction = "both")
step$anova 
summary(step)

step1=step(step, direction = "both", test = "F")
summary(step1)

step2 <- update(step1,~. - curbweight)
summary(step2)

step3 <- update(step2,~. - carwidth)
summary(step3)

