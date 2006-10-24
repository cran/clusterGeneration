\name{viewClusters}
\alias{viewClusters}
\title{PLOT ALL CLUSTERS IN A 2-D PROJECTION SPACE}
\description{
Plot all clusters in a 2-D projection space. 
}
\usage{
viewClusters(y, cl, outlierLabel=0,
  projMethod="Eigen", xlim=NULL, ylim=NULL,
  xlab="1st projection direction", 
  ylab="2nd projection direction", 
  title="Scatter plot of 2-D Projected Clusters",
  font=2, font.lab=2, cex=1.2, cex.lab=1.2) 
}
\arguments{
  \item{y}{
Data matrix. Rows correspond to observations. Columns correspond to variables.
  }
  \item{cl}{
Cluster membership vector.
  }
  \item{outlierLabel}{
  Label for outliers. Outliers are not involved in calculating the projection
  directions. Outliers will be represented by red triangles in the plot.
  By default, \code{outlierLabel=0}.
  }
  \item{projMethod}{
Method to construct 2-D projection directions. 
\code{projMethod="Eigen"} indicates that we project data to the 
2-dimensional space spanned by the first two eigenvectors of the 
between cluster distance matrix 
\eqn{B={2\over k_0}\sum_{i=1}^{k_0}\Sigma_i+{2\over
k_0(k_0-1)}\sum_{i<j}(\theta_i-\theta_j) (\theta_i-\theta_j)^T}.
\code{projMethod="DMS"} indicates that we project data to the 
2-dimensional space spanned by the first two eigenvectors of the 
between cluster distance matrix 
\eqn{B=\sum_{i=2}^{k_0}\sum_{j=1}^{i-1}
n_i n_j(\theta_i-\theta_j)(\theta_i-\theta_j)^T}. 
\dQuote{DMS} method is proposed by Dhillon et al. (2002).
  }
  \item{xlim}{
Range of X axis.
  }
  \item{ylim}{
Range of Y axis.
  }
  \item{xlab}{
X axis label.
  }
  \item{ylab}{
Y axis label.
  }
  \item{title}{
Title of the plot.
  }
  \item{font}{
An integer which specifies which font to use for text (see \code{par}).
  }
  \item{font.lab}{
The font to be used for x and y labels (see \code{par}).
  }
  \item{cex}{
A numerical value giving the amount by which plotting text
and symbols should be scaled relative to the default (see \code{par}).
  }
  \item{cex.lab}{
The magnification to be used for x and y labels relative
to the current setting of 'cex' (see \code{par}).
  }
}
\value{
  \item{B}{
    Between cluster distance matrix measuring the between cluster variation.
  }
  \item{Q}{
    Columns of \code{Q} are eigenvectors of the matrix \code{B}.
  }
  \item{proj}{
    Projected clusters in the 2-D space spanned by the first 2 columns of
the matrix \code{Q}.
  }
}
\references{
  Dhillon I. S., Modha, D. S. and Spangler, W. S. (2002)
  Class visualization of high-dimensional data with applications.
  \emph{computational Statistics and Data Analysis}, \bold{41}, 59--90.

  Qiu, W.-L. and Joe, H. (2006)
  Separation Index and Partial Membership for Clustering.
  \emph{Computational Statistics and Data Analysis}, \bold{50}, 585--603.
}
\author{
Weiliang Qiu \email{stwxq@channing.harvard.edu}\cr
Harry Joe \email{harry@stat.ubc.ca}
}
\seealso{
  \code{\link{plot1DProjection}}
  \code{\link{plot2DProjection}}
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
n4<-10
mu4<-c(0,0)
Sigma4<-50*diag(2)

library(MASS)
set.seed(1234)
y1<-mvrnorm(n1, mu1, Sigma1)
y2<-mvrnorm(n2, mu2, Sigma2)
y3<-mvrnorm(n3, mu3, Sigma3)
y4<-mvrnorm(n4, mu4, Sigma4)
y<-rbind(y1, y2, y3, y4)
cl<-rep(c(1:3, 0), c(n1, n2, n3, n4))

par(mfrow=c(2,1))
viewClusters(y, cl)
viewClusters(y, cl,projMethod="DMS")

}
\keyword{cluster}

