\name{rcorrmatrix}
\alias{rcorrmatrix}
\title{GENERATE A RANDOM CORRELATION MATRIX BASED ON RANDOM PARTIAL CORRELATIONS}
\description{
Generate a random correlation matrix based on random partial correlations.
}
\usage{
  rcorrmatrix(d,alphad=1)
}
\arguments{
  \item{d}{
  Dimension of the matrix. \code{d} should be a non-negative integer.
  }
  \item{alphad}{
\eqn{\alpha} parameter for partial of \eqn{1,d} given \eqn{2,\ldots,d-1}, for 
generating random correlation matrix based on the method proposed by Joe (2006),
where \eqn{d} is the dimension of the correlation matrix.
The default value \code{alphad}\eqn{=1} leads to a random matrix which is 
uniform over space of positive definite correlation matrices.
Each correlation has a \eqn{Beta(a,a)} distribution on \eqn{(-1,1)} where
\eqn{a=alphad+(d-2)/2}. \code{alphad} should be a positive number.
  }
}
\value{
A correlation matrix.
}
\references{
  Joe, H. (2006)
  Generating Random Correlation Matrices Based on Partial Correlations. 
  \emph{Journal of Multivariate Analysis}, \bold{97}, 2177--2189.
}
\author{
Weiliang Qiu \email{weiliang.qiu@gmail.com}\cr
Harry Joe \email{harry@stat.ubc.ca}
}
\examples{
rcorrmatrix(3)
rcorrmatrix(5)
rcorrmatrix(5,alphad=2.5)
}
\keyword{cluster}

