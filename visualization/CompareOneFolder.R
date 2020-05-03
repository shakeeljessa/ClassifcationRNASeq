library(ggplot2)
library(getopt)

getCSV <- function(dirName){
  x <- list.files(path = dirName,pattern =".csv",recursive = TRUE)
  return(x)
}
#Pass in directory of folder
spec = matrix(c('folder_name', 'f', 1, 'character',
                'file_type','t', 1, 'character'),
              
              byrow = TRUE, ncol = 4)

opt = getopt(spec)

#opt$classifier_name <- "NB"
#opt$folder_name <- "visualization/combinedComparisons/All/"
#opt$file_type <- "overall"

#fileName <- paste(opt$classifier_name,opt$file_type,".csv",sep = "")
mainCSV <- setNames(data.frame(matrix(ncol = 3, nrow = 0)), c("Kappa", "Name","Transformation"))
#init_path <- "visualization/combinedComparisons/"

for(i in getCSV(opt$folder_name)){
  if(grepl(opt$file_type, i)){
    df <- read.csv(paste(opt$folder_name,i,sep = ""), row.names = 1,check.names = FALSE)
    temp <- data.frame("Kappa" = df[,2], "Name" = rep(sub('\\/..*',"",i),4),"Transformation" = rownames(df))
    mainCSV = rbind(mainCSV,temp)
  }
}

ggplot(mainCSV,aes(fill = Transformation, y = Kappa, x = Name))+
  geom_bar( position = "dodge", stat = "identity",width = .7)+
  ggtitle("Kappas across Classifiers Using All DEGs")+
  theme(plot.title = element_text(hjust = 0.5))+
  ylim(0,1.0)+
  xlab("Classifiers")
#ggplot(mainCSV, aes(Name, Kappa))+
 #geom_bar(stat = 'identity',fill = 'steelblue',width = .7)
print(basename(opt$folder_name))
ggsave(paste("visualization/combinedComparisons/final_visualizations/",basename(opt$folder_name),"Visualization",".jpg",sep = ""))
