library(reshape2)
library(RColorBrewer)

# We want mRMRe and DEG balacc for each of the 5 subsets
# rows are quantiles
# columns are mRMRE and DEG
# entries are balacc
BalancedAccuracy <- data.frame("mRMRe" = c(0,0,0,0,0), "DEGs" = c(0,0,0,0,0))
row.names(BalancedAccuracy) <- c("20%", "40%", "60%", "80%", "100%")
balacc <- numeric(0)


# breast deg 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])


# lung deg 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# crc deg 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# gbm deg 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set deg 20 value
BalancedAccuracy[1,2] <- mean(balacc)
balacc <- numeric(0)


# breast deg 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])


# lung deg 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# crc deg 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# gbm deg 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set deg 40 value
BalancedAccuracy[2,2] <- mean(balacc)
balacc <- numeric(0)


# breast deg 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])


# lung deg 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# crc deg 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# gbm deg 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set deg 60 value
BalancedAccuracy[3,2] <- mean(balacc)
balacc <- numeric(0)


# breast deg 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])


# lung deg 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# crc deg 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# gbm deg 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set deg 80 value
BalancedAccuracy[4,2] <- mean(balacc)
balacc <- numeric(0)

# breast deg 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])


# lung deg 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# crc deg 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# gbm deg 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_deg_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set deg 100 value
BalancedAccuracy[5,2] <- mean(balacc)
balacc <- numeric(0)



# breast mRMRe 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])


# lung mRMRe 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# crc mRMRe 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# gbm mRMRe 20
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_20"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set mRMRe 20 value
BalancedAccuracy[1,1] <- mean(balacc)
balacc <- numeric(0)


# breast mRMRe 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])


# lung mRMRe 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# crc mRMRe 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# gbm mRMRe 40
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_40"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set mRMRe 40 value
BalancedAccuracy[2,1] <- mean(balacc)
balacc <- numeric(0)


# breast mRMRe 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])


# lung mRMRe 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# crc mRMRe 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# gbm mRMRe 60
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_60"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set mRMRe 60 value
BalancedAccuracy[3,1] <- mean(balacc)
balacc <- numeric(0)


# breast mRMRe 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])


# lung mRMRe 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# crc mRMRe 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# gbm mRMRe 80
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_80"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set mRMRe 80 value
BalancedAccuracy[4,1] <- mean(balacc)
balacc <- numeric(0)

# breast mRMRe 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_svm_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_knn_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_nb_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_breast_rf_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])


# lung mRMRe 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_svm_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_knn_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_nb_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_lung_rf_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# crc mRMRe 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_svm_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_knn_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_nb_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_crc_rf_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# gbm mRMRe 100
input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_svm_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_knn_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_nb_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

input <- "/stor/work/FRI-BigDataBio/classification/mRMR/mrmr_c_src/mRMRe/cf/cfByClass_gbm_rf_mRMRe_100"
table <- read.table(input)
balacc <- append(balacc, table$Freq[11])

# set mRMRe 100 value
BalancedAccuracy[5,1] <- mean(balacc)
balacc <- numeric(0)

# MAKE PLOT
###
###
###

BalancedAccuracy$id = c(0.2, 0.4, 0.6, 0.8, 1)
final_data <- melt(BalancedAccuracy, id='id')
names(final_data) <- c('id', 'Method', 'value')
p <- ggplot() + geom_line(data = final_data, aes(x = id, y = value, color = Method, group = Method), size = 2) + xlab("Percentage of Genes Used") + 
  ylab("Balanced Accuracy") + ggtitle("Balanced Accuracy Across Feature Selection Methods") + scale_colour_brewer(palette="Set1")

png("BalancedAccuracy.png", units="in", width=8, height=3, res=300, type = "cairo")
p
dev.off()