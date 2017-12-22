
library(XML)
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(sub("s", "", fileURL), useInternal = TRUE)
root<-xmlRoot(doc)
r=0
for(i in 1:1327) {num <- xpathSApply(root[[1]][[i]],'zipcode',xmlValue)
if(num=='21231'){r=r+1}
}
r
