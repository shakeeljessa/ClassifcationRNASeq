#credit to Dhivya Arasappan for providing the origial script we modified to create this version

#load libraries
library("tidyverse")
library('DESeq2')
source("scripts/import.R")
#remove if less
library("BiocParallel")
#CHANGE DEPENDING ON NUMBER OF CORES
register(MulticoreParam(8))


print("importing files...")
cts <- importCountMatrixDefault()
colData <- importAnnotationsDefault()

print("generating batchSeries dataframe...")
batchSeries <- colData
batchSeries$has_cancer <- ifelse(batchSeries$cancer_type == 'HC', "FALSE", "TRUE")
cts <- cts[, rownames(batchSeries)]

#USE THIS PORTION TO PERFORM LIKELIHOOD RATIO TEST TO IDENTIFY GENES AFFECTED HIGHLY BY BATCH

print("running DESeq2...")
ddsMatrix <- DESeqDataSetFromMatrix(countData = cts, colData = batchSeries, design = ~ has_cancer + batch)
#remove PARALLEL = TRUE if less cores
dds <- DESeq(ddsMatrix, test="LRT", full= ~has_cancer + batch, reduced=~has_cancer, parallel = TRUE)
res<-results(dds)
res_ordered<-res[order(res$padj),]
summary(res)
write.csv(res_ordered, "tables/batchvariances/DESeq2-genes_affected_by_batch_LRT.csv")
#USE THE FOLLOWING COMMAND AFTER TO IDENTIFY GENES SIGNIFICANTLY AFFECTED BY BATCH
#sed 's/,/\t/g' DESeq2-genes_affected_by_batch_LRT.csv|awk '{if ((($3>=2)||($3<=-2))&&($7<=0.01)) print $1}' > genes_affected_by_batch
#sed 's/\"//g' genes_affected_by_batch -i

