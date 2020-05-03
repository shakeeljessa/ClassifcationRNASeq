library("tidyverse")
library("DESeq2")
source("scripts/import.R")
library("BiocParallel")
#CHANGE FOR NUMBER OF CORES
register(MulticoreParam(8))

generateBinaryCancerFrame <- function(cancer_name, columnData){
  control_name <- "HC"
  newFrame <- subset(columnData, cancer_type == control_name | cancer_type == cancer_name)
  return (newFrame)
}

runDESeqAfterRelevel <- function(cancer_name, cancer_type, counts, annotations){
  print(paste("running DESeq2 for:", cancer_name, sep = " "))
  ddsMatrix <- DESeqDataSetFromMatrix(countData = counts, colData = annotations, design = ~cancer_type)
  ddsMatrix$cancer_type <- relevel(ddsMatrix$cancer_type, ref = "HC")
  keep <- rowSums(counts(ddsMatrix)) >= 10
  ddsMatrix <- ddsMatrix[keep,]
  
  #Uncomment if we need new ones later (shouldn't)
  #runRLOGandVSTtoFile(ddsMatrix, cancer_name)
  
  dds <- DESeq(ddsMatrix, parallel = TRUE)
  return(dds)
}

runRLOGandVSTtoFile<- function(ddsMatrix, cancer_name){
  print(paste("running vst for", cancer_name, sep = " "))
  vstBlindDir <- generateFileDir("tables/normalizedCounts/vstBlind", cancer_name, "csv")
  vstMatrix <- vst(ddsMatrix, blind = TRUE)
  write.csv(assay(vstMatrix), file=vstBlindDir)
  vstDir <- generateFileDir("tables/normalizedCounts/vst", cancer_name, "csv")
  vstMatrix <- vst(ddsMatrix, blind = FALSE)
  write.csv(assay(vstMatrix), file=vstDir)
  print(paste("running rlog for", cancer_name, sep = " "))
  rLogBlindDir <- generateFileDir("tables/normalizedCounts/rlogBlind", cancer_name, "csv")
  rLogMatrix <- rlog(ddsMatrix, blind = TRUE)
  write.csv(assay(rLogMatrix), file = rLogBlindDir)
  rLogDir <- generateFileDir("tables/normalizedCounts/rlog", cancer_name, "csv")
  rLogMatrix <- rlog(ddsMatrix, blind = FALSE)
  write.csv(assay(rLogMatrix), file = rLogDir)
}

organizeAndPrintResults <- function(cancer_name, jpg_file_name, DESeqObj){
  print(paste("printing results for:", cancer_name, sep = " "))
  jpg_dir <- generateFileDir("jpg", jpg_file_name, "jpg")
  generateJpgFiles(jpg_dir, DESeqObj)
  res<-results(DESeqObj)
  res_ordered<-res[order(res$padj),]
  mcols(res,use.names=TRUE)
  summary(res)
  out_file_dir <- generateFileDir("tables/DESeq", cancer_name, "csv")
  write.csv(res_ordered, out_file_dir)
}

generateJpgFiles <- function(jpg_file_name, dds){
  jpeg(jpg_file_name)
  plotMA(dds,ylim=c(-2,2),main="DESeq2")
  dev.off()
}


print("importing annotations and count matrix")
cts <- importNonBatchAffectedCountMatrix()
colData <- importAnnotationsDefault()

print("subsetting annotations matrix into binary cancer / no cancer frames")
breastSamples <- generateBinaryCancerFrame("Breast", colData)
lungSamples <- generateBinaryCancerFrame("Lung", colData)
colonSamples <- generateBinaryCancerFrame("CRC", colData)
hepatSamples <- generateBinaryCancerFrame("Hepatobiliary", colData)
glioSamples <- generateBinaryCancerFrame("GBM", colData)
pancreasSamples <- generateBinaryCancerFrame("Pancreas", colData)

print("subsetting counts matrix into respective binary cancer frames")
breastCts <- cts[,rownames(breastSamples)]
lungCts <- cts[,rownames(lungSamples)]
colonCts <- cts[,rownames(colonSamples)]
hepatCts <- cts[,rownames(hepatSamples)]
glioCts <- cts[,rownames(glioSamples)]
pancreasCts <- cts[,rownames(pancreasSamples)]


#Run six instances of DESeq2 on each individual cancer type.
ddsBreast <- runDESeqAfterRelevel("Breast", Breast, breastCts, breastSamples)
organizeAndPrintResults("Breast", "MABreast", ddsBreast)

ddsLung <- runDESeqAfterRelevel("Lung", Lung, lungCts, lungSamples)
organizeAndPrintResults("Lung", "MALung", ddsLung)

ddsColon <- runDESeqAfterRelevel("CRC", CRC, colonCts, colonSamples)
organizeAndPrintResults("CRC", "MAColon", ddsColon)

ddsHepat <- runDESeqAfterRelevel("Hepatobiliary", Hepatobiliary, hepatCts, hepatSamples)
organizeAndPrintResults("Hepatobiliary", "MAHepat", ddsHepat)

ddsGlio <- runDESeqAfterRelevel("GBM", GBM, glioCts, glioSamples)
organizeAndPrintResults("GBM", "MAGlio", ddsGlio)

ddsPancreas <- runDESeqAfterRelevel("Pancreas", Pancreas, pancreasCts, pancreasSamples)
organizeAndPrintResults("Pancreas", "MAPancreas", ddsPancreas)
