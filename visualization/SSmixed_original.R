library(caret)
library(pROC)
library(getopt)

spec = matrix(c('model', 'm', 1, 'character',
                'second_model', 's', 2, 'character',
                'third_model', 't', 2, 'character',
                'fourth_model', 'f', 2, 'character',
                'case_name', 'c', 1, 'character'),
              byrow = TRUE, ncol = 4)

opt = getopt(spec)

svm <- readRDS("/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/rds/rds_crc_svm_mRMRe_80.rds")
knn <- readRDS("/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/rds/rds_crc_knn_mRMRe_80.rds")
rf <- readRDS("/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/rds/rds_crc_rf_mRMRe_80.rds")
nb <- readRDS("/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/rds/rds_crc_nb_mRMRe_80.rds")
opt$case_name <- "CRC"

#create indices and set output name
svmIndices <- svm$pred$C == svm$pred$C[1]
knnIndices <- knn$pred$k == knn$pred$k[1]
nbIndices <- nb$pred$adjust == nb$pred$adjust[1]
rfIndices <- rf$pred$mtry == rf$pred$mtry[1]

svmCase <- svm$pred[[opt$case_name]]
knnCase <- knn$pred[[opt$case_name]]
nbCase <- nb$pred[[opt$case_name]]
rfCase <- rf$pred[[opt$case_name]]

#create plots
jpeg('SS_CRC_mRMRe_80.jpeg', type = "cairo" )
plot.roc(svm$pred$obs[svmIndices], svmCase[svmIndices], col = 'red', levels = c("HC", opt$case_name))
plot.roc(knn$pred$obs[knnIndices], knnCase[knnIndices], add = T, col = 'orange', levels = c("HC", opt$case_name))
plot.roc(nb$pred$obs[nbIndices], nbCase[nbIndices], add = T, col = 'blue', levels = c("HC", opt$case_name))
plot.roc(rf$pred$obs[rfIndices], rfCase[rfIndices], add = T, col = 'green', levels = c("HC", opt$case_name))
legend("bottomright", legend=c("SVM", "KNN", "NB", "RF"), col=c('red', 'orange', 'blue', 'green'), lwd=2)
title("ROC for CRC trained on mRMR 80%", line = 2.5)
dev.off()
