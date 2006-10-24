library(clusterGeneration)
#
# check functions for separation index of clusters
# and for projection directions to separate clusters

cat("Theoretical based on multivariate distributions\n")
n1<-50
mu1<-c(0,0)
Sigma1<-matrix(c(2,1,1,5),2,2)
n2<-100
mu2<-c(10,0)
Sigma2<-matrix(c(5,-1,-1,2),2,2)
projDir<-c(1, 0)

indx1<-sepIndexTheory(projDir, mu1, Sigma1, mu2, Sigma2)
print(indx1)

muMat<-rbind(mu1, mu2)
SigmaArray<-array(0, c(2,2,2))
SigmaArray[,,1]<-Sigma1
SigmaArray[,,2]<-Sigma2
a<-getSepProjTheory(muMat, SigmaArray, iniProjDirMethod="SL", projDirMethod="newton")
# separation index for clusters 1 and 2
print(a$sepValMat[1,2])
# projection direction for clusters 1 and 2
print(a$projDirArray[1,2,])

cat("\nData versions based on simulated data\n")
set.seed(12345)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
indx2<-sepIndexData(projDir, y1, y2)
print(indx2)

y<-rbind(y1, y2)
cl<-rep(1:2, c(n1, n2))

cat("iniProjDirMethod=SL\n")
b<-getSepProjData(y, cl, iniProjDirMethod="SL", projDirMethod="newton")
# separation index for clusters 1 and 2
print(b$sepValMat[1,2])
# projection direction for clusters 1 and 2
print(b$projDirArray[1,2,])

cat("iniProjDirMethod=naive, projDirMethod=fixedpoint\n")
b<-getSepProjData(y, cl, iniProjDirMethod="naive", projDirMethod="fixedpoint")
# separation index for clusters 1 and 2
print(b$sepValMat[1,2])
# projection direction for clusters 1 and 2
print(b$projDirArray[1,2,])

cat("iniProjDirMethod=naive, projDirMethod=newton\n")
b<-getSepProjData(y, cl, iniProjDirMethod="naive", projDirMethod="newton")
# separation index for clusters 1 and 2
print(b$sepValMat[1,2])
# projection direction for clusters 1 and 2
print(b$projDirArray[1,2,])

###################

cat("\nNearest neighbor summary, theoretical version\n")
n1<-50
mu1<-c(0,0)
Sigma1<-matrix(c(2,1,1,5),2,2)
n2<-100
mu2<-c(10,0)
Sigma2<-matrix(c(5,-1,-1,2),2,2)
n3<-30
mu3<-c(10,10)
Sigma3<-matrix(c(3,1.5,1.5,1),2,2)

projDir<-c(1, 0)
muMat<-rbind(mu1, mu2, mu3)
SigmaArray<-array(0, c(2,2,3))
SigmaArray[,,1]<-Sigma1
SigmaArray[,,2]<-Sigma2
SigmaArray[,,3]<-Sigma3

tmp<-getSepProjTheory(muMat, SigmaArray, iniProjDirMethod="SL")
sepValMat<-tmp$sepValMat
out=nearestNeighborSepVal(sepValMat)
print(out)

#####################

cat("\nProjections\n")
set.seed(12345)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
y3<-mvrnorm(n3, mu3, Sigma3)
y<-rbind(y1, y2, y3)
cl<-rep(1:3, c(n1, n2, n3))

postscript("proj.ps")
par(mfrow=c(2,1))
viewClusters(y, cl)
viewClusters(y, cl,projMethod="DMS")

n1<-50
mu1<-c(0,0)
Sigma1<-matrix(c(2,1,1,5),2,2)
n2<-100
mu2<-c(10,0)
Sigma2<-matrix(c(5,-1,-1,2),2,2)
projDir<-c(1, 0)

#library(MASS)
set.seed(12345)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
y<-rbind(y1, y2)
cl<-rep(1:2, c(n1, n2))

b<-getSepProjData(y, cl, iniProjDirMethod="SL", projDirMethod="newton")
# projection direction for clusters 1 and 2
projDir<-b$projDirArray[1,2,]

par(mfrow=c(2,1))
plot1DProjection(y1, y2, projDir)
#plot1DProjection(y1, y2[,1:2], projDir)
plot2DProjection(y1, y2, projDir)
graphics.off()

