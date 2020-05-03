library(getopt)
source('scripts/import.R')

generateDEGSubset <- function(LFCcutOff, pValCutoff, DESeq_data, normalized_counts_matrix){
  DESeq_data['log2FoldChange'] <- abs(DESeq_data['log2FoldChange'])
  DESeq_data <- subset(DESeq_data, log2FoldChange >= LFCcutOff)
  DESeq_data <- subset(DESeq_data, padj < pValCutoff)
  return(DESeq_data)
}

spec = matrix(c('normalized_count_matrix_file_name', 'n', 1, 'character', 
                'DESeq_file_name', 'd', 1, 'character',
                'annot_matrix', 'a', 1, 'character',
                'adjp', 'p', 1,  'double', 
                'lfc', 'l', 1, 'double', 
                'output', 'o', 1, 'character',
                'top_percentile', 't', 2, 'double'), 
              byrow = TRUE, ncol = 4)
opt = getopt(spec)

#DEBUG CODE, REMOVE#
#opt$normalized_count_matrix_file_name <- 'tables/normalizedCounts/rlog/GBM.csv'
#opt$DESeq_file_name <- 'tables/DESeq/GBM.csv'
#opt$annot_matrix <- 'tables/raw/GSE68086_series_matrix_fixed_to_import.txt'
#opt$lfc <- 2.5
#opt$adjp <- .05
#opt$top_percentile <- .2
#opt$output <- "Subsets/rlog/CRC.csv"


count_df <- read.csv(opt$normalized_count_matrix_file_name, row.names = 1, check.names = FALSE)
annot_matrix <- importAnnotations(opt$annot_matrix)
DESeq_data <- importDESeqData(opt$DESeq_file_name)
DESeq_data <- generateDEGSubset(opt$lfc, opt$adjp, DESeq_data, count_df)


if(!is.null(opt$top_percentile)) {
  quantile_boundary <- quantile(DESeq_data$padj, 1.0 - opt$top_percentile)
  DESeq_data <- subset(DESeq_data, padj >= quantile_boundary)
}

count_df <- subset(count_df, rownames(count_df) %in% rownames(DESeq_data))

count_df <- as.matrix(t(count_df))
write.csv(count_df, file = opt$output)
