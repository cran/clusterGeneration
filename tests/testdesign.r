library(clusterGeneration)
#
tmp<-simClustDesign(numClust=3, sepVal=c(0.01,0.21), 
              sepLabels=c("L","M"), numNonNoisy=c(4), 
              numOutlier=0, numReplicate=2, 
              fileName="sim", clustszind=2)
print(tmp)
