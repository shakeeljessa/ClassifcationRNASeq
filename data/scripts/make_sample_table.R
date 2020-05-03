library(kableExtra)
library(knitr)

sample_table <- data.frame("Cancer Samples" = c(39, 42, 40, 60, 35, 14, 55))
row.names(sample_table) <- c("Breast", "Colorectal", "Gliboblastoma", "Non-small-cell Lung", "Pancreas", "Hepatobilliary", "Healthy Control")
colnames(sample_table) <- c("Sample Count")

png("kable_sample_table.png", res = 300, type = "cairo")
kable(sample_table) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"), full_width = F) %>%
  save_kable(file ="kable_sample_table.png")
dev.off()