#setwd('C:/Users/fzhan/Documents/GitHub/R for Data Science')
pollutantmean <- function (directory,pollutant,id=1:332){
  list=dir(directory,full.names = TRUE)
  data=data.frame()
  for (i in id){
    data=rbind(data,read.csv(list[i]))
  }
  mean(data[,pollutant],na.rm = TRUE)
}