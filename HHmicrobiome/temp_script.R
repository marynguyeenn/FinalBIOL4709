library(devtools)
library(roxygen2)

df2016 <- read.csv("16s_2016_Genus_RelativeAbundance.csv")
df2017 <- read.csv("16s_2017_Genus_RelativeAbundance.csv")

use_data(testing) 

library(HHmicrobiome)

HHclean(testing)

create("HHmicrobiome1",
       rstudio = FALSE,
       roxygen = TRUE,
       open = FALSE)

setwd("HHmicrobiome1")

#make sure everything is clear and closed before running the document function!
document()

use_data(df2016, df2017)

use_vignette("HHmicrobiome_vignette")
