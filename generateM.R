##This function generates a symmetric positive definite matrix
generatematrix<-function(n){
  eigenvalues<-matrix(0,n,n)
  for (i in 1:n){
    eigenvalues[[i,i]]=runif(1,0,1)
  }
  eigenvectors<-matrix(rnorm(n*n),n,n)
  m<- t(eigenvectors) %*% eigenvalues %*% eigenvectors
  m
}
