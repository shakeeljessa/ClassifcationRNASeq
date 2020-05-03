library(reshape2)
library(RColorBrewer)
# We want Classifier balacc for each of the 5 subsets
# rows are quantiles
# columns are classifiers
# entries are balacc
BalancedAccuracy <- data.frame("SVM" = c(0,0,0,0,0), "RF" = c(0,0,0,0,0), "NB" = c(0,0,0,0,0), "KNN" = c(0,0,0,0,0))
row.names(BalancedAccuracy) <- c("20%", "40%", "20%", "80%", "100%")
balacc <- numeric(0)

# svm 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set svm 40 value
BalancedAccuracy[1,1] <- mean(balacc)
balacc <- numeric(0)

# svm 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set svm 40 value
BalancedAccuracy[2,1] <- mean(balacc)
balacc <- numeric(0)

# svm 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set svm 80 value
BalancedAccuracy[3,1] <- mean(balacc)
balacc <- numeric(0)

# svm 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set svm 80 value
BalancedAccuracy[4,1] <- mean(balacc)
balacc <- numeric(0)

# svm 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set svm 100 value
BalancedAccuracy[5,1] <- mean(balacc)
balacc <- numeric(0)

# rf 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set rf 40 value
BalancedAccuracy[1,2] <- mean(balacc)
balacc <- numeric(0)

# rf 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set rf 40 value
BalancedAccuracy[2,2] <- mean(balacc)
balacc <- numeric(0)

# rf 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set rf 80 value
BalancedAccuracy[3,2] <- mean(balacc)
balacc <- numeric(0)

# rf 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set rf 80 value
BalancedAccuracy[4,2] <- mean(balacc)
balacc <- numeric(0)

# rf 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set rf 100 value
BalancedAccuracy[5,2] <- mean(balacc)
balacc <- numeric(0)

# nb 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set nb 40 value
BalancedAccuracy[1,3] <- mean(balacc)
balacc <- numeric(0)

# nb 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set nb 40 value
BalancedAccuracy[2,3] <- mean(balacc)
balacc <- numeric(0)

# nb 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set nb 80 value
BalancedAccuracy[3,3] <- mean(balacc)
balacc <- numeric(0)

# nb 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set nb 80 value
BalancedAccuracy[4,3] <- mean(balacc)
balacc <- numeric(0)

# nb 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set nb 100 value
BalancedAccuracy[5,3] <- mean(balacc)
balacc <- numeric(0)

# knn 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set knn 40 value
BalancedAccuracy[1,4] <- mean(balacc)
balacc <- numeric(0)

# knn 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set knn 40 value
BalancedAccuracy[2,4] <- mean(balacc)
balacc <- numeric(0)

# knn 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set knn 80 value
BalancedAccuracy[3,4] <- mean(balacc)
balacc <- numeric(0)

# knn 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set knn 80 value
BalancedAccuracy[4,4] <- mean(balacc)
balacc <- numeric(0)

# knn 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set knn 100 value
BalancedAccuracy[5,4] <- mean(balacc)
balacc <- numeric(0)

# MAKE PLOT
###
###
###

BalancedAccuracy$id = c(0.2, 0.4, 0.6, 0.8, 1)
final_data <- melt(BalancedAccuracy, id='id')
names(final_data) <- c('id', 'Classifier', 'value')
p <- ggplot() + geom_line(data = final_data, aes(x = id, y = value, color = Classifier, group = Classifier), size = 2) + xlab("Percentage of Genes Used") + 
  ylab("Balanced Accuracy") + ggtitle("Balanced Accuracy Across Classifiers") + scale_colour_brewer(palette="Dark2")

png("BalancedAccuracyClassifier.png", units="in", width=8, height=3, res=300, type = "cairo")
p
dev.off()