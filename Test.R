##This code tests the assignment functions.
##If run in console it tests the functions

#Import functions
source("generateM.R")
source("cachematrix.R")

#Generate a matrix
mat_1<-generatematrix(4)
#Initialise a Cache Matrix Object
cachemat_1<-makeCacheMatrix(mat_1)
#Calculate matrix inverse first time
cacheSolve(cachemat_1)
#Calculate matrix inverse second time - using cache
cacheSolve(cachemat_1)
#Test that inverse * original is the identity matrix
mat_1_inv<-cacheSolve(cachemat_1)
mat_1_inv %*% mat_1

#Generate a new matrix
mat_2<-generatematrix(4)
#Set Cache Matrix Object to have new matrix
cachemat_1$set(mat_2)
#Calculate matrix inverse first time
cacheSolve(cachemat_1)
#Calculate matrix inverse second time - using cache
cacheSolve(cachemat_1)
#Test that inverse * original is the identity matrix
mat_2_inv<-cacheSolve(cachemat_1)
mat_2_inv %*% mat_2
