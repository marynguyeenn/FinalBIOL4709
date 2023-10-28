#'@title Transforming rRNA/ITS sequencing data to a similar, standard format
#'@description 
#'  This function takes the an input of sequenced rRNA/ITS data and changes its structure from wide, to long. It also categorizes the information by the phylum taxonomy, and adds a column to indicate the year that the data samples were taken.
#' 
#'@param df The name of the specified data set
#'@param year The year the that the data set was collected
#'@import dplyr
#'@import tidyr
#'@export 

HHclean <- function(df, year){ 
  #I would like to call the HHsplit function I wrote to split the complete taxonomic name
  df_long <- HHsplit(df)
  
  #this should make the wide df into a longer df
  abun_long <- df_long %>%
    tidyr::pivot_longer(!X.OTU.ID, names_to = "plot", values_to = "abundance")
  
  #change the name of the bacteria column to "phylum"
  abun_long <- abun_long %>% 
    dplyr::rename_at('X.OTU.ID', ~'phylum')
  
  #this adds a column for the year based on your input
  abun_long <- abun_long %>%
    dplyr::mutate(year=c(year))
  
  #I like to see things
  View(abun_long)
  return(abun_long)
}
