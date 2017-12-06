make.NegLogLik<- function (data,fixed=c(FALSE,FALSE))
{
  params <- fixed
  function(p) {
    params[!fixed]<-p
    mu<-params[1]
    sigma <- params [2]
    a<- -0.5 * length(data)*log(2*pi*sigma*2)
    b <- -0.5 *sum((data-mu)^2)/(sigma^2)
    -(a+b)
  }
}


set.seed(1)
normals <- rnorm(100,1,2)
nll <- make.NegLogLik(normals)
optim (c(mu=0,sigma=1),nll)$par

nll <- make.NegLogLik(normals, c(1,FALSE))
x<-seq(1.7,1.9,len=100)
y <- sapply(x,nll)
plot(x,exp(-(y-min(y))),type='l')