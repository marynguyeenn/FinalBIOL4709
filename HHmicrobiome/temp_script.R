library(devtools)
library(roxygen2)

testing1 <- read.csv("16s_2016_Genus_RelativeAbundance.csv")
testing2 <- read.csv("16s_2017_Genus_RelativeAbundance.csv")

use_data(testing) 

library(HHmicrobiome)

HHclean(testing)

create("HHmicrobiome",
       rstudio = FALSE,
       roxygen = TRUE,
       open = FALSE)

setwd("HHmicrobiome")

#make sure everything is clear and closed before running the document function!
document()

use_data(testing1, testing2)

use_vignette("HHmicrobiome_vignette")
