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
backup.fin = fin
fin=fin[!is.na(fin$Industry),]

rownames(fin)=1:nrow(fin)
fin[is.na(fin$State)&fin$City=='New York','State']='NY'
fin[is.na(fin$State)&fin$City=='San Francisco','State']='CA'

fin[!complete.cases(fin),]
fin[which(fin$Name=='Greenfax'),'Employees']=median(fin[fin$Industry=='Retail','Employees'],na.rm=TRUE)
fin[which(fin$Name=='Westminster'),'Employees']=median(fin[fin$Industry=='Financial Services','Employees'],na.rm=TRUE)

fin[is.na(fin$Growth) & fin$Industry=='Construction','Growth']=median(fin[fin$Industry=='Construction','Growth'],na.rm=TRUE)
fin[is.na(fin$Expenses) & fin$Industry=='Construction','Expenses']=median(fin[fin$Industry=='Construction','Expenses'],na.rm=TRUE)
fin[is.na(fin$Revenue) & fin$Industry=='Construction','Revenue']=median(fin[fin$Industry=='Construction','Revenue'],na.rm=TRUE)

fin[is.na(fin$Profit),'Profit']=fin[is.na(fin$Profit),'Revenue']-fin[is.na(fin$Profit),'Expenses']
fin[is.na(fin$Expenses),'Expenses']=fin[is.na(fin$Expenses),'Revenue']-fin[is.na(fin$Expenses),'Profit']
