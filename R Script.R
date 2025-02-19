#load the data
data=read.csv("Final_Dataset.csv")

#check data types
str(data)

#check summary statistics
summary(data)

#Fit the model
model <- lm(Tourist_Arrivals ~ Changes_in_inflation + Imports + GDP_Per_Capita + Official_Exchange_Rate + Exports_Goods + Foreign_Direct_Investment + GDP, data = data)

#Display the summary of the model
summary(model)

#Residual diagnostics
plot(model)

#Assess model performance
summary(model)$r.squared
summary(model)$adj.r.squared

#Split the data into Training and Testing sets
set.seed(123)
train_index <- sample(1:nrow(data), size = 0.7 * nrow(data)) #70% training
Train <- data[train_index, ]
Test <- data[-train_index, ]

#Fit the Model on the Training Data
model <- lm(Tourist_Arrivals ~ Changes_in_inflation + Imports + GDP_Per_Capita + Official_Exchange_Rate + Exports_Goods + Foreign_Direct_Investment + GDP, data = Train)

#Predict GDP for the Test dataset
Predict <- predict(model, newdata = Test)

#Add predictions to the Test dataset
Test$Predicted_Tourists <- Predict

# View predictions
head(Test)

