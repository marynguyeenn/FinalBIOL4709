#'@title Split and specify a taxonomic family 
#'@description
#'This function takes raw rRNA/ITS sequencing data frame as the input. The function takes the entire taxonomic name of a bacterial unit and splits it by the semicolons. The semicolons divide each of the different taxonomies. After it splits the complete taxonomic name, the function specifies and pulls out only the species' phylum level.
#' 
#'@param df The name of the specified data set
#'@export 

HHsplit <- function(df){
  #this line actually does the splitting
  split_string <- sapply(strsplit(df[["X.OTU.ID"]], ";"),"[[", 2)
  df[["X.OTU.ID"]] <- split_string
  
  return(df)
}
