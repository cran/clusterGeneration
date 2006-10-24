\name{sepIndex}
\alias{sepIndex}
\alias{sepIndexTheory}
\alias{sepIndexData}
\title{MEASURE THE MAGNITUDE OF THE GAP OR SPARSE AREA BETWEEN A PAIR OF CLUSTERS ALONG THE SPECIFIED PROJECTION DIRECTION}
\description{
Measure the magnitude of the gap or sparse area between a pair of clusters
(or cluster distributions) along the specified projection direction.
}
\usage{
sepIndexTheory(projDir, mu1, Sigma1, mu2, Sigma2, 
                         alpha=0.05, eps=1.0e-10, quiet=TRUE)

sepIndexData(projDir, y1, y2, alpha=0.05, eps=1.0e-10, quiet=TRUE)
}
\arguments{
  \item{projDir}{
Projection direction.
  }
  \item{mu1}{
Mean vector of cluster 1.
  }
  \item{Sigma1}{
Covariance matrix of cluster 1.
  }
  \item{mu2}{
Mean vector of cluster 2.
  }
  \item{Sigma2}{
Covariance matrix of cluster 2.
  }
  \item{y1}{
Data matrix of cluster 1. Rows correspond to observations. Columns correspond 
to variables.
  }
  \item{y2}{
Data matrix of cluster 2. Rows correspond to observations. Columns correspond 
to variables.
  }
  \item{alpha}{
Tuning parameter reflecting the percentage in the two
tails of a projected cluster that might be outlying.
We set \code{alpha}\eqn{=0.05} like we set
the significance level in hypothesis testing as \eqn{0.05}.
  }
  \item{eps}{
Convergence threshold. A small positive number to check if a quantitiy \eqn{q} 
is equal to zero.  If \eqn{|q|<}\code{eps}, then we regard \eqn{q} is equal 
to zero.  \code{eps} is used to check if an algorithm converges.
The default value is \eqn{1.0e-10}.
  }
  \item{quiet}{
A flag to switch on/off the outputs of intermediate results and/or possible warning messages. The default value is \code{TRUE}.
  }
}
\value{
The value of the separation index defined in Qiu and Joe (2006). 
}
\references{
  Qiu, W.-L. and Joe, H. (2006)
  Separation Index and Partial Membership for Clustering.
  \emph{Computational Statistics and Data Analysis}, \bold{50}, 585--603.
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
sepIndexTheory(projDir, mu1, Sigma1, mu2, Sigma2)

library(MASS)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
sepIndexData(projDir, y1, y2)

}
\keyword{cluster}

