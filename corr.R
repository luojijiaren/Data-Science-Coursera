corr <- function (directory,threshold=0){
  list=dir(directory,full.names = TRUE)
  out=c()
  for(i in list){
    d=read.csv(i)
    if (sum(complete.cases(d))>=threshold){
      o1=cor(d[,2],d[,3],use='pairwise.complete.obs')
      out=c(out,o1)
    }
  }
  out

}