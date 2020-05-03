#begin rfe on actual data
# run the RFE algorithm breast 20
Breast_rfe <- read.csv("/stor/work/FRI-BigDataBio/classification/data/tables/processedsubsetsTop20/rlog/Breast.csv", header = T)
control <- rfeControl(functions=rfFuncs, method="cv", number=10)


results <- rfe(Breast_rfe[,2:136], Breast_rfe[,137], sizes=c(1:ncol(Breast_rfe)), rfeControl=control)
selected <- predictors(results)
selected <- append(selected, "cancer_type", after = 0)
breast_mRMRe_results <- subset(Breast_rfe, select=selected)
write.csv(breast_mRMRe_results, "./rfe/Breast_rfe_results20.csv")

# run the RFE algorithm breast 40
Breast_rfe <- read.csv("/stor/work/FRI-BigDataBio/classification/data/tables/processedsubsetsTop40/rlog/Breast.csv", header = T)
control <- rfeControl(functions=rfFuncs, method="cv", number=10)


results <- rfe(Breast_rfe[,2:271], Breast_rfe[,272], sizes=c(1:ncol(Breast_rfe)), rfeControl=control)
selected <- predictors(results)
selected <- append(selected, "cancer_type", after = 0)
breast_mRMRe_results <- subset(Breast_rfe, select=selected)
write.csv(breast_mRMRe_results, "./rfe/Breast_rfe_results40.csv")

# run the RFE algorithm breast 60
Breast_rfe <- read.csv("/stor/work/FRI-BigDataBio/classification/data/tables/processedsubsetsTop60/rlog/Breast.csv", header = T)
control <- rfeControl(functions=rfFuncs, method="cv", number=10)


results <- rfe(Breast_rfe[,2:405], Breast_rfe[,406], sizes=c(1:ncol(Breast_rfe)), rfeControl=control)
selected <- predictors(results)
selected <- append(selected, "cancer_type", after = 0)
breast_mRMRe_results <- subset(Breast_rfe, select=selected)
write.csv(breast_mRMRe_results, "./rfe/Breast_rfe_results60.csv")

# run the RFE algorithm breast 80
Breast_rfe <- read.csv("/stor/work/FRI-BigDataBio/classification/data/tables/processedsubsetsTop80/rlog/Breast.csv", header = T)
control <- rfeControl(functions=rfFuncs, method="cv", number=10)


results <- rfe(Breast_rfe[,2:540], Breast_rfe[,541], sizes=c(1:ncol(Breast_rfe)), rfeControl=control)
selected <- predictors(results)
selected <- append(selected, "cancer_type", after = 0)
breast_mRMRe_results <- subset(Breast_rfe, select=selected)
write.csv(breast_mRMRe_results, "./rfe/Breast_rfe_results80.csv")


# run the RFE algorithm breast 100
Breast_rfe <- read.csv("/stor/work/FRI-BigDataBio/classification/data/tables/processedsubsets/rlog/Breast.csv", header = T)
control <- rfeControl(functions=rfFuncs, method="cv", number=10)


results <- rfe(Breast_rfe[,2:675], Breast_rfe[,676], sizes=c(1:ncol(Breast_rfe)), rfeControl=control)
selected <- predictors(results)
selected <- append(selected, "cancer_type", after = 0)
breast_mRMRe_results <- subset(Breast_rfe, select=selected)
write.csv(breast_mRMRe_results, "./rfe/Breast_rfe_results100.csv")
