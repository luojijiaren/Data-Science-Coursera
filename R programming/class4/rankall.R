rankall <- function(outcome, num = "best") {
  ## Read outcome data
  d=read.csv("outcome-of-care-measures.csv", colClasses = "character",na.strings = 'Not Available')
  
  ## Check that outcome is valid
  if (outcome=='heart attack'){select <-11}
  else if (outcome=='heart failure'){select <-17}
  else if (outcome=='pneumonia'){select <-23}
  else {stop('invalid outcome')}
  
  ## For each state, find the hospital of the given rank

  d1=d[,c(7,select,2)]
  d2=d1[!is.na(d1[,2]),]
  d2[,2]=suppressWarnings(as.numeric(d2[,2]))
  outp=NULL
  for (state in unique(d2[,1])) {
    d3=d2[d2$State==state,]
    d4=d3[order(d3[,2],d3[,3]),]
    if (num=='best') {out=d4[1,3]}
    else if (num=='worst') {out=d4[nrow(d4),3]}
    else {
      num=as.numeric(num)
      if (is.na(num)) {stop('invalid num')}
      else if (num>nrow(d4)){out=NA}
      else{out=d4[num,3]}
    }
    outp=rbind(outp,c(out,state))
  }
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  outp=outp[order(outp[,2]),]
  colnames(outp)=c('hospital','state')
  as.data.frame(outp)

}