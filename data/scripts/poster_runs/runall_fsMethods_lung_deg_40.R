library("caret")
set.seed(1)

# format: cf_lung_svm_deg_40

#Read in CSV and split into 80% training, 20% testing
file_name <- "/stor/work/FRI-BigDataBio/classification/data/tables/processedsubsetsTop40/rlog/Lung.csv"
df <- read.csv(file = file_name, row.names = 1, check.names = FALSE)
intrain <- createDataPartition(df[,ncol(df)], p = .8, list = FALSE)
training <- df[intrain,]
testing <- df[-intrain,]

#Define machine learning parameters and run training and predicting of data
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3, classProbs = T, savePredictions = T)
form <- as.formula(paste("cancer_type", "~."))
fit.svmRadial <- train(form, data = training, method = "svmRadial", metric = "Kappa",
                       trControl=trctrl, tuneLength = 10)
fit.rf <- train(form, data = training, method = "rf", metric = "Kappa",
                trControl=trctrl, tuneLength = 10)
fit.knn <- train(form, data = training, method = "knn", metric = "Kappa",
                 trControl=trctrl, tuneLength = 10)
fit.nb <- train(form, data = training, method = "nb", metric = 'Kappa',
                trControl=trctrl)
predictions.nb <- predict(fit.nb, newdata = testing)
predictions.knn <- predict(fit.knn, newdata = testing)
predictions.svm <- predict(fit.svmRadial, newdata = testing)
predictions.rf <- predict(fit.rf, newdata = testing)


#Generate confusion matrix
cf_lung_svm_deg_40 <- confusionMatrix(predictions.svm, testing[,ncol(testing)])
write.table(as.table(cf_lung_svm_deg_40$byClass), "./mRMRe/cf/cfByClass_lung_svm_deg_40")
write.table(as.table(cf_lung_svm_deg_40$overall), "./mRMRe/cf/cfOverall_lung_svm_deg_40")
cf_lung_rf_deg_40 <- confusionMatrix(predictions.rf, testing[,ncol(testing)])
write.table(as.table(cf_lung_rf_deg_40$byClass), "./mRMRe/cf/cfByClass_lung_rf_deg_40")
write.table(as.table(cf_lung_rf_deg_40$overall), "./mRMRe/cf/cfOverall_lung_rf_deg_40")
cf_lung_knn_deg_40 <- confusionMatrix(predictions.knn, testing[,ncol(testing)])
write.table(as.table(cf_lung_knn_deg_40$byClass), "./mRMRe/cf/cfByClass_lung_knn_deg_40")
write.table(as.table(cf_lung_knn_deg_40$overall), "./mRMRe/cf/cfOverall_lung_knn_deg_40")
cf_lung_nbdeg_40 <- confusionMatrix(predictions.nb, testing[,ncol(testing)])
write.table(as.table(cf_lung_nb_deg_40$byClass), "./mRMRe/cf/cfByClass_lung_nb_deg_40")
write.table(as.table(cf_lung_nb_deg_40$overall), "./mRMRe/cf/cfOverall_lung_nb_deg_40")

## save a single object to file
rds_lung_svm_deg_40 <- saveRDS(fit.svmRadial, "./mRMRe/rds/rds_lung_svm_deg_40.rds")
rds_lung_rf_deg_40 <- saveRDS(fit.rf, "./mRMRe/rds/rds_lung_rf_deg_40.rds")
rds_lung_knn_deg_40 <- saveRDS(fit.knn, "./mRMRe/rds/rds_lung_knn_deg_40.rds")
rds_lung_nb_deg_40 <- saveRDS(fit.nb, "./mRMRe/rds/rds_lung_nb_deg_40.rds")