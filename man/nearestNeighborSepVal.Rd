\name{nearestNeighborSepVal}
\alias{nearestNeighborSepVal}
\title{SEPARATON INFORMATION MATRIX}
\description{
Separation information matrix containing the nearest neighbor and farthest neighbor of each cluster. 
}
\usage{
  nearestNeighborSepVal(sepValMat)
}
\arguments{
  \item{sepValMat}{
a \code{K} by \code{K} matrix, where \code{K} is the number of clusters. 
\code{sepValMat[i,j]} is the separation index between cluster \code{i} and 
\code{j}.
  }
}
\value{
This function returns a separation information matrix containing \code{K} rows and 
the following six columns, where \code{K} is the number of clusters.

  \item{Column 1:}{
Labels of clusters (\eqn{1, 2, \ldots, numClust}), where \eqn{numClust} is 
the number of clusters for the data set.
  }
  \item{Column 2:}{
Labels of the corresponding nearest neighbors.
  }
  \item{Column 3:}{
Separation indices of the clusters to their nearest neighboring clusters.
  }
  \item{Column 4:}{
Labels of the corresponding farthest neighboring clusters.
  }
  \item{Column 5:}{
Separation indices of the clusters to their farthest neighbors.
  }
  \item{Column 6:}{
Median separation indices of the clusters to their neighbors.
  }
}
\references{
  Qiu, W.-L. and Joe, H. (2006a)
  Generation of Random Clusters with Specified Degree of Separaion.
  \emph{Journal of Classification}, \bold{23}(2), 315-334.

  Qiu, W.-L. and Joe, H. (2006b)
  Separation Index and Partial Membership for Clustering.
  \emph{Computational Statistics and Data Analysis}, \bold{50}, 585--603.
}
\author{
Weiliang Qiu \email{weiliang.qiu@gmail.com}\cr
Harry Joe \email{harry@stat.ubc.ca}
}
\examples{
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
nearestNeighborSepVal(sepValMat)
}
\keyword{cluster}

