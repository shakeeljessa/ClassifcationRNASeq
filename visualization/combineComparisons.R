#i -> Breast.csv example
#outputName -> Breast
#lastdir -> rlog

library(getopt)
library(ggplot2)
library(reshape2)

getCSV <- function(dirName){
  x <- list.files(path = dirName,pattern =".csv",recursive = TRUE)
  return(x)
}

generateFileDir <- function(folder_name, file_name, suffix){
  file_name_combined <- paste(folder_name, file_name, sep = "/")
  file_name_combined <- paste(file_name_combined, suffix, sep = ".")
  return(file_name_combined)
}

spec = matrix(c('target_folder', 'm', 1, 'character', 
                'output_file_dir', 'o', 1, 'character',
                'output_file_name', 'n', 1, 'character',
                'num_rows', 'r', 1, 'integer'), 
              byrow = TRUE, ncol = 4)
opt = getopt(spec)

#Debugging
#opt$target_folder <- "visualization/comparisons/KNN/overall/"
#opt$num_rows <- 7


combined <- data.frame(matrix(, nrow = opt$num_rows, ncol = 0))
column_vector <- c()

for(i in getCSV(opt$target_folder)) {
  last_dir = basename(opt$target_folder)
  outputName <- sub(".*/","",i)
  outputName <- sub('\\..*',"",outputName)
  i <- trimws(i ,"l")
  
  
  df <- read.csv(file = paste(opt$target_folder, i, sep = ""), row.names = 1, header = TRUE)
  
  combined <- cbind(combined, df$average)
  rownames(combined) <- rownames(df)
  column_vector <- c(column_vector, outputName)
}

colnames(combined) <- column_vector
combined <- data.frame(t(combined))

dir.create(opt$output_file_dir, recursive = TRUE)
write.csv(combined, file = generateFileDir(opt$output_file_dir, opt$output_file_name, "csv"))