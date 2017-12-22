setwd('C:/Users/fzhan/Documents/GitHub/R for Data Science/rprog%2Fdata%2FProgAssignment3-data')
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

outcome[,11]=as.numeric(outcome[,11])
hist(outcome[, 11])