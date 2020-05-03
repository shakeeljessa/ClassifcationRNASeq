library("caret")
set.seed(1)

# format: cf_gbm_svm_mRMRe_20

#Read in CSV and split into 80% training, 20% testing
file_name <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/20_percent_ge/GBM_mRMR_selected_ge20.csv"
df <- read.csv(file = file_name, row.names = 1, check.names = FALSE)
intrain <- createDataPartition(df[,ncol(df)], p = .8, list = FALSE)
training <- df[intrain,]
testing <- df[-intrain,]

#Define machine learning parameters and run training and predicting of data
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3, classProbs = T, savePredictions = T)
form <- as.formula(paste("class", "~."))
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
cf_gbm_svm_mRMRe_20 <- confusionMatrix(predictions.svm, testing[,ncol(testing)])
write.table(as.table(cf_gbm_svm_mRMRe_20$byClass), "./mRMRe/cf/cfByClass_gbm_svm_mRMRe_20")
write.table(as.table(cf_gbm_svm_mRMRe_20$overall), "./mRMRe/cf/cfOverall_gbm_svm_mRMRe_20")
cf_gbm_rf_mRMRe_20 <- confusionMatrix(predictions.rf, testing[,ncol(testing)])
write.table(as.table(cf_gbm_rf_mRMRe_20$byClass), "./mRMRe/cf/cfByClass_gbm_rf_mRMRe_20")
write.table(as.table(cf_gbm_rf_mRMRe_20$overall), "./mRMRe/cf/cfOverall_gbm_rf_mRMRe_20")
cf_gbm_knn_mRMRe_20 <- confusionMatrix(predictions.knn, testing[,ncol(testing)])
write.table(as.table(cf_gbm_knn_mRMRe_20$byClass), "./mRMRe/cf/cfByClass_gbm_knn_mRMRe_20")
write.table(as.table(cf_gbm_knn_mRMRe_20$overall), "./mRMRe/cf/cfOverall_gbm_knn_mRMRe_20")
cf_gbm_nb_mRMRe_20 <- confusionMatrix(predictions.nb, testing[,ncol(testing)])
write.table(as.table(cf_gbm_nb_mRMRe_20$byClass), "./mRMRe/cf/cfByClass_gbm_nb_mRMRe_20")
write.table(as.table(cf_gbm_nb_mRMRe_20$overall), "./mRMRe/cf/cfOverall_gbm_nb_mRMRe_20")

## save a single object to file
rds_gbm_svm_mRMRe_20 <- saveRDS(fit.svmRadial, "./mRMRe/rds/rds_gbm_svm_mRMRe_20.rds")
rds_gbm_rf_mRMRe_20 <- saveRDS(fit.rf, "./mRMRe/rds/rds_gbm_rf_mRMRe_20.rds")
rds_gbm_knn_mRMRe_20 <- saveRDS(fit.knn, "./mRMRe/rds/rds_gbm_knn_mRMRe_20.rds")
rds_gbm_nb_mRMRe_20 <- saveRDS(fit.nb, "./mRMRe/rds/rds_gbm_nb_mRMRe_20.rds")