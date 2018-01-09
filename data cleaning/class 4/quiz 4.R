#Q1
setwd('C:\\Users\\fzhan\\Documents\\GitHub\\Data Science Coursera\\data cleaning\\class 4')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv','survey_house.csv')
d1<- read.csv('survey_house.csv')
#n=grep('^wgtp',names(d1),value=T)
m=strsplit(names(d1),'wgtp')
m[[123]]

#Q2
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv','GQP.csv')
d2=read.csv('GQP.csv')
d22=d2[5:194,c(1,2,4,5)]
mean(as.numeric(gsub(',','',d22$X.3,)),na.rm = TRUE)

#Q3
grep("^United",d22$X.2)

#Q4
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv','education.csv')
d4=read.csv('education.csv')
d44=merge(d22,d4,by.x='X',by.y = 'CountryCode')
dim(d44[grepl('Fiscal year end: June 30',d44$Special.Notes),])[1]

#Q5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
library(lubridate)
sum(year(sampleTimes)==2012)
sum(year(sampleTimes)==2012 & weekdays(sampleTimes)=='Monday')
