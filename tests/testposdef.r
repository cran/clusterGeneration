library(clusterGeneration)
#
# check functions for generation of random correlation and covariance matrices

set.seed(12345)

cat("Random covariance matrix using eigen method\n")
S1=genPositiveDefMat(covMethod="eigen", rangeVar=c(1,10), 
                            lambdaLow=1, ratioLambda=10, dim=3)
print(S1)

cat("\n\nRandom covariance matrix using unifcorrmat method\n")
S2=genPositiveDefMat(covMethod="unifcorrmat", rangeVar=c(1,10), 
                            lambdaLow=1, ratioLambda=10, dim=3)
print(S2)

