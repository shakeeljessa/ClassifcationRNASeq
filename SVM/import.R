##import.R contains functions used for importing the series matrix and counts matrix
##in other scripts

rawCountFile <- "tables/raw/GSE68086_TEP_data_matrix.txt"
seriesMatrixFile <- "tables/raw/GSE68086_series_matrix_fixed_to_import.txt"

importCountMatrixDefault <- function(){
  return(importCountMatrix(rawCountFile))
}

importAnnotationsDefault <- function(){
  return(importAnnotations(seriesMatrixFile))
}

importCountMatrix <- function(count_file_name){
  counts <- as.matrix(read.csv(count_file_name, sep = "\t", header = TRUE, row.names = 1, check.names = FALSE))
  return(counts)
}

importDESeqData <- function(DESeq_file_name){
  DEData <- read.csv(DESeq_file_name, row.names = 1, check.names = FALSE)
  DEData <- data.frame(DEData)
  return(DEData)
}

importAnnotations <- function(annot_file_name){
  colData <- read.csv(seriesMatrixFile, sep = "\t", row.names = 1, check.names = FALSE)
  colData <- t(colData)
  colData <- data.frame(colData)
  return(colData)
}

generateFileDir <- function(folder_name, file_name, suffix){
  file_name_combined <- paste(folder_name, file_name, sep = "/")
  file_name_combined <- paste(file_name_combined, suffix, sep = ".")
  return(file_name_combined)
}

importNonBatchAffectedCountMatrix <- function(){
  new_count_matrix <- importCountMatrixDefault()
  gene_affected_file_name = "tables/batchvariances/genes_affected_by_batch"
  genes_affected <- scan(gene_affected_file_name, what="", sep="\n")
  new_count_matrix <- new_count_matrix[!(row.names(new_count_matrix) %in% genes_affected),]
  return(new_count_matrix)
}

