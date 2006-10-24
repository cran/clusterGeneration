library(clusterGeneration)

##########################################

# checks of generation of random correlation matrices and covariance matrices

set.seed(12345)

# check if alphad>0
try(rcorrmatrix(3, alphad=0) )

# check if covMethod is in c("eigen", "unifcorrmat")
try(genPositiveDefMat(covMethod="Eigen", rangeVar=c(1,10), 
                            lambdaLow=1, ratioLambda=10, dim=3) )

# check if rangeVar[1]>rangeVar[2]
try(genPositiveDefMat(covMethod="unifcorrmat", rangeVar=c(20,10), 
                            lambdaLow=1, ratioLambda=10, dim=3) )

# check if rangeVar[1]<0
try(genPositiveDefMat(covMethod="eigen", rangeVar=c(-1,10), 
                            lambdaLow=1, ratioLambda=10, dim=3) )

# check if lambdaLow<0
try(genPositiveDefMat(covMethod="eigen", rangeVar=c(1,10), 
                            lambdaLow=-0.01, ratioLambda=10, dim=3) )

# check if ratioLambda<1
try(genPositiveDefMat(covMethod="eigen", rangeVar=c(1,10), 
                            lambdaLow=1, ratioLambda=0.1, dim=3) )

# check if dim<1
try(genPositiveDefMat(covMethod="eigen", rangeVar=c(1,10), 
                            lambdaLow=1, ratioLambda=0.1, dim=-2) )

# check what if dim=1
try(genPositiveDefMat(covMethod="eigen", rangeVar=c(1,10), 
                            lambdaLow=1, ratioLambda=10, dim=1) )

# check what if ratioLambda=1, some output will occur
try(genPositiveDefMat(covMethod="eigen", rangeVar=c(1,10), 
                            lambdaLow=1, ratioLambda=1, dim=3) )

