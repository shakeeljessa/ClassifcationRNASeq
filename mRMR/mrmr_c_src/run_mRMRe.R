library("mRMRe")

#import example data and dry run
#data(cgps)
#data.annot <- data.frame(cgps.annot)
#data.cgps <- data.frame(cgps.ic50, cgps.ge)

#dd <- mRMR.data(data = data.cgps)
#mRMR.classic(data = dd, target_indices = c(1), feature_count = 30)

#test on Peng data
#dd <- mRMR.data(data = "test_lung_s3.csv")
#test_lung_mRMR <- mRMR.classic(data = dd, target_indices = c(1), feature_count = 50)

###
###
###
# CURRENTLY 4/11/20 1:48PM RUNNING TOP 100% of DEGS
###
###
###

#begin mRMRe on actual data
#breast
Breast_mRMR <- read.csv("Breast.mRMR.csv", header = T)
Breast_mRMR$class <- as.numeric(Breast_mRMR$class)
dd <- mRMR.data(data = Breast_mRMR)
breast_mRMRe <- mRMR.classic(data = dd, target_indices = c(1), feature_count = 674)
breast_mRMRe_results <- data.frame(c(breast_mRMRe@filters, breast_mRMRe@scores))
write.csv(breast_mRMRe_results, "./mRMRe/Breast_mRMRe_results100.csv")

#lung
Lung_mRMR <- read.csv("Lung.mRMR.csv", header = T)
Lung_mRMR$class <- as.numeric(Lung_mRMR$class)
dd <- mRMR.data(data = Lung_mRMR)
Lung_mRMRe <- mRMR.classic(data = dd, target_indices = c(1), feature_count = 856)
Lung_mRMRe_results <- data.frame(c(Lung_mRMRe@filters, Lung_mRMRe@scores))
write.csv(Lung_mRMRe_results, "./mRMRe/Lung_mRMRe_results100.csv")

#CRC
CRC_mRMR <- read.csv("CRC.mRMR.csv", header = T)
CRC_mRMR$class <- as.numeric(CRC_mRMR$class)
dd <- mRMR.data(data = CRC_mRMR)
CRC_mRMRe <- mRMR.classic(data = dd, target_indices = c(1), feature_count = 1591)
CRC_mRMRe_results <- data.frame(c(CRC_mRMRe@filters, CRC_mRMRe@scores))
write.csv(CRC_mRMRe_results, "./mRMRe/CRC_mRMRe_results100.csv")

#GBM
GBM_mRMR <- read.csv("GBM.mRMR.csv", header = T)
GBM_mRMR$class <- as.numeric(GBM_mRMR$class)
dd <- mRMR.data(data = GBM_mRMR)
GBM_mRMRe <- mRMR.classic(data = dd, target_indices = c(1), feature_count = 81)
GBM_mRMRe_results <- data.frame(c(GBM_mRMRe@filters, GBM_mRMRe@scores))
write.csv(GBM_mRMRe_results, "./mRMRe/GBM_mRMRe_results100.csv")

#generate subsets of mRMRe selected genes for each cancer type - Breast
Breast_mRMR <- data.frame(Breast_mRMR)
Breast_mRMR_selected <- Breast_mRMR[,breast_mRMRe_results[,1]]
write.csv(Breast_mRMR_selected, "./mRMRe/Breast_mRMR_selected100.csv")

#generate ge matrix for classification - Breast
Breast_mRMR_selected_ge <- cbind(Breast_mRMR_selected, Breast_mRMR$class)
colnames(Breast_mRMR_selected_ge)[675] <- "class"
Breast_ge <- as.data.frame(read.csv("Breast_rlog_proc.csv", header = T))
Breast_mRMR_selected_ge <- cbind(Breast_ge$X, Breast_mRMR_selected_ge)
for (i in c(1:length(Breast_mRMR_selected_ge$class))){
  if (Breast_mRMR_selected_ge$class[i] == 1){
    Breast_mRMR_selected_ge$class[i] <- "Breast"
  }
  else {
    Breast_mRMR_selected_ge$class[i] <- "HC"
  }
}
write.csv(Breast_mRMR_selected_ge, "./mRMRe/Breast_mRMR_selected_ge100.csv")

#generate subsets of mRMRe selected genes for each cancer type - Lung
Lung_mRMR <- data.frame(Lung_mRMR)
Lung_mRMR_selected <- Lung_mRMR[,Lung_mRMRe_results[,1]]
write.csv(Lung_mRMR_selected, "./mRMRe/Lung_mRMR_selected100.csv")

#generate ge matrix for classification - Lung
Lung_mRMR_selected_ge <- cbind(Lung_mRMR_selected, Lung_mRMR$class)
colnames(Lung_mRMR_selected_ge)[857] <- "class"
Lung_ge <- as.data.frame(read.csv("Lung_rlog_proc.csv", header = T))
Lung_mRMR_selected_ge <- cbind(Lung_ge$X, Lung_mRMR_selected_ge)
for (i in c(1:length(Lung_mRMR_selected_ge$class))){
  if (Lung_mRMR_selected_ge$class[i] == 1){
    Lung_mRMR_selected_ge$class[i] <- "Lung"
  }
  else {
    Lung_mRMR_selected_ge$class[i] <- "HC"
  }
}
write.csv(Lung_mRMR_selected_ge, "./mRMRe/Lung_mRMR_selected_ge100.csv")

#generate subsets of mRMRe selected genes for each cancer type - CRC
CRC_mRMR <- data.frame(CRC_mRMR)
CRC_mRMR_selected <- CRC_mRMR[,CRC_mRMRe_results[,1]]
write.csv(CRC_mRMR_selected, "./mRMRe/CRC_mRMR_selected100.csv")

#generate ge matrix for classification - CRC
CRC_mRMR_selected_ge <- cbind(CRC_mRMR_selected, CRC_mRMR$class)
colnames(CRC_mRMR_selected_ge)[1592] <- "class"
CRC_ge <- as.data.frame(read.csv("CRC_rlog_proc.csv", header = T))
CRC_mRMR_selected_ge <- cbind(CRC_ge$X, CRC_mRMR_selected_ge)
for (i in c(1:length(CRC_mRMR_selected_ge$class))){
  if (CRC_mRMR_selected_ge$class[i] == 1){
    CRC_mRMR_selected_ge$class[i] <- "CRC"
  }
  else {
    CRC_mRMR_selected_ge$class[i] <- "HC"
  }
}
write.csv(CRC_mRMR_selected_ge, "./mRMRe/CRC_mRMR_selected_ge100.csv")

#generate subsets of mRMRe selected genes for each cancer type - GBM
GMB <- data.frame(GBM_mRMR)
GBM_mRMR_selected <- GBM_mRMR[,GBM_mRMRe_results[,1]]
write.csv(GBM_mRMR_selected, "./mRMRe/GBM_mRMR_selected100.csv")

#generate ge matrix for classification - GBM
GBM_mRMR_selected_ge <- cbind(GBM_mRMR_selected, GBM_mRMR$class)
colnames(GBM_mRMR_selected_ge)[82] <- "class"
GBM_ge <- as.data.frame(read.csv("GBM_rlog_proc.csv", header = T))
GBM_mRMR_selected_ge <- cbind(GBM_ge$X, GBM_mRMR_selected_ge)
for (i in c(1:length(GBM_mRMR_selected_ge$class))){
  if (GBM_mRMR_selected_ge$class[i] == 1){
    GBM_mRMR_selected_ge$class[i] <- "GBM"
  }
  else {
    GBM_mRMR_selected_ge$class[i] <- "HC"
  }
}
write.csv(GBM_mRMR_selected_ge, "./mRMRe/GBM_mRMR_selected_ge100.csv")

