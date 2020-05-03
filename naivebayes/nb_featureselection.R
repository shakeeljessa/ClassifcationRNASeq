library("caret")
library("klaR")
set.seed(1)

#Read in CSV and split into 80% training, 20% testing
df <- read.csv(file = "./mRMRe/20_percent_ge/Breast_mRMR_selected_ge20.csv", row.names = 1, check.names = FALSE)
intrain <- createDataPartition(df[,ncol(df)], p = .8, list = FALSE)
training <- df[intrain,]
testing <- df[-intrain,]

#fix bug 4/7
#testing <- rbind(training[1, ] , testing)
#testing <- testing[-1,]

#Define machine learning parameters and run training and predicting of data
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3, classProbs = T, savePredictions = T)
form <- as.formula(paste("class", "~."))
fit.nb <- train(form, data = training, method = "nb", metric = 'Kappa',
                       trControl=trctrl)
predictions <- predict(fit.nb, newdata = testing)

#Generate confusion matrix
cf <- confusionMatrix(predictions, testing[,ncol(testing)])

#cfByClass <- data.frame(cf[["byClass"]])
#cfOverall <- data.frame(cf[["overall"]])
#colnames(cfByClass) <- NULL
#colnames(cfOverall) <- NULL

## save a single object to file
breast_nb <- tempfile("breast_nb", fileext = ".rds")
saveRDS(fit.nb, breast_nb)

#download.file("https://cran.r-project.org/src/contrib/Archive/klaR/klaR_0.6-14.tar.gz",
#              dest="klaR_0.6-14.tar.gz")
#install.packages("klaR_0.6-14.tar.gz",repos=NULL,type="source")
