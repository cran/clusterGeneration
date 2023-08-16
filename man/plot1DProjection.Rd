\name{plot1DProjection}
\alias{plot1DProjection}
\title{PLOT A PAIR OF CLUSTERS AND THEIR DENSITY ESTIMATES, WHICH ARE PROJECTED  ALONG A SPECIFIED 1-D PROJECTION DIRECTION}
\description{
Plot a pair of clusters and their density estimates, which are projected along a specified 1-D projection direction. 
}
\usage{
plot1DProjection(
		 y1, 
		 y2, 
		 projDir, 
                 sepValMethod = c("normal", "quantile"), 
		 bw = "nrd0", 
                 xlim = NULL, 
		 ylim = NULL, 
                 xlab = "1-D projected clusters", 
		 ylab = "density estimates", 
                 title = "1-D Projected Clusters and their density estimates",
                 font = 2, 
		 font.lab = 2, 
		 cex = 1.2, 
		 cex.lab = 1.2, 
		 cex.main = 1.5,
                 lwd = 4, 
		 lty1 = 1, 
		 lty2 = 2, 
		 pch1 = 18, 
		 pch2 = 19, 
		 col1 = 2, 
		 col2 = 4, 
                 type = "l", 
		 alpha = 0.05, 
		 eps = 1.0e-10, 
		 quiet = TRUE)
}
\arguments{
  \item{y1}{
Data matrix of cluster 1. Rows correspond to observations. Columns correspond to variables.
  }
  \item{y2}{
Data matrix of cluster 2. Rows correspond to observations. Columns correspond to variables.
  }
  \item{projDir}{
1-D projection direction along which two clusters will be projected.
  }
  \item{sepValMethod}{
Method to calculate separation index for a pair of clusters projected onto a 
1-D space. \code{sepValMethod="quantile"} indicates the quantile version of
separation index will be used: \eqn{sepVal=(L_2-U_1)/(U_2-L_1)} where \eqn{L_i} and 
\eqn{U_i}, \eqn{i=1, 2}, are the lower and upper \code{alpha/2} sample percentiles 
of projected cluster \eqn{i}. \code{sepValMethod="normal"} indicates the 
normal version of separation index will be used: 
\eqn{sepVal=[(xbar_2-xbar_1)-z_{\alpha/2}(s_1+s_2)]/
[(xbar_2-xbar_1)+z_{\alpha/2}(s_1+s_2)]}, 
where \eqn{xbar_i} and \eqn{s_i} are the sample mean and standard deviation 
of projected cluster \eqn{i}.
  }
  \item{bw}{
The smoothing bandwidth to be used by the function \code{density}.
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
  \item{cex.main}{
The magnification to be used for main titles relative
to the current setting of 'cex' (see \code{par}).
  }
  \item{lwd}{
The line width, a positive number, defaulting to '1' (see \code{par}).
  }
  \item{lty1}{
  Line type for cluster 1 (see \code{par}).
  }
  \item{lty2}{
  Line type for cluster 2 (see \code{par}).
  }
  \item{pch1}{
Either an integer specifying a symbol or a single character
to be used as the default in plotting points for cluster 1 (see \code{points}).
  }
  \item{pch2}{
Either an integer specifying a symbol or a single character
to be used as the default in plotting points for cluster 2 (see \code{points}).
  }
  \item{col1}{
Color to indicates cluster 1.
  }
  \item{col2}{
Color to indicates cluster 2.
  }
  \item{type}{
What type of plot should be drawn (see \code{plot}).
  }
  \item{alpha}{
Tuning parameter reflecting the percentage in the two
tails of a projected cluster that might be outlying.
  }
  \item{eps}{
A small positive number to check if a quantitiy \eqn{q} is equal to zero.  
If \eqn{|q|<}\code{eps}, then we regard \eqn{q} as equal to zero.  
\code{eps} is used to check the denominator in the formula of the separation 
index is equal to zero. Zero-value denominator indicates two clusters are 
totally overlapped. Hence the separation index is set to be \eqn{-1}.
The default value of \code{eps} is \eqn{1.0e-10}.
  }
  \item{quiet}{
A flag to switch on/off the outputs of intermediate results and/or possible warning messages. The default value is \code{TRUE}.
  }
}
\details{
The ticks along X axis indicates the positions of points of the projected 
two clusters. The positions of \eqn{L_i} and \eqn{U_i}, \eqn{i=1, 2}, are also indicated 
on X axis, where \eqn{L_i} and \eqn{U_i} are the lower and upper \eqn{\alpha/2} sample 
percentiles of cluster \eqn{i} if \code{sepValMethod="quantile"}. 
If \code{sepValMethod="normal"},
\eqn{L_i=xbar_i-z_{\alpha/2}s_i}, where \eqn{xbar_i} and \eqn{s_i} are the 
sample mean and standard deviation of cluster \eqn{i}, and \eqn{z_{\alpha/2}} 
is the upper \eqn{\alpha/2} percentile of standard normal distribution.
}
\value{
  \item{sepVal}{
    value of the separation index for the projected two clusters along
    the projection direction \code{projDir}.
  }
  \item{projDir}{
    projection direction. To make sure the projected cluster 1 is on the 
    left-hand side of the projected cluster 2, the input \code{projDir}
    might be changed to \code{-projDir}.
  }
}
\references{
  Qiu, W.-L. and Joe, H. (2006)
  Separation Index and Partial Membership for Clustering.
  \emph{Computational Statistics and Data Analysis}, \bold{50}, 585--603.
}
\author{
Weiliang Qiu \email{weiliang.qiu@gmail.com}\cr
Harry Joe \email{harry@stat.ubc.ca}
}
\seealso{
  \code{\link{plot2DProjection}}
  \code{\link{viewClusters}}
}
\examples{
n1 <- 50
mu1 <- c(0,0)
Sigma1 <- matrix(c(2, 1, 1, 5), 2, 2)
n2 <- 100
mu2 <- c(10, 0)
Sigma2 <- matrix(c(5, -1, -1, 2), 2, 2)
projDir <- c(1,  0)

library(MASS)
set.seed(1234)
y1 <- mvrnorm(n1, mu1, Sigma1)
y2 <- mvrnorm(n2, mu2, Sigma2)
y <- rbind(y1, y2)
cl <- rep(1:2, c(n1, n2))

b <- getSepProjData(
		    y = y, 
		    cl = cl, 
		    iniProjDirMethod = "SL", 
		    projDirMethod = "newton")
# projection direction for clusters 1 and 2
projDir <- b$projDirArray[1, 2, ]

plot1DProjection(
		 y1 = y1, 
		 y2 = y2, 
		 projDir = projDir)

}
\keyword{cluster}

