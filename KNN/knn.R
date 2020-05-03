library(getopt)
library(caret)
source("KNN/import.R")

#Parameters
spec = matrix(c('target_matrix', 'm', 1, 'character', 
                'output_file_name', 'o', 1, 'character',
                'feature', 'f', 1, 'character',
                'seed', 's', 2, 'integer',
                'tune', 't', 2, 'integer'), 
              byrow = TRUE, ncol = 4)
opt = getopt(spec)

getCSV <- function(dirName){
  x <- list.files(path = dirName,pattern =".csv",recursive = TRUE)
  return(x)
}

#DEBUG CODE#
#opt$target_matrix <- "data/tables/processedsubsetsTop20/vstBlind/Breast.csv"
#opt$feature <- "cancer_type"
#opt$output_file_name <- "test"

#Set optional parameters
if(!is.null(opt$seed)) { set.seed(opt$seed) }
if(is.null(opt$seed)) {set.seed(1) }
if(is.null(opt$tune)) { opt$tune <- 10 }
for(i in getCSV(opt$target_matrix)) {
  
  #trim file directory to just file name without extention ie. /subset/rlog/breast.csv -> breast
  last_dir = basename(opt$target_matrix)
  outputName <- sub(".*/","",i)
  outputName <- sub('\\..*',"",outputName)
  i <- trimws(i ,"l")
  
  #Read in CSV and split into 80% training, 20% testing
  df <- read.csv(file = paste(opt$target_matrix, i, sep = ""), row.names = 1, check.names = FALSE)
  intrain <- createDataPartition(df[,ncol(df)], p = .8, list = FALSE)
  training <- df[intrain,]
  testing <- df[-intrain,]
  
  #Define machine learning parameters and run training and predicting of data
  trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3, classProbs = T, savePredictions = T)
  form <- as.formula(paste(opt$feature, "~."))
  knn_fit <- train(form, data = training, method = "knn", metric = "Kappa", 
                   trControl=trctrl, tuneLength = opt$tune)
  predictions <- predict(knn_fit, newdata = testing)
  
  #Generate confusion matrix
  cf <- confusionMatrix(predictions, testing[,ncol(testing)])
  
  cfByClass <- data.frame(cf[["byClass"]])
  cfOverall <- data.frame(cf[["overall"]])
  colnames(cfByClass) <- NULL
  colnames(cfOverall) <- NULL
  
  #Generate output csv
  output <- data.frame(row.names = rownames(testing))
  output$label <- testing[,ncol(testing)]
  output$predicted <- predictions
  
  print("Writing CSV")
  dir.create(paste(opt$output_file_name,"ConfusionMatrices/",last_dir,sep=""), recursive =TRUE)
  dir.create(paste(opt$output_file_name,"Predictions/",last_dir,sep = ""), recursive = TRUE)
  dir.create(paste(opt$output_file_name,"Fits/",last_dir,sep =""), recursive = TRUE)
  dir.create(paste(opt$output_file_name,"cfByClass/",last_dir,sep =""), recursive = TRUE)
  dir.create(paste(opt$output_file_name,"cfOverall/",last_dir,sep =""), recursive = TRUE)
  dir.create(paste(opt$output_file_name,"Models/",last_dir,sep =""), recursive = TRUE)
  
  saveRDS(knn_fit, file = generateFileDir(paste(opt$output_file_name,"Models/",last_dir,sep = ""), outputName,"rds"))
  write.csv(output, file = generateFileDir(paste(opt$output_file_name,"Predictions/",last_dir,sep = ""), outputName,"csv"))
  capture.output(cf, file = generateFileDir(paste(opt$output_file_name,"ConfusionMatrices/",last_dir,sep=""), outputName, "txt"))
  capture.output(knn_fit, file = generateFileDir(paste(opt$output_file_name,"Fits/",last_dir,sep =""), outputName, "txt"))
  write.table(cfByClass, file = generateFileDir(paste(opt$output_file_name,"cfByClass/",last_dir,sep = ""), outputName,"csv"), sep=",",  col.names=FALSE)
  write.table(cfOverall, file = generateFileDir(paste(opt$output_file_name,"cfOverall/",last_dir,sep = ""), outputName,"csv"), sep=",",  col.names=FALSE)
}
