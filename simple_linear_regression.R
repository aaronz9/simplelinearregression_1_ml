# Simple Linear Regression

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


#Fit a simple linear regression to the training set.

regressor = lm(formula = Salary ~ YearsExperience, data = training_set) 


#Predict our data on the Test set
y_pred = predict(regressor, newdata = test_set)


#Visualising the Traiing SET
#install.packages('ggplot2')
library(ggplot2)

ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             
             colour = 'red') + geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), 
            colour = 'blue')+ ggtitle('Salary VS Experience (Training Set)')+xlab('Years of Experience')+ylab('Salary')
  

#Visualising the Test SET
#install.packages('ggplot2')
library(ggplot2)

ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             
             colour = 'red') + geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), 
                                         colour = 'blue')+ ggtitle('Salary VS Experience (Test Set)')+xlab('Years of Experience')+ylab('Salary')

#same for test set









