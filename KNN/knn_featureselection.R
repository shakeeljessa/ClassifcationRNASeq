library("caret")
set.seed(1)

#Read in CSV and split into 80% training, 20% testing
df <- read.csv(file = "./mRMRe/20_percent_ge/Breast_mRMR_selected_ge20.csv", row.names = 1, check.names = FALSE)
intrain <- createDataPartition(df[,ncol(df)], p = .8, list = FALSE)
training <- df[intrain,]
testing <- df[-intrain,]

#Define machine learning parameters and run training and predicting of data
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3, classProbs = T, savePredictions = T)
form <- as.formula(paste("class", "~."))
fit.knn <- train(form, data = training, method = "knn", metric = "Kappa",
                       trControl=trctrl, tuneLength = 10)
predictions <- predict(fit.knn, newdata = testing)

#Generate confusion matrix
cf <- confusionMatrix(predictions, testing[,ncol(testing)])

#cfByClass <- data.frame(cf[["byClass"]])
#cfOverall <- data.frame(cf[["overall"]])
#colnames(cfByClass) <- NULL
#colnames(cfOverall) <- NULL

## save a single object to file
breast_knn <- tempfile("breast_knn", fileext = ".rds")
saveRDS(fit.knn, breast_knn)

