## This script  contains two functions:
# -makeCacheMatrix - which creates a matrix like object 
# -cacheSolve - which uses solve() or a cached version if run a second time

#Also in this project is:
# - generateM.R which contains a function that creates a matrix
# - Test.R which shows the functions in this script working

## This function stores the matrix data and the result of applying solve() to that matrix
## The function can be initialised with the matrix data, or repopulated late with the set subfunction

makeCacheMatrix <- function(x = matrix()) {
#initialise m the matrix inverse to NULL post initialisation
    m<-NULL
#The set function can be used to reset the object with new data.
  set<-function(y){
    x<<-y
    m<<-NULL
  }
#Returns the matrix data
  get<-function() x
#Stores the inverse matrix
  setinverse<-function(inverse) m<<-inverse
#Return the inverse matrix
  getinverse<-function() m
#returns a list of functions using same name as labels so they can be called using [object$function]
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function accepts an initialized makeCacheMatrix object, calculated and return the inverse or a cached version
cacheSolve <- function(x, ...) {
## Tries to get inverse from x. This will be the actual inverse or NULL
  m<-x$getinverse()
##If not NULL the inverse has been calculated before so the if() code is executed.
  if(!is.null(m)){
    message("getting cached data")
#Exit function returing the cached inverse matrix
    return(m)
  }
#If this is first time the inverse is calculate the code arrived here. This line gets the data from the matrix like object x
  data<-x$get()
#Calculate the inverse of the argument matrix
  m<-solve(data, ...)
#Store the inverse in the matrix-like object
  x$setinverse(m)
#Return the inverse matrix
  m
}
