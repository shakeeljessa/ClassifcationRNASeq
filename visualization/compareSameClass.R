library(ggplot2)
library(getopt)

getCSV <- function(dirName){
  x <- list.files(path = dirName,pattern =".csv",recursive = TRUE)
  return(x)
}

## pass in name of transformation and either overall or byClass

spec = matrix(c('transformation', 't', 1, 'character',
                'file_type', 'f', 1, 'character'),
                
              byrow = TRUE, ncol = 4)
              
opt = getopt(spec)

#opt$classifier_name <- "KNN"
#opt$transformation <- "rlog"
#opt$file_type <- "overall"


class <- c("KNN","NB","SVM","RF")
#fileName <- paste(opt$classifier_name,opt$file_type,".csv",sep = "")
mainCSV <- setNames(data.frame(matrix(ncol = 3, nrow = 0)), c("Kappa", "Name","Classifier"))
init_path <- "visualization/combinedComparisons/"

for(i in getCSV(init_path)){
  for(c in class){
     #print(paste(init_path, sub("\\/.*", "", i),"/",c,opt$file_type,".csv",sep = ""))
        df <- read.csv(paste(init_path, sub("\\/.*", "", i),"/",c,opt$file_type,".csv",sep = ""), row.names = 1,check.names = FALSE)
        temp <- data.frame("Kappa" = df[opt$transformation,2], "Name" = sub('\\/..*',"",i),"Classifier" = c)
        mainCSV = rbind(mainCSV,temp)
  }
}

mainCSV$Name <- factor(mainCSV$Name, levels = c("Top20","Top40","Top60","Top80","All"))
ggplot(mainCSV,aes(fill = Classifier, y = Kappa, x = Name))+
  geom_bar( position = "dodge", stat = "identity",width = .7)+
  ggtitle(paste("Kappas Across Feature Subsets(",opt$transformation,")",sep = ""))+
  theme(plot.title = element_text(hjust = 0.5))+
  ylim(0,1.0)+
  xlab("Feature Subsets")


ggsave(paste("visualization/combinedComparisons/final_visualizations/",opt$transformation,"AcrossSubsets",".jpg",sep = ""))
           