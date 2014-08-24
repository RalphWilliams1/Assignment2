# Student Name: Ralph Williams
# Student ID: 8916117
# Student Email: ralphw@bloomfieldlabs.com

## There are two functions in this file. They are used to take in a square matrix, invert it and 
## then check to see if the inverted matrix has been cached or if it needs to be re-created. 

## The first function makeCacheMatrix takes in a matrix and returns a list with four variables/functions. 
## The Variables/Functions are:
## set, for storing data, 
## get for seeing if data is stored
## setsolve for inverting the input matrix
## getsolve for returning the inverted matrix. 

# This is for testing. 
# x <- matrix(data=rnorm(4), nrow=2, ncol=2)

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
# Here is the list of variables/functions that are returned by the makeCacheMatrix function  
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
  
## This function receives a list that is created by the makeCacheMatrix function 
## and tests to see if the inverted matrix is stored in memory. If the original is stored, then the function
## accesses it to send it to the console. If the inverted matirx is not stored in memory, it inverts it again. 

cacheSolve <- function(x, ...) {
## Find the variable that is tied to the getsolve operation in the makeCacheMatrix
  m <- x$getsolve()
## Test to see if the data is valid or not  
  if(!is.null(m)) {
## If the inverted matrix data is valid, then simply return that matrix.     
    message("getting cached data")
    return(m)
  }
## If the inverted matrix data is invald, then get the original matrix
  data <- x$get()
## Invert the original matrix
  m <- solve(data, ...)
  x$setsolve(m)
## Return the inverted matrix
  m
}

 
