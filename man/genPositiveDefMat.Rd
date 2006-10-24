\name{genPositiveDefMat}
\alias{genPositiveDefMat}
\title{GENERATE A POSITIVE DEFINITE MATRIX/COVARIANCE MATRIX}
\description{
Generate a positive definite matrix/covariance matrix.
}
\usage{
genPositiveDefMat(dim, covMethod=c("eigen", "unifcorrmat"), 
                  rangeVar=c(1,10), lambdaLow=1, ratioLambda=10)
}
\arguments{
  \item{dim}{
Dimension of the matrix to be generated.
  }
  \item{covMethod}{
Method to generate positive definite matrices/covariance matrices.
Choices are \dQuote{eigen} or \dQuote{unifcorrmat}; see details below. 
  }
  \item{rangeVar}{
Range for variances of a covariance matrix (see details).
The default range is \eqn{[1, 10]} which can generate reasonable
variability of variances.
  }
  \item{lambdaLow}{
Lower bound on the eigenvalues of cluster covariance matrices. 
If the argument \code{covMethod="eigen"}, eigenvalues are generated for cluster covariance matrices.
The eigenvalues are randomly generated from the
interval [\code{lambdaLow}, \code{lambdaLow}\eqn{*}\code{ratioLambda}]. 
In our experience, \code{lambdaLow}\eqn{=1} and \code{ratioLambda}\eqn{=10} 
can give reasonable variability of the diameters of clusters.
     \code{lambdaLow} should be positive.
  }
  \item{ratioLambda}{
The ratio of the upper bound of the eigenvalues to the lower bound of the 
eigenvalues of cluster covariance matrices.  See \code{lambdaLow}.
  }
}
\details{
The current version of the function \code{genPositiveDefMat} implements two 
methods to generate random covariance matrices. The first method, denoted by 
\dQuote{eigen}, first randomly generates eigenvalues 
(\eqn{\lambda_1,\ldots,\lambda_p}) for the covariance matrix 
(\eqn{\boldsymbol{\Sigma}}), then
uses columns of a randomly generated orthogonal matrix 
(\eqn{\boldsymbol{Q}=(\boldsymbol{\alpha}_1,\ldots,\boldsymbol{\alpha}_p)}) 
as eigenvectors. The covariance matrix \eqn{\boldsymbol{\Sigma}} is then 
contructed as 
\eqn{\boldsymbol{Q}*diag(\lambda_1,\ldots,\lambda_p)*\boldsymbol{Q}^T}.
The second method, denoted as \dQuote{unifcorrmat}, first generates a random 
correlation matrix (\eqn{\boldsymbol{R}}) via the method proposed in Joe (2006),
then randomly generates variances (\eqn{\sigma_1^2,\ldots,\sigma_p^2}) from 
an interval specified by the argument \code{rangeVar}. The covariance matrix 
\eqn{\boldsymbol{\Sigma}} is then constructed as 
\eqn{diag(\sigma_1,\ldots,\sigma_p)*\boldsymbol{R}*diag(\sigma_1,\ldots,\sigma_p)}.
}
\value{
\item{egvalues}{
  eigenvalues of Sigma
}
\item{Sigma}{
positive definite matrix/covariance matrix
}
}
\references{
  Joe, H. (2006)
  Generating Random Correlation Matrices Based on Partial Correlations. 
  \emph{Journal of Multivariate Analysis}, \bold{97}, 2177--2189.
}
\author{
Weiliang Qiu \email{stwxq@channing.harvard.edu}\cr
Harry Joe \email{harry@stat.ubc.ca}
}
\examples{
genPositiveDefMat("unifcorrmat",dim=4)
genPositiveDefMat("eigen",dim=5)
}
\keyword{cluster}

