library(factoextra)
library(ggsignif)
library(gridExtra)
library(getopt)

#Define parameters
spec = matrix(c('subset_file_name', 'n', 1, 'character', 
                'output_file_name', 'o', 1, 'character',
                'seed', 's', 2, 'integer'), 
              byrow = TRUE, ncol = 4)
opt = getopt(spec)

#DEBUG CODE#
#opt$subset_file_name <- "ProcessedSubsets/rlog/Breast.csv"
#opt$output_file_name <- "ElbowPlots/rlog/Breast.pdf"

#Input counts csv (NOTE: LAST COLUMN MUST BE THE CANCER STATUS BECAUSE IT WILL BE REMOVED)
df <- read.csv(file = opt$subset_file_name, row.names = 1, check.names = FALSE)
df <- df[,-ncol(df)]

#Check for optional parameter
if(!is.null(opt$seed)) {set.seed(opt$seed)}

#Output PDF
pdf(opt$output_file_name)
print(fviz_nbclust(df, kmeans, method = "wss"))
dev.off()