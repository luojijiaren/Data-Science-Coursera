#Q4
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode
## Count characters in each lines
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

#Q5
d=read.fwf('getdata%2Fwksst8110.for',width=c(12, 7,4, 9,4, 9,4, 9,4), skip = 4)
head(d)
sum(d[4])
