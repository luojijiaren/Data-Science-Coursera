setwd('C:\\Users\\fzhan\\Documents\\GitHub\\Data Science Coursera\\data cleaning\\class 3')

#Q1.
if (!file.exists('housing.csv')){download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv','housing.csv')}
data=read.csv('housing.csv')
agricultureLogical<-(data$ACR==3) & (data$AGS==6)
q1 <- data[which(agricultureLogical),]
head(q1)


#Q2
library(jpeg)
d2 <- readJPEG('getdata%2Fjeff.jpg',native = TRUE) #can just read system file, so download firstly!
quantile(d2,probs = 0.3)
quantile(d2,probs = 0.8)

#Q3
if (!file.exists('gdp.csv')){download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv','gdp.csv')}
if (!file.exists('education.csv')){download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv','education.csv')}
g=read.csv('gdp.csv',na.strings='')
g=g[5:194,]
e=read.csv('education.csv',na.strings='')
m=merge(g,e,by.x = 'X',by.y = 'CountryCode',all=FALSE)
m$Gross.domestic.product.2012=as.numeric(as.character(m$Gross.domestic.product.2012))
m_ordered=m[order(m$Gross.domestic.product.2012,decreasing = TRUE),]
m_ordered[13,4]

#Q4
library(dplyr)
m%>%
  group_by(Income.Group)%>%
  summarize(mean(Gross.domestic.product.2012)) %>%
  print

#Q5
library(Hmisc)
m$group<-cut2(m$Gross.domestic.product.2012,g=5)
table(m$Income.Group,m$group)

