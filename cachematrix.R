## Functions 'makeCacheMatrix' and 'cachesolve' implement
## a useful caching mechanism for calculating the
## inverse of a matrix.
##
## As per the instructions for Coursera "R Programming"
## Assignment 2.

## Function 'makeCacheMatrix' creates a special "matrix"
## class in the style suggested in the assignment example. 
## This "matrix" is a list consisting of four functions:
##  * 'set' - This function does nothing useful, again
##            in the style of the example
##  * 'get' - Retrieves the matrix that is cached
##  * 'setInverse' - Sets a cached value and trusts that
##                   the calling function will use it
##                   honestly to store a calculated inverse
##                   and only that.
##  * 'getInverse' - Retrieves the cached value

makeCacheMatrix <- function(x = matrix()) {
  cacheValue <- NULL 
             ## the cached value
  set <- function(y) {
     x <<- y
     cacheValue <<- NULL
  }
  get <- function() x
  setinverse <- function(setCacheValue) {
     cacheValue <<- setCacheValue      
  }
  getinverse <- function() cacheValue
  list(set = set, get = get, setmean = setmean,
       getmean = getmean)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
