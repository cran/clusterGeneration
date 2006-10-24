library(clusterGeneration)

# Check of different inputs of genRandomClust that will yield error messages

######################

set.seed(12345)
#tmp4 <- genRandomClust(numClust=2, numNonNoisy=2, sepVal=-0.1, 
#        numNoisy=6, numOutlier=30, numReplicate=1, 
#        clustszind=1, clustSizeEq=80, rangeVar=c(10, 20),
#        covMethod="unifcorrmat", iniProjDirMethod="naive",
#        projDirMethod="fixedpoint", fileName="chk4")
#
# above has many warning messages, but there is output

# check if the function can detect wrong values of arguments

# check if numClust<1
try( genRandomClust(numClust=0, sepVal=0.3, numNonNoisy=5, 
        numNoisy=3, numOutlier=5, numReplicate=2, fileName="chk5") )

# check if numNonNoisy<2
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=1,  
        numNoisy=3, numOutlier=5, numReplicate=2, fileName="chk6") )

# check if sepVal< -1
try( genRandomClust(numClust=2, sepVal=-1.1, numNonNoisy=5,  
        numNoisy=3, numOutlier=5, numReplicate=2, fileName="chk7") )

# check if sepVal>1
try( genRandomClust(numClust=2, sepVal=3, numNonNoisy=5,  
        numNoisy=3, numOutlier=5, numReplicate=2, fileName="chk8") )

# check if numReplicate<1
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
   numReplicate=0.9, numNoisy=3, numOutlier=5, fileName="chk9") )

# check if numNoisy<0
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=-1, numOutlier=5, numReplicate=2, fileName="chk10") )

# check if numOutlier<0
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=-0.5, numReplicate=2, fileName="chk11") )

# check if clustszind in c(1, 2, 3)
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
    numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk12", clustszind=4) )

# check if clustSizeEq<2
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk13", 
        clustszind=1, clustSizeEq=1) )

# check what if clustSizeEq=2 (constant cluster size too small)
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk14", 
        clustszind=1, clustSizeEq=2) )

# check if length(rangeN)!=2
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk15", 
        clustszind=1, rangeN=c(50, 60, 80)) )

# check if rangeN[1]>rangeN[2]
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk16", 
        clustszind=1, rangeN=c(50, 30)) )

# check if numClust=length(clustSizes)
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk17", 
        clustszind=3, clustSizes=c(50, 60, 30)) )

# check if rangeVar[1]>rangeVar[2]
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk18", 
        clustszind=1, rangeVar=c(5, 2)) )

# check if rangeVar[1]<0
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk19", 
        clustszind=1, rangeVar=c(-5, 2)) )

# check if lambdaLow<0
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk20", 
        clustszind=1, lambdaLow=-1) )

# check if ratioLambda<1
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk21", 
        clustszind=1, ratioLambda=0.9) )

# check if is.logical(rotateind) = TRUE
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk22", 
        clustszind=1, rotateind=1) )

# check if is.logical(rotateind) = TRUE
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk23", 
        clustszind=1, rotateind=0) )

# check if alpha<=0 
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk24", 
        clustszind=1, alpha=0) )

# check if alpha>0.5
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk25", 
        clustszind=1, alpha=0.6) )

# check if ITMAX<=0
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk26", 
        clustszind=1, ITMAX=0) )

# check if eps<0
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk27", 
        clustszind=1, eps=0) )

# check if eps>0.01
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk28", 
        clustszind=1, eps=0.11) )

# check if is.logical(quiet)==TRUE
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk29", 
        clustszind=1, quiet= -1) )

# check if is.logical(outputEmpirical)==TRUE
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk30", 
        clustszind=1, outputEmpirical= 0.5) )

# check if is.logical(outputEmpirical)==TRUE
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk31", 
        clustszind=1, outputInfo= 3.5) )

# check if iniProjDirMethod is in c("SL", "naive")
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk32", 
        clustszind=1, iniProjDirMethod="Naive") )

# check if projDirMethod is in c("newton", "fixedpoint")
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk33", 
        clustszind=1, projDirMethod="fixpoint") )

# check if projDirMethod is in c("eigen", "unifcorrmat")
try( genRandomClust(numClust=2, sepVal=0.3, numNonNoisy=5,  
        numNoisy=0, numOutlier=0.5, numReplicate=2, fileName="chk34", 
        clustszind=1, covMethod="abc") )

# check if sepVal in (-0.999, 0.999)
try( genRandomClust(numClust=2, numNonNoisy=5, sepVal=-1) )
try( genRandomClust(numClust=2, numNonNoisy=5, sepVal=1) )
try( genRandomClust(numClust=2, numNonNoisy=5, sepVal=0.999) )
try( genRandomClust(numClust=2, numNonNoisy=5, sepVal=-0.999) )

cat("\n==================================================\n")

# Check of different inputs of simClustDesign that will yield error messages

# check if prod(numClust<1) == 1
try( simClustDesign(numClust=c(0, 3, 6), 
              sepVal=c(0.01,0.21), 
              sepLabels=c("L","M"), 
              numNonNoisy=c(4), numOutlier=0, numReplicate=2, 
              fileName="test1", clustszind=2) )

# check if prod(numNonNoisy<1) == 1
try( simClustDesign(sepVal=c(0.01,0.21), 
              sepLabels=c("L","M"), 
              numNonNoisy=c(0), numOutlier=0, numReplicate=2, 
              fileName="test2", clustszind=2) )


# check if prod(sepVal< -0.999) == 1
try( simClustDesign(sepVal=c(-3.21,0.01), 
              sepLabels=c("L","M"), 
              numNonNoisy=c(4), numOutlier=0, numReplicate=2, 
              fileName="test3", clustszind=2) )

