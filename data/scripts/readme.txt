CREDIT: Dhivya Arasappan for providing original script we modified to create this version of the script.

README Filter Module
name of file: generatingBatchVariances.R
Run with Rscript command on Bash.

This script currently requires no arguments and is hard-coded to handle our dataset. This will be changed in the future.

This program is currently coded to utilize 6 cores for differential gene expression analysis.

This program requires file import.R to be present in the working directory.


The series annotations and counts matrix file must be tap delimited.
In the counts matrix, the row index must be genes and the column index must be samples.

It is recommended that the series annotations tsv is cut down to the necessary information, being the class type along with other relevant information.

The annotation file must have the analyzed characteristic defined as cancer_type for best functionality.

The script uses the following packages: tidyverse, DESeq2, BiocParallel

The script should a new file named DESeq2-genes_affected_by_batch_LRT.csv
USE THE FOLLOWING COMMAND AFTER TO IDENTIFY GENES SIGNIFICANTLY AFFECTED BY BATCH
sed 's/,/\t/g' DESeq2-genes_affected_by_batch_LRT.csv|awk '{if ((($3>=2)||($3<=-2))&&($7<=0.01)) print $1}' > genes_affected_by_batch

This will generate a new text file with a list of all the affected genes.

!!DELETE EMPTY NAMES AND ALL QUOTATION MARKS!!