#'@title Plotting stacked bar charts of abundance data
#'@description
#'  This function takes cleaned datasets as an input. If there is only one clean dataset input, it will plot a stacked bar chart. If there are two clean dataset inputs, it will plot a clustered stacked bar chart. It allows for comparison through different years that data is collected.
#' 
#'@param df1 The name of one specified data set
#'@param df2 The name of the second specified data set. If NULL, the default, the function will just use the first specified dataset to plot a stacked bar chart.
#'@export 

HHplot <- function(df1, df2 = NULL){
  library(ggplot2)
  library(dplyr)
  
  #just plot df1
  if(is.null(df2)){ 
    #graph with these lines of code if only one df is given
    one_plot <- ggplot(df1, aes(fill=phylum, y=abundance, x=plot)) + 
      geom_bar(position='stack', stat='identity')
    
    print(one_plot)
  } else {
    #graph with these lines of code if two dfs are given
    
    #make a new dataframe where it's just the rows that have a plot that shows up in 2016 and 2017
    dat2 <- df1[df1$plot %in% df2$plot, ]
    dat3 <- df2[df2$plot %in% df1$plot, ]
    combo_dat <- as.data.frame(rbind(dat2, dat3))
    character_date <- as.character(combo_dat$year)
    combo_dat[["year"]] <- character_date
    
    combo_plot <- ggplot(combo_dat, aes (fill = phylum,
                                         y = abundance,
                                         x = year)) +
      geom_bar(position = "stack",
               stat = "identity") +
      facet_wrap(~ plot)
    
    print(combo_plot)
    }
}
