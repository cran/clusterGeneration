\name{genPositiveDefMat}
\alias{genPositiveDefMat}
\title{GENERATE A POSITIVE DEFINITE MATRIX/COVARIANCE MATRIX}
\description{
Generate a positive definite matrix/covariance matrix.
}
\usage{
genPositiveDefMat(
  dim, 
  covMethod = c("eigen", "onion", "c-vine", "unifcorrmat"), 
  eigenvalue = NULL,
  alphad = 1, 
  eta = 1, 
  rangeVar = c(1, 10), 
  lambdaLow = 1, 
  ratioLambda = 10)
}
\arguments{
  \item{dim}{
Dimension of the matrix to be generated.
  }
  \item{covMethod}{
Method to generate positive definite matrices/covariance matrices.
Choices are \dQuote{eigen}, \dQuote{onion}, \dQuote{c-vine}, or \dQuote{unifcorrmat}; see details below. 
  }
  \item{eigenvalue}{
numeric. user-specified eigenvalues when \code{covMethod = "eigen"}. If \code{eigenvalue = NULL} and \code{covMethod = "eigen"}, then eigenvalues will be automatically generated.  
  }
  \item{alphad}{parameter for unifcorrmat method to generate random correlation matrix
 \code{alphad=1} for uniform. \code{alphad} should be positive.}
  \item{eta}{parameter for \dQuote{c-vine} and \dQuote{onion} methods to generate random correlation matrix
 \code{eta=1} for uniform. \code{eta} should be positive.}
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
The current version of the function \code{genPositiveDefMat} implements four 
methods to generate random covariance matrices. The first method, denoted by 
\dQuote{eigen}, first randomly generates eigenvalues 
(\eqn{\lambda_1,\ldots,\lambda_p}) for the covariance matrix 
(\eqn{\boldsymbol{\Sigma}}), then
uses columns of a randomly generated orthogonal matrix 
(\eqn{\boldsymbol{Q}=(\boldsymbol{\alpha}_1,\ldots,\boldsymbol{\alpha}_p)}) 
as eigenvectors. The covariance matrix \eqn{\boldsymbol{\Sigma}} is then 
contructed as 
\eqn{\boldsymbol{Q}*diag(\lambda_1,\ldots,\lambda_p)*\boldsymbol{Q}^T}.

The remaining methods, denoted as \dQuote{onion}, \dQuote{c-vine}, and \dQuote{unifcorrmat}
respectively, first generates a random 
correlation matrix (\eqn{\boldsymbol{R}}) via the method mentioned and proposed in Joe (2006),
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

  Ghosh, S., Henderson, S. G. (2003). 
  Behavior of the NORTA method for correlated random vector generation 
  as the dimension increases.
  \emph{ACM Transactions on Modeling and Computer Simulation (TOMACS)},
  \bold{13(3)}, 276--294.

  Kurowicka and Cooke, 2006.
  \emph{Uncertainty Analysis with High Dimensional Dependence Modelling},
  Wiley, 2006.

}
\author{
Weiliang Qiu \email{weiliang.qiu@gmail.com}\cr
Harry Joe \email{harry@stat.ubc.ca}
}
\examples{
genPositiveDefMat("unifcorrmat",dim = 4)

aa <- genPositiveDefMat("eigen", eigenvalue = c(3, 2, 1), dim=3)
print(aa)
print(eigen(aa$Sigma))

}
\keyword{cluster}

