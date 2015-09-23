## Install Required Packages

library(knitr)
library(markdown)
library(rmarkdown)

## Describe Data

distribution_list <- read.csv(file = "distribution.csv")

## Loop

for (i in 1:nrow(distribution_list)){
  rmarkdown::render(input ="mail_merge_template.Rmd", 
                    output_format = "pdf_document",
                    output_file = paste("Continuous_Monitoring_Report_", i,"_",Sys.Date() , ".pdf", sep=''),
                    output_dir = "Reports/")
}
