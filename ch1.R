mydata=read.csv(file.choose())
install.packages('ggplot2')
library(ggplot2)
ggplot(data=mydata,aes(x=carat,y=price,colour=clarity))+geom_point()
X=2
typeof(X)
Y=2L
typeof(Y)

