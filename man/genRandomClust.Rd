\name{genRandomClust}
\alias{genRandomClust}
\title{RANDOM CLUSTER GENERATION WITH SPECIFIED DEGREE OF SEPARATION}
\description{
Generate cluster data sets with specified degree of separation. 
The separation between any cluster and its nearest neighboring cluster can be 
set to a specified value. The covariance matrices of clusters can have 
arbitrary diameters, shapes and orientations.
}
\usage{
genRandomClust(numClust, 
               sepVal = 0.01, 
               numNonNoisy = 2, 
               numNoisy = 0, 
               numOutlier = 0, 
               numReplicate = 3, 
               fileName = "test",  
               clustszind = 2, 
               clustSizeEq = 50, 
               rangeN = c(50,200), 
               clustSizes = NULL, 
               covMethod = c("eigen", "onion", "c-vine", "unifcorrmat"), 
	       eigenvalue = NULL,
               rangeVar = c(1, 10), 
               lambdaLow = 1, 
               ratioLambda = 10,  
               alphad = 1,
               eta = 1,
               rotateind = TRUE, 
               iniProjDirMethod = c("SL", "naive"), 
               projDirMethod = c("newton", "fixedpoint"), 
               alpha = 0.05, 
               ITMAX = 20, 
               eps = 1.0e-10, 
               quiet = TRUE, 
               outputDatFlag = TRUE, 
               outputLogFlag = TRUE, 
               outputEmpirical = TRUE, 
               outputInfo = TRUE)
}
\arguments{
  \item{numClust}{
Number of clusters in a data set.
  }
  \item{sepVal}{
Desired value of the separation index between a cluster
and its nearest neighboring cluster. Theoretically, \code{sepVal} can take 
values within the interval \eqn{[-1, 1)} 
(In practice, we set \code{sepVal} in \eqn{(-0.999, 0.999)}). 
The closer to \eqn{1} \code{sepVal} is, the more separated clusters are.
The default value is \eqn{0.01} which is the value of the separation index for
two univariate clusters generated from \eqn{N(0, 1)} and \eqn{N(0, A)},
respectively,  where \eqn{A=4}. 
\code{sepVal}\eqn{=0.01} indicates a close cluster structure. 
\code{sepVal}\eqn{=0.21 (A=6)} indicates a separated cluster structure. 
\code{sepVal}\eqn{=0.34 (A=8)} indicates a well-separated cluster.
  }
  \item{numNonNoisy}{
Number of non-noisy variables.
  }
  \item{numNoisy}{
Number of noisy variables.
The default values of \code{numNoisy} and \code{numOutlier} are \eqn{0} so 
that we get \dfn{clean} data sets. 
  }
  \item{numOutlier}{
Number or ratio of outliers. If \code{numOutlier} is a positive integer, 
then \code{numOutlier} means the number of outliers. 
If \code{numOutlier} is a real number between \eqn{(0, 1)}, then 
\code{numOutlier} means the ratio of outliers, i.e. the number of outliers 
is equal to \code{round}(\code{numOutlier}\eqn{*n_1}), where \eqn{n_1} is 
the total number of non-outliers.  If \code{numOutlier} is a real number 
greater than \eqn{1}, then \code{numOutlier} to rounded to an integer.
The default values of \code{numNoisy} and \code{numOutlier} are 
\eqn{0} so that we get \sQuote{clean} data sets. 
  }
  \item{numReplicate}{
Number of data sets to be generated for the same cluster structure specified 
by the other arguments of the function \code{genRandomClust}.
The default value \eqn{3} follows the design in Milligan (1985).
  }
  \item{fileName}{
The first part of the names of data files that record the generated data sets 
and associated information, such as cluster membership of data points, labels 
of noisy variables, separation index matrix, projection directions, etc. 
(see details). The default value of \code{fileName} is \file{test}.
  }
  \item{clustszind}{
Cluster size indicator.
    \code{clustszind}\eqn{=1} indicates that all cluster have equal size. 
          The size is specified by the argument \code{clustSizeEq}.
    \code{clustszind}\eqn{=2} indicates that the cluster sizes are randomly 
          generated from the range specified by the argument \code{rangeN}.
    \code{clustszind}\eqn{=3} indicates that the cluster sizes are specified
          via the vector \code{clustSizes}.
The default value is \eqn{2} so that the generated clusters are more
realistic.
  }
  \item{clustSizeEq}{
Cluster size.
If the argument \code{clustszind}\eqn{=1}, then all clusters will have the 
equal number \code{clustSizeEq} of data points. The value of \code{clustSizeEq} 
should be large enough to get non-singular cluster covariance matrices. 
We recommend the \code{clustSizeEq} is at least \eqn{10*p}, where \eqn{p} 
is the total number of variables (including both non-noisy and noisy variables).
The default value \eqn{100} is a reasonable cluster size.
  }
  \item{rangeN}{
The range of cluster sizes.
If \code{clustszind}\eqn{=2}, then cluster sizes will be randomly generated 
from the range specified by \code{rangeN}. The lower bound of the number of 
clusters should be large enough to get non-singular cluster covariance 
matrices. We recommend the minimum cluster size is at least \eqn{10*p}, where 
\eqn{p} is the total number of variables (including both non-noisy and noisy 
variables).  The default range is \eqn{[50, 200]} which
can produce reasonable variability of cluster sizes.
  }
  \item{clustSizes}{
The sizes of clusters.
If \code{clustszind}\eqn{=3}, then cluster sizes will be specified via the 
vector \code{clustSizes}.  We recommend the minimum cluster size is at least 
\eqn{10*p}, where \eqn{p} is the total number of variables (including both 
non-noisy and noisy variables).
The user needs to specify the value of \code{clustSizes}. Therefore, we
set the default value of \code{clustSizes} as \code{NULL}.
  }
  \item{covMethod}{
Method to generate covariance matrices for clusters (see details).
The default method is 'eigen' so that the user can directly 
specify the range of the \dfn{diameters} of clusters.
  }
    \item{eigenvalue}{
numeric. user-specified eigenvalues when \code{covMethod = "eigen"}. If \code{eigenvalue = NULL} and \code{covMethod = "eigen"}, then eigenvalues will be automatically generated.  
  }
  \item{rangeVar}{
Range for variances of a covariance matrix (see details).
The default range is \eqn{[1, 10]} which can generate reasonable
variability of variances.
  }
  \item{lambdaLow}{
Lower bound of the eigenvalues of cluster covariance matrices. 
If the argument \dQuote{covMethod="eigen"}, we need to generate eigenvalues for cluster covariance matrices.
The eigenvalues are randomly generated from the
interval [\code{lambdaLow}, \code{lambdaLow}\eqn{*}\code{ratioLambda}]. 
In our experience, \code{lambdaLow}\eqn{=1} and \code{ratioLambda}\eqn{=10} 
can give reasonable variability of the diameters of clusters.
\code{lambdaLow} should be positive.
  }
  \item{ratioLambda}{
The ratio of the upper bound of the eigenvalues to the lower bound of the 
eigenvalues of cluster covariance matrices. 
If the argument \code{covMethod="eigen"}, we need to generate eigenvalues for
cluster covariance matrices.
The eigenvalues are randomly generated from the
interval [\code{lambdaLow}, \code{lambdaLow}\eqn{*}\code{ratioLambda}]. 
In our experience, \code{lambdaLow}\eqn{=1} and \code{ratioLambda}\eqn{=10} 
can give reasonable variability of the diameters of clusters.
\code{ratioLambda} should be larger than \eqn{1}.
  }
  \item{alphad}{parameter for unifcorrmat method to generate random correlation matrix
 \code{alphad=1} for uniform. \code{alphad} should be positive.}
  \item{eta}{parameter for \dQuote{c-vine} and \dQuote{onion} methods to generate random correlation matrix
 \code{eta=1} for uniform. \code{eta} should be positive.}
  \item{rotateind}{
Rotation indicator.
\code{rotateind=TRUE} indicates randomly rotating data in non-noisy 
dimensions so that we may not detect the full cluster structure from 
pair-wise scatter plots of the variables.
  }
  \item{iniProjDirMethod}{
Indicating the method to get initial projection direction when calculating
the separation index between a pair of clusters (c.f. Qiu and Joe,
2006a, 2006b). \cr
\code{iniProjDirMethod}=\dQuote{SL}, the default, indicates the initial 
projection direction is the sample version of the SL's projection direction 
(Su and Liu, 1993, JASA)
\eqn{\left(\boldsymbol{\Sigma}_1+\boldsymbol{\Sigma}_2\right)^{-1}\left(\boldsymbol{\mu}_2-\boldsymbol{\mu}_1\right)}\cr
\code{iniProjDirMethod}=\dQuote{naive} indicates the initial projection 
direction is \eqn{\boldsymbol{\mu}_2-\boldsymbol{\mu}_1}
  }
  \item{projDirMethod}{
Indicating the method to get the optimal projection direction when calculating 
the separation index between a pair of clusters (c.f. Qiu and Joe,
2006a, 2006b). \cr
\code{projDirMethod}=\dQuote{newton} indicates we use the modified
Newton-Raphson method to search the optimal projection direction 
(c.f. Qiu and Joe, 2006a). This requires the assumptions that both covariance 
matrices of the pair of clusters are positive-definite. If this assumption 
is violated, the \dQuote{fixedpoint} method could be used. The 
\dQuote{fixedpoint} method iteratively searches the optimal projection 
direction based on the first derivative of the separation index to the 
projection direction (c.f. Qiu and Joe, 2006b).
  }
  \item{alpha}{
Tuning parameter reflecting the percentage in the two
tails of a projected cluster that might be outlying.
We set \code{alpha}\eqn{=0.05} like we set
the significance level in hypothesis testing as \eqn{0.05}.
  }
  \item{ITMAX}{
Maximum iteration allowed when iteratively calculating the
optimal projection direction.
The actual number of iterations is usually much less than the default value 20.
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
  \item{outputDatFlag}{
Indicates if data set should be output to file.
  }
  \item{outputLogFlag}{
Indicates if log info should be output to file.
  }
  \item{outputEmpirical}{
Indicates if empirical separation indices and projection directions should be 
calculated. This option is useful when generating clusters with sizes which 
are not large enough so that the sample covariance matrices may be singular.
Hence, by default, \code{outputEmpirical=TRUE}.
  }
  \item{outputInfo}{
Indicates if theoretical and empirical separation information data frames 
should be output to a file with format \file{[fileName]\_info.log}.
  }
}
\details{
The function \code{genRandomClust} is an implementation of the random cluster 
generation method proposed in Qiu and Joe (2006a) which improve the cluster 
generation method proposed in Milligan (1985) so that the degree of separation 
between any cluster and its nearest neighboring cluster could be set to a 
specified value while the cluster covariance matrices can be arbitrary positive definite matrices, and so that clusters generated might not be visualized 
by pair-wise scatterplots of variables. The separation between a pair of 
clusters is measured by the separation index proposed in Qiu and Joe (2006b).

The current version of the function \code{genRandomClust} implements two 
methods to generate covariance matrices for clusters. The first method, 
denoted by \code{eigen}, first randomly generates eigenvalues 
(\eqn{\lambda_1,\ldots>\lambda_p}) for the covariance matrix 
(\eqn{\boldsymbol{\Sigma}}), then uses columns of a randomly generated 
orthogonal matrix 
(\eqn{\boldsymbol{Q}=(\boldsymbol{\alpha}_1,\ldots,\boldsymbol{\alpha}_p)}) 
as eigenvectors. The covariance matrix 
\eqn{\boldsymbol{\Sigma}} is then contructed as 
\eqn{\boldsymbol{Q}*diag(\lambda_1,\dots, \lambda_p)*\boldsymbol{Q}^T}.
The second method, denoted as \dQuote{unifcorrmax}, first generates a random 
correlation matrix (\eqn{\boldsymbol{R}}) via the method proposed in Joe (2006),
then randomly generates variances (\eqn{\sigma_1^2,\ldots, \sigma_p^2}) from 
an interval specified by the argument \code{rangeVar}. The covariance matrix 
\eqn{\boldsymbol{\Sigma}} is then constructed as 
\eqn{diag(\sigma_1,\ldots,\sigma_p)*\boldsymbol{R}*diag(\sigma_1,\ldots,\sigma_p)}.

For each data set generated, the function \code{genRandomClust} outputs
four files: data file, log file, membership file, and noisy set file. 
All four files have the same format: \file{[fileName]\_[i].[extension]}, 
where \eqn{i} indicates the replicate number, and \file{extension} can be 
\file{dat}, \file{log}, \file{mem}, and \file{noisy}. 

The data file with file extension \file{dat} contains \eqn{n+1} rows and 
\eqn{p} columns, where \eqn{n} is the number of data points and \eqn{p} 
is the number of variables. The first row is the variable names. 
The log file with file extension \file{log} contains information such 
as cluster sizes, mean vectors, covariance matrices, projection directions, 
separation index matrices, etc. The membership file with file extension 
\file{mem} contains \eqn{n} rows and one column of cluster memberships for 
data points. The noisy set file with file extension \file{noisy} contains 
a row of labels of noisy variables.

When generating clusters, population covariance matrices are all 
positive-definite. However sample covariance matrices might be 
semi-positive-definite due to small cluster sizes. In this case, the 
function \code{genRandomClust} will automatically use the 
\dQuote{fixedpoint} method to search the optimal projection direction.

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
The function outputs four data files for each data set (see details).

This function also returns separation information data frames 
\code{infoFrameTheory} and \code{infoFrameData} based on population 
and empirical mean vectors and covariance matrices of clusters for all 
the data sets generated. Both \code{infoFrameTheory} and \code{infoFrameData} 
contain the following seven columns:

  \item{Column 1:}{
Labels of clusters (\eqn{1, 2, \ldots, numClust}), where \eqn{numClust} 
is the number of clusters for the data set.
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
  \item{Column 7:}{
Data file names with format \file{[fileName]\_[i]}, where \eqn{i} indicates 
the replicate number.
  }

  The function also returns three lists: \code{datList}, \code{memList}, and \code{noisyList}.

  \item{datList:}{
    a list of data matrices for generated data sets.
  }
  \item{memList:}{
    a list of luster memberships for data points for generated data sets.
  }
  \item{noisyList:}{
    a list of sets of noisy variables for generated data sets.
  }

}
\references{
  Joe, H. (2006)
  Generating Random Correlation Matrices Based on Partial Correlations. 
  \emph{Journal of Multivariate Analysis}, \bold{97}, 2177--2189.

  Milligan G. W. (1985) 
  An Algorithm for Generating Artificial Test Clusters.
  \emph{Psychometrika} \bold{50}, 123--127.

  Qiu, W.-L. and Joe, H. (2006a)
  Generation of Random Clusters with Specified Degree of Separaion.
  \emph{Journal of Classification}, \bold{23}(2), 315-334.

  Qiu, W.-L. and Joe, H. (2006b)
  Separation Index and Partial Membership for Clustering.
  \emph{Computational Statistics and Data Analysis}, \bold{50}, 585--603.

  Su, J. Q. and Liu, J. S. (1993)
  Linear Combinations of Multiple Diagnostic Markers.
  \emph{Journal of the American Statistical Association}, \bold{88}, 1350--1355.

  Ghosh, S., Henderson, S. G. (2003).
  Behavior of the NORTA method for correlated random vector generation
  as the dimension increases.
  \emph{ACM Transactions on Modeling and Computer Simulation (TOMACS)},
  \bold{13(3)}, 276--294.

  Kurowicka and Cooke, 2006.
  \emph{Uncertainty Analysis with High Dimensional Dependence Modelling},
  Wiley, 2006.
}
\note{This function might be take a while to complete.}
\author{
Weiliang Qiu \email{weiliang.qiu@gmail.com}\cr
Harry Joe \email{harry@stat.ubc.ca}
}
\examples{
\dontrun{
tmp1 <- genRandomClust(
		       numClust = 7, 
		       sepVal = 0.3, 
		       numNonNoisy = 5,  
                       numNoisy = 3, 
		       numOutlier = 5, 
		       numReplicate = 2, 
		       fileName = "chk1")
}
\dontrun{
tmp2 <- genRandomClust(
		       numClust = 7, 
		       sepVal = 0.3, 
		       numNonNoisy = 5,  
                       numNoisy = 3, 
		       numOutlier = 5, 
		       numReplicate = 2, 
                       covMethod = "unifcorrmat", 
		       fileName = "chk2")
}
\dontrun{
tmp3 <- genRandomClust(
		       numClust = 2, 
		       sepVal = -0.1, 
		       numNonNoisy = 2,  
                       numNoisy = 6, 
		       numOutlier = 30, 
		       numReplicate = 1, 
                       clustszind = 1, 
		       clustSizeEq = 80, 
		       rangeVar = c(10, 20),
                       covMethod = "unifcorrmat", 
		       iniProjDirMethod = "naive",
                       projDirMethod = "fixedpoint", 
		       fileName = "chk3")
}

}
\keyword{cluster}

