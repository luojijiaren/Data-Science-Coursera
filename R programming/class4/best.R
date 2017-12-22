

best <- function(state, outcome) {
  ## Read outcome data
  d=read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  d=d[d$State==state,]
  if (!state %in% unique(d$State)) {stop('invalid state')}
  if (!outcome %in% c('heart attack','heart failure','pneumonia')) {stop('invalid outcome')}

  ## Return hospital name in that state with lowest 30-day death
  ## rate  
  if (outcome=='heart attack'){select <-11}
  if (outcome=='heart failure'){select <-17}
  if (outcome=='pneumonia'){select <-23}
  d1=d[,c(select,2)]
  d2=d1[complete.cases(d1),]
  d2[,1]=suppressWarnings(as.numeric(d2[,1]))
  d3=d2[do.call(order,as.data.frame(d2)),]
  #or d3=d2[order(d2[,1],d2[,2]),]
  d3[1,2]
}
