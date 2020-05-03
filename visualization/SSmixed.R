library(reshape2)
library(RColorBrewer)
library(pROC)
# We want Classifier SS for each of the 5 subsets
# rows are quantiles
# columns are classifiers
# entries are SS
Sen <- data.frame("SVM" = c(0,0,0,0,0,0,0,0,0,0), "RF" = c(0,0,0,0,0,0,0,0,0,0), "NB" = c(0,0,0,0,0,0,0,0,0,0), "KNN" = c(0,0,0,0,0,0,0,0,0,0), "id" = c(0.2, 0.2, 0.4, 0.4, 0.6, 0.6, 0.8, 0.8, 1.0, 1.0))
Spec <- data.frame("SVM" = c(0,0,0,0,0,0,0,0,0,0), "RF" = c(0,0,0,0,0,0,0,0,0,0), "NB" = c(0,0,0,0,0,0,0,0,0,0), "KNN" = c(0,0,0,0,0,0,0,0,0,0), "id" = c(0.2, 0.2, 0.4, 0.4, 0.6, 0.6, 0.8, 0.8, 1.0, 1.0))
sen <- numeric(0)
spec <- numeric(0)

# svm mRMRe 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1])
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1])
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1])
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1])
spec <- append(spec, table$Freq[2])

# set svm mRMRe 20 value
Sen[1,1] <- mean(sen)
sen <- numeric(0)
Spec[1,1] <- mean(spec)
spec <- numeric(0)

# svm  20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set svm  20 value
Sen[2,1] <- mean(sen)
sen <- numeric(0)
Spec[2,1] <- mean(spec)
spec <- numeric(0)

# svm mRMRe 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set svm mRMRe 40 value
Sen[3,1] <- mean(sen)
sen <- numeric(0)
Spec[3,1] <- mean(spec)
spec <- numeric(0)

# svm  40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set svm  40 value
Sen[4,1] <- mean(sen)
sen <- numeric(0)
Spec[4,1] <- mean(spec)
spec <- numeric(0)

# svm mRMRe 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set svm mRMRe 60 value
Sen[5,1] <- mean(sen)
sen <- numeric(0)
Spec[5,1] <- mean(spec)
spec <- numeric(0)

# svm  60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set svm  60 value
Sen[6,1] <- mean(sen)
sen <- numeric(0)
Spec[6,1] <- mean(spec)
spec <- numeric(0)

# svm mRMRe 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set svm mRMRe 80 value
Sen[7,1] <- mean(sen)
sen <- numeric(0)
Spec[7,1] <- mean(spec)
spec <- numeric(0)

# svm  80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set svm  80 value
Sen[8,1] <- mean(sen)
sen <- numeric(0)
Spec[8,1] <- mean(spec)
spec <- numeric(0)

# svm mRMRe 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set svm mRMRe 100 value
Sen[9,1] <- mean(sen)
sen <- numeric(0)
Spec[9,1] <- mean(spec)
spec <- numeric(0)

# svm  100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set svm  100 value
Sen[10,1] <- mean(sen)
sen <- numeric(0)
Spec[10,1] <- mean(spec)
spec <- numeric(0)

# rf mRMRe 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set rf mRMRe 20 value
Sen[1,2] <- mean(sen)
sen <- numeric(0)
Spec[1,2] <- mean(spec)
spec <- numeric(0)

# rf  20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set rf  20 value
Sen[2,2] <- mean(sen)
sen <- numeric(0)
Spec[2,2] <- mean(spec)
spec <- numeric(0)

# rf mRMRe 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set rf mRMRe 40 value
Sen[3,2] <- mean(sen)
sen <- numeric(0)
Spec[3,2] <- mean(spec)
spec <- numeric(0)

# rf  40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set rf  40 value
Sen[4,2] <- mean(sen)
sen <- numeric(0)
Spec[4,2] <- mean(spec)
spec <- numeric(0)

# rf mRMRe 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set rf mRMRe 60 value
Sen[5,2] <- mean(sen)
sen <- numeric(0)
Spec[5,2] <- mean(spec)
spec <- numeric(0)

# rf  60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set rf  60 value
Sen[6,2] <- mean(sen)
sen <- numeric(0)
Spec[6,2] <- mean(spec)
spec <- numeric(0)

# rf mRMRe 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set rf mRMRe 80 value
Sen[7,2] <- mean(sen)
sen <- numeric(0)
Spec[7,2] <- mean(spec)
spec <- numeric(0)

# rf  80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set rf  80 value
Sen[8,2] <- mean(sen)
sen <- numeric(0)
Spec[8,2] <- mean(spec)
spec <- numeric(0)

# rf mRMRe 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set rf mRMRe 100 value
Sen[9,2] <- mean(sen)
sen <- numeric(0)
Spec[9,2] <- mean(spec)
spec <- numeric(0)

# rf  100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set rf  100 value
Sen[10,2] <- mean(sen)
sen <- numeric(0)
Spec[10,2] <- mean(spec)
spec <- numeric(0)

# nb mRMRe 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set nb mRMRe 20 value
Sen[1,3] <- mean(sen)
sen <- numeric(0)
Spec[1,3] <- mean(spec)
spec <- numeric(0)

# nb  20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set nb  20 value
Sen[2,3] <- mean(sen)
sen <- numeric(0)
Spec[2,3] <- mean(spec)
spec <- numeric(0)

# nb mRMRe 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set nb mRMRe 40 value
Sen[3,3] <- mean(sen)
sen <- numeric(0)
Spec[3,3] <- mean(spec)
spec <- numeric(0)

# nb  40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set nb 40 value
Sen[4,3] <- mean(sen)
sen <- numeric(0)
Spec[4,3] <- mean(spec)
spec <- numeric(0)

# nb mRMRe 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set nb mRMRe 60 value
Sen[5,3] <- mean(sen)
sen <- numeric(0)
Spec[5,3] <- mean(spec)
spec <- numeric(0)

# nb  60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set nb  60 value
Sen[6,3] <- mean(sen)
sen <- numeric(0)
Spec[6,3] <- mean(spec)
spec <- numeric(0)

# nb mRMRe 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set nb mRMRe 80 value
Sen[7,3] <- mean(sen)
sen <- numeric(0)
Spec[7,3] <- mean(spec)
spec <- numeric(0)

# nb  80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set nb  80 value
Sen[8,3] <- mean(sen)
sen <- numeric(0)
Spec[8,3] <- mean(spec)
spec <- numeric(0)

# nb mRMRe 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set nb mRMRe 100 value
Sen[9,3] <- mean(sen)
sen <- numeric(0)
Spec[9,3] <- mean(spec)
spec <- numeric(0)

# nb  100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set nb  100 value
Sen[10,3] <- mean(sen)
sen <- numeric(0)
Spec[10,3] <- mean(spec)
spec <- numeric(0)

# knn mRMRe 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set knn mRMRe 20 value
Sen[1,4] <- mean(sen)
sen <- numeric(0)
Spec[1,4] <- mean(spec)
spec <- numeric(0)

# knn  20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_20"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set knn  20 value
Sen[2,4] <- mean(sen)
sen <- numeric(0)
Spec[2,4] <- mean(spec)
spec <- numeric(0)

# knn mRMRe 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set knn mRMRe 40 value
Sen[3,4] <- mean(sen)
sen <- numeric(0)
Spec[3,4] <- mean(spec)
spec <- numeric(0)

# knn  40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_40"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set knn  40 value
Sen[4,4] <- mean(sen)
sen <- numeric(0)
Spec[4,4] <- mean(spec)
spec <- numeric(0)

# knn mRMRe 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set knn mRMRe 60 value
Sen[5,4] <- mean(sen)
sen <- numeric(0)
Spec[5,4] <- mean(spec)
spec <- numeric(0)

# knn  60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_60"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set knn  60 value
Sen[6,4] <- mean(sen)
sen <- numeric(0)
Spec[6,4] <- mean(spec)
spec <- numeric(0)

# knn mRMRe 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set knn mRMRe 80 value
Sen[7,4] <- mean(sen)
sen <- numeric(0)
Spec[7,4] <- mean(spec)
spec <- numeric(0)

# knn  80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_80"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set knn  80 value
Sen[8,4] <- mean(sen)
sen <- numeric(0)
Spec[8,4] <- mean(spec)
spec <- numeric(0)

# knn mRMRe 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set knn mRMRe 100 value
Sen[9,4] <- mean(sen)
sen <- numeric(0)
Spec[9,4] <- mean(spec)
spec <- numeric(0)

# knn  100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_100"
table <- read.table(input)
sen <- append(sen, table$Freq[1]) 
spec <- append(spec, table$Freq[2])

# set knn  100 value
Sen[10,4] <- mean(sen)
sen <- numeric(0)
Spec[10,4] <- mean(spec)
spec <- numeric(0)

# MAKE PLOT
###
final_sen <- melt(Sen, id='id')
final_data$method <- c("mRMRe")
final_data[40,4] <- "DEGs"
names(final_data) <- c('id', 'Classifier', 'value', "Method")
p <- ggplot() + geom_line(data = final_data, aes(x = id, y = value, color = Classifier,  linetype = Method), size = 2) + xlab("Percentage of Genes Used") + 
  ylab("Balanced Accuracy") + ggtitle("Balanced Accuracy Across Classifiers and Method") + scale_colour_brewer(palette="Accent")

png("BalancedAccuracyMixed.png", units="in", width=8, height=3, res=300, type = "cairo")
p
dev.off()

plot.roc()