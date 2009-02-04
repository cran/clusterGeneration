\name{getSepProj}
\alias{getSepProj}
\alias{getSepProjTheory}
\alias{getSepProjData}
\title{OPTIMAL PROJECTION DIRECTION AND CORRESPONDING SEPARATION INDEX FOR PAIRS OF CLUSTERS}
\description{
Optimal projection direction and corresponding separation index for pairs of clusters.
}
\usage{
getSepProjTheory(muMat, SigmaArray, 
     iniProjDirMethod=c("SL", "naive"), 
     projDirMethod=c("newton", "fixedpoint"), 
     alpha=0.05, ITMAX=20, eps=1.0e-10, quiet=TRUE)

getSepProjData(y, cl, 
     iniProjDirMethod=c("SL", "naive"), 
     projDirMethod=c("newton", "fixedpoint"), 
     alpha=0.05, ITMAX=20, eps=1.0e-10, quiet=TRUE)
}
\arguments{
  \item{muMat}{
Matrix of mean vectors. Rows correspond to mean vectors for clusters.
  }
  \item{SigmaArray}{
Array of covariance matrices. \code{SigmaArray[,,i]} record the covariance 
matrix of the \code{i}-th cluster.
  }
  \item{y}{
Data matrix. Rows correspond to observations. Columns correspond to variables.
  }
  \item{cl}{
Cluster membership vector.
  }
  \item{iniProjDirMethod}{
Indicating the method to get initial projection direction when calculating
the separation index between a pair of clusters (c.f. Qiu and Joe,
2006a, 2006b). \cr
     \code{iniProjDirMethod}=\dQuote{SL} indicates the initial projection 
direction is the sample version of the SL's projection direction 
(Su and Liu, 1993)
\eqn{\left(\boldsymbol{\Sigma}_1+\boldsymbol{\Sigma}_2\right)^{-1}\left(\boldsymbol{\mu}_2-\boldsymbol{\mu}_1\right)}\cr
     \code{iniProjDirMethod}=\dQuote{naive} indicates the initial projection 
direction is \eqn{\boldsymbol{\mu}_2-\boldsymbol{\mu}_1}
  }
  \item{projDirMethod}{
Indicating the method to get the optimal projection direction when calculating 
the separation index between a pair of clusters (c.f. Qiu and Joe,
2006a, 2006b). \cr
     \code{projDirMethod}=\dQuote{newton} indicates we use the Newton-Raphson 
method to search the optimal projection direction (c.f. Qiu and Joe, 2006a). 
This requires the assumptions that both covariance matrices of the pair of 
clusters are positive-definite. If this assumption is violated, the 
\dQuote{fixedpoint} method could be used. The \dQuote{fixedpoint} method 
iteratively searches the optimal projection direction based on the first 
derivative of the separation index to the project direction 
(c.f. Qiu and Joe, 2006b).
  }
  \item{alpha}{
Tuning parameter reflecting the percentage in the two
tails of a projected cluster that might be outlying.
We set \code{alpha}\eqn{=0.05} like we set
the significance level in hypothesis testing as \eqn{0.05}.
  }
  \item{ITMAX}{
Maximum iteration allowed when to iteratively calculate the
optimal projection direction.
The actual number of iterations is usually much less than the default value 20.
  }
  \item{eps}{
Convergence threshold. A small positive number to check if a quantitiy 
\eqn{q} is equal to zero.  If \eqn{|q|<}\code{eps}, then we regard \eqn{q} 
as equal to zero.  \code{eps} is used to check if an algorithm converges.
The default value is \eqn{1.0e-10}.
  }
  \item{quiet}{
A flag to switch on/off the outputs of intermediate results and/or possible warning messages. The default value is \code{TRUE}.
  }
}
\details{
When calculating the optimal projection direction and corresponding optimal 
separation index for a pair of cluster, if one or both cluster covariance 
matrices is/are singular, the \sQuote{newton} method can not be used. 
In this case, the functions \code{getSepProjTheory} and \code{getSepProjData} 
will automatically use the \sQuote{fixedpoint} method to search the optimal 
projection direction, even if the user specifies the value of the argument 
\code{projDirMethod} as \sQuote{newton}. Also, multiple initial projection 
directions will be evaluated. 

Specifically, \eqn{2+2p} projection directions will be evaluated. The first 
projection direction is the \dQuote{naive} direction 
\eqn{\boldsymbol{\mu}_2-\boldsymbol{\mu}_1}. 
The second projection direction is the \dQuote{SL} projection direction  
\eqn{\left(\boldsymbol{\Sigma}_1+\boldsymbol{\Sigma}_2\right)^{-1}
\left(\boldsymbol{\mu}_2-\boldsymbol{\mu}_1\right)}.
The next \eqn{p} projection directions are the \eqn{p} eigenvectors of the covariance 
matrix of the first cluster. The remaining \eqn{p} projection directions are 
the \eqn{p} eigenvectors of the covariance matrix of the second cluster. 

Each of these \eqn{2+2*p} projection directions are in turn used as the initial 
projection direction for the \sQuote{fixedpoint} algorithm to obtain the 
optimal projection direction and the corresponding optimal separation index. 
We also obtain \eqn{2+2*p} separation indices by projecting two clusters along each of these \eqn{2+2*p} projection directions.

Finally, the projection direction with the largest separation index among the 
\eqn{2*(2+2*p)} optimal separation indices is chosen as the optimal projection 
direction. The corresponding separation index is chosen as the optimal 
separation index.
}
\value{
  \item{sepValMat}{
Separation index matrix
  }
  \item{projDirArray}{
Array of projection directions for each pair of clusters
  }
}
\references{
  Qiu, W.-L. and Joe, H. (2006a)
  Generation of Random Clusters with Specified Degree of Separaion.
  \emph{Journal of Classification}, \bold{23}(2), 315-334.

  Qiu, W.-L. and Joe, H. (2006b)
  Separation Index and Partial Membership for Clustering.
  \emph{Computational Statistics and Data Analysis}, \bold{50}, 585--603.

  Su, J. Q. and Liu, J. S. (1993)
  Linear Combinations of Multiple Diagnostic Markers.
  \emph{Journal of the American Statistical Association}, \bold{88}, 1350--1355.
}
\author{
Weiliang Qiu \email{stwxq@channing.harvard.edu}\cr
Harry Joe \email{harry@stat.ubc.ca}
}
\examples{
n1<-50
mu1<-c(0,0)
Sigma1<-matrix(c(2,1,1,5),2,2)
n2<-100
mu2<-c(10,0)
Sigma2<-matrix(c(5,-1,-1,2),2,2)
projDir<-c(1, 0)
muMat<-rbind(mu1, mu2)
SigmaArray<-array(0, c(2,2,2))
SigmaArray[,,1]<-Sigma1
SigmaArray[,,2]<-Sigma2

a<-getSepProjTheory(muMat, SigmaArray, iniProjDirMethod="SL")
# separation index for cluster distributions 1 and 2
a$sepValMat[1,2]
# projection direction for cluster distributions 1 and 2
a$projDirArray[1,2,]

library(MASS)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
y<-rbind(y1, y2)
cl<-rep(1:2, c(n1, n2))

b<-getSepProjData(y, cl, iniProjDirMethod="SL", projDirMethod="newton")
# separation index for clusters 1 and 2
b$sepValMat[1,2]
# projection direction for clusters 1 and 2
b$projDirArray[1,2,]

}
\keyword{cluster}

