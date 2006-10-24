library(clusterGeneration)
#
# check error messages for functions for separation index and projection

n1<-50
mu1<-c(0,0)
Sigma1<-matrix(c(2,1,1,5),2,2)
n2<-100
mu2<-c(3,0)
Sigma2<-matrix(c(5,-1,-1,2),2,2)
projDir<-c(1, 0)
set.seed(12345)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
y<-rbind(y1, y2)
cl<-rep(1:2, c(n1, n2))

# check what if projDir%*%(mu2-mu1)<0
try( sepIndexTheory(-projDir, mu1, Sigma1, mu2, Sigma2) )

# check what if projDir=0
try( sepIndexTheory(projDir*0, mu1, Sigma1, mu2, Sigma2) )

# check what if Sigma1=Sigma2=0
try( sepIndexTheory(projDir, mu1, 0*Sigma1, mu2, 0*Sigma2) )

# check what if mu1=mu2 and Sigma1=Sigma2=0
try( sepIndexTheory(projDir, mu1, 0*Sigma1, mu1, 0*Sigma2) )

# check what if Sigma1 and Sigma2 are singular
S1<-matrix(c(2,0,0,0),2,2)
S2<-matrix(c(0,0,0,1),2,2)
try( sepIndexTheory(projDir, mu1, S1, mu1, S2) )

# check if y1 is a vector or matrix
try( sepIndexData(projDir, list(a=1, b=2), y2) )

###################

# check if 'alpha' is in (0, 0.5)
try( getSepProjData(y, cl, alpha=0) )

# what if alpha=0.5, this is OK
try( getSepProjData(y, cl, alpha=0.5) )

# check if 0<eps<=0.01
try( getSepProjData(y, cl, eps=0) )
try( getSepProjData(y, cl, eps=0.1) )
try( getSepProjData(y, cl, eps=0.01) ) # this is OK 

# check if ITMAX<=0
try( getSepProjData(y, cl, ITMAX=0) )

#  check if is.logical(quiet) is TRUE
try( getSepProjData(y, cl, quiet=3) )


###################

# error messages for non-square matrix
try( nearestNeighborSepVal(c(1,0)) )
try( nearestNeighborSepVal(matrix(c(1,0),2,1)) )



