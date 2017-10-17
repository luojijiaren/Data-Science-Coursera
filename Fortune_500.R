getwd()
setwd('C:/Users/fzhan/Desktop/R and data science')
fin=read.csv('Future-500.csv',na.strings = '')
head(fin)
str(fin)
summary(fin)

#changeing from non-factor to factor
fin$ID=factor(fin$ID)
fin$Inception=factor(fin$Inception)

str(fin)

#factor variable tranp(FVT)

Z=factor(c('12','13','14','12','12'))

x=as.numeric(as.character(Z))

fin$Expenses=gsub(' Dollars','',fin$Expenses)
fin$Expenses=as.numeric(gsub(',','',fin$Expenses))
str(fin)
head(fin)

fin$Revenue=gsub('\\$','',fin$Revenue)
fin$Revenue=as.numeric(gsub(',','',fin$Revenue))

fin$Growth=as.numeric(gsub('%','',fin$Growth))
str(fin)

head(fin,24)
fin[!complete.cases(fin),]

#removing records with missing data


