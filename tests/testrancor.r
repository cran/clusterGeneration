library(clusterGeneration)
# check of algorithm for random correlation matrix 
# beta parameter depending on  |i-j|
# check marginal distributions against beta qq plots

set.seed(123)

print(rcorrmatrix(3))
print(rcorrmatrix(4))
print(rcorrmatrix(5))
#tem=c(rcor(3))
#print(tem)

# qq plot against beta(alp,alp) distribution
qqbeta=function(x,alp)
{ xs=sort(x)
  n=length(x)
  pp=(1:n)/(n+1)
  qq=qbeta(pp,alp,alp)
  plot(qq,xs,ylab="corr",xlab="beta quantile")
  title(paste("Beta quantile plot with a=b=",alp))
  0
}

postscript("corplots.ps",horiz=F)
# tests for d=3,4,5: uncomment appropriate lines
nsim=500
set.seed(1234)
d=3
out=matrix(0,nsim,d^2)
for(i in 1:nsim)
{ out[i,]=c(rcorrmatrix(d,1)) }
#d=3, OK
par(mfrow=c(2,1))
qqbeta(out[,2],1.5)
qqbeta(out[,3],1.5)
out=matrix(0,nsim,d^2)
for(i in 1:nsim)
{ out[i,]=c(rcorrmatrix(d,2)) }
qqbeta(out[,2],2.5)
qqbeta(out[,3],2.5)

set.seed(1234)
d=4
out=matrix(0,nsim,d^2)
for(i in 1:nsim)
{ out[i,]=c(rcorrmatrix(d,1)) }
#d=4, OK
par(mfrow=c(3,2))
qqbeta(out[,2],2)
qqbeta(out[,3],2)
qqbeta(out[,4],2)
qqbeta(out[,7],2)
qqbeta(out[,8],2)
qqbeta(out[,12],2)

set.seed(1234)
d=5
out=matrix(0,nsim,d^2)
for(i in 1:nsim)
{ out[i,]=c(rcorrmatrix(d,1)) }
#d=5, OK
par(mfrow=c(3,3))
qqbeta(out[,2],2.5)
qqbeta(out[,3],2.5)
qqbeta(out[,4],2.5)
qqbeta(out[,5],2.5)
qqbeta(out[,8],2.5)
qqbeta(out[,9],2.5)
qqbeta(out[,10],2.5)
qqbeta(out[,14],2.5)
qqbeta(out[,15],2.5)

graphics.off()
