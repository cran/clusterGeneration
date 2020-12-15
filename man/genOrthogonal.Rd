\name{genOrthogonal}
\alias{genOrthogonal}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
	Generate An Orthogonal Matrix
}
\description{
	Generate an orthogonal matrix with given dimension.
}
\usage{
genOrthogonal(dim)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dim}{
integer. Dimension of the orthogonal matrix.
}
}
%\details{
%	We first generate a random vector with \code{dim} elements from the
%	distribution \code{Uniform[0, 1]}. We then apply QR decomposition. 
%	The Q matrix is then returned.
%}
\value{
	An orthogonal matrix with dimension \code{dim}.
}
%\references{
%% ~put references to the literature/web site here ~
%}
%\author{
%%  ~~who you are~~
%}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
set.seed(12345)
Q = genOrthogonal(3)
print(Q)
A = Q %*% t(Q)
print(A)

}
\keyword{ method }
