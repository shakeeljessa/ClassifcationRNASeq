# load packages
library(caret)
library(getopt)
source('RF/import.R')

spec = matrix(c('target_matrix', 'm', 1, 'character',
                'feature', 'f', 1, 'character',
                'output_file_name', 'o', 1, 'character',
                'seed', 's', 2, 'integer',
                'tune', 't', 2, 'integer'),
              byrow = TRUE, ncol = 4)

opt = getopt(spec)

# set optional parameters
if(!is.null(opt$seed)) { opt$seed <- 1 }
if(is.null(opt$tune)) { opt$tune <- 10 }

getCSV <- function(dirName){
  x <- list.files(path = dirName,pattern =".csv",recursive = TRUE)
  return(x)
}

#DEBUG CODE#
#opt$target_matrix <- "data/tables/processedsubsets/rlog/Breast.csv"
#opt$feature <- "cancer_type"
#opt$output_file_name <- "test"
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
  fit.RF <- train(form, data = training, method = "rf", metric = "Kappa",
                         trControl=trctrl, tuneLength = opt$tune)
  predictions <- predict(fit.RF, newdata = testing)
  
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
  
  #write out files
  #write.csv(fit.RF[["results"]][["Kappa"]], file = generateFileDir("Kappas", opt$output_file_name, "csv"))
  #write.csv(output, file = generateFileDir("RF/Predictions", opt$output_file_name, "csv"))
  #write.csv(cfByClass, file = generateFileDir("RF/cfByClass", opt$output_file_name, "csv"))
  #write.csv(cfOverall, file = generateFileDir("RF/cfOverall", opt$output_file_name, "csv"))
  #capture.output(cf, file = generateFileDir("RF/ConfusionMatrices", opt$output_file_name, "csv"))
  #capture.output(fit.RF, file = generateFileDir("RF/fits", opt$output_file_name, "txt"))
  
  saveRDS(fit.RF, file = generateFileDir(paste(opt$output_file_name,"Models/",last_dir,sep = ""), outputName,"rds"))
  write.csv(output, file = generateFileDir(paste(opt$output_file_name,"Predictions/",last_dir,sep = ""), outputName,"csv"))
  capture.output(cf, file = generateFileDir(paste(opt$output_file_name,"ConfusionMatrices/",last_dir,sep=""), outputName, "txt"))
  capture.output(fit.RF, file = generateFileDir(paste(opt$output_file_name,"Fits/",last_dir,sep =""), outputName, "txt"))
  write.table(cfByClass, file = generateFileDir(paste(opt$output_file_name,"cfByClass/",last_dir,sep = ""), outputName,"csv"), sep=",",  col.names=FALSE)
  write.table(cfOverall, file = generateFileDir(paste(opt$output_file_name,"cfOverall/",last_dir,sep = ""), outputName,"csv"), sep=",",  col.names=FALSE)
  
}