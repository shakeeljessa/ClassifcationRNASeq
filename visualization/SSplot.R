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

#import models
#svm <- readRDS(opt$model) 
#knn <- readRDS(opt$second_model) 
#nb <- readRDS(opt$third_model) 
#rf <- readRDS(opt$fourth_model) 

#4/8 manual entry
svm <- readRDS("./mRMRe/rds_lung_svm_deg_20.rds")
knn <- readRDS(rds_lung_knn_deg_20)
rf <- readRDS(rds_lung_rf_deg_20)
nb <- readRDS(rds_lung_nb_deg_20)
opt$case_name <- "Lung"

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
jpeg('/stor/work/FRI-BigDataBio/classification/visualization/SSplots/ssplot_lung_deg_20.jpeg', type = "cairo" )
plot.roc(svm$pred$obs[svmIndices], svmCase[svmIndices], col = 'red', levels = c("HC", opt$case_name))
plot.roc(knn$pred$obs[knnIndices], knnCase[knnIndices], add = T, col = 'orange', levels = c("HC", opt$case_name))
plot.roc(nb$pred$obs[nbIndices], nbCase[nbIndices], add = T, col = 'blue', levels = c("HC", opt$case_name))
plot.roc(rf$pred$obs[rfIndices], rfCase[rfIndices], add = T, col = 'green', levels = c("HC", opt$case_name))
legend("bottomright", legend=c("SVM", "KNN", "NB", "RF"), col=c('red', 'orange', 'blue', 'green'), lwd=2)
title("Lung, Top 20% DEGs")
dev.off()


