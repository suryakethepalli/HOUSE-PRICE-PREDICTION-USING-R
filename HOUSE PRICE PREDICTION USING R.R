dataset = read.csv("Bengaluru_House_Data.csv")
View(dataset)
square = dataset[,6]
square = as.numeric(square)
price = dataset[,8]
data = data.frame(square,price)
View(data)
str(data)

library(caTools)
set.seed(211)
split = sample.split(data$price,SplitRatio = 0.8)
View(split)
training_set = subset(data,split==TRUE)
testing_set = subset(data,split==FALSE)
View(training_set)
View(testing_set)

regressor = lm(formula = price~square,data = training_set)

y_pred = predict(regressor,newdata = testing_set)
a = testing_set$price
b = y_pred

plot(testing_set$square,a,type='p',col='blue',xlab = 'Count',ylab='red')
lines(testing_set$square,b,type = 'o',col='red')

