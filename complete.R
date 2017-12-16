complete <- function(directory, id=1:332){
  list=dir(directory,full.names = TRUE)
  nobs=c()
  for(i in id){
    nobs=c(nobs,sum(complete.cases(read.csv(list[i]))))
  }
  data.frame(id,nobs)
}