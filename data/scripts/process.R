library(getopt)
source("scripts/import.R")


spec = matrix(c('subset_file_name', 'n', 1, 'character', 
                'annot_matrix', 'a', 2, 'character',
                'output_file_name', 'o', 1, 'character',
                'center', 'c', 2, 'logical',
                'scale', 's', 2, 'logical',
                'append', 'p', 2, 'logical'), 
              byrow = TRUE, ncol = 4)
opt = getopt(spec)

#DEBUG CODE, REMOVE#
#opt$subset_file_name <- 'Subsets/rlog/Breast.csv'
#opt$annot_matrix <- 'Importing/GSE68086_TEP_data_matrix.txt'
#opt$center <- TRUE
#opt$scale <- TRUE
#opt$append <- TRUE

#Assign values to optionals
if ( is.null(opt$center ) ) { opt$center <- FALSE}
if ( is.null(opt$scale ) ) { opt$scale <- FALSE}
if ( is.null(opt$append ) ) { opt$append <- FALSE}

subset <- read.csv(opt$subset_file_name, row.names = 1, check.names = FALSE)
subset <- data.frame(scale(subset, center = opt$center, scale = opt$scale))

if(isTRUE(opt$append)) {
  annot_matrix <- importAnnotations(opt$annot_matrix)
  annot_matrix <- subset(annot_matrix, rownames(annot_matrix) %in% rownames(subset))
  subset$cancer_type <- annot_matrix$cancer_type
}

write.csv(subset, file = opt$output_file_name)