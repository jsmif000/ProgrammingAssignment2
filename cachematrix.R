## Functions 'makeCacheMatrix' and 'cachesolve' implement
## a useful caching mechanism for calculating the
## inverse of a matrix.
##
## As per the instructions for Coursera "R Programming"
## Assignment 2.

## Function 'makeCacheMatrix' creates a special "matrix"
## object in the style suggested in the assignment example. 
## This "matrix" is a list consisting of four functions:
##  * 'set' - Caches a matrix and sets the inverse cache to NULL
##  * 'get' - Retrieves the matrix that is cached
##  * 'setInverse' - Sets a cached value and trusts that
##                   the calling function will use it
##                   honestly to store a calculated inverse
##                   and only that.
##  * 'getInverse' - Retrieves the value that was set
##                   via setInverse

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
  list(set = set, get = get, 
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve returns either the cached value stored in 
## makeCacheMatrix, if it exists, or the inverse of the
## makeCacheMatrix special matrix x.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
   ## If the cache is not null, return the cache.
   ## Otherwise, calculate the inverse, 
   ## store it in the cache, and return it.
   ## 
   ## The cache will be null when the inverse has never
   ## been calculated; it will also be null when the stored matrix
   ## has changed. The null check covers both cases.
   currentMatrix <- x$get()
   currentCache <- x$getinverse()
   if (!is.null(currentCache)) {
      message("getting cached data")
      currentCache
   }
   inverse = solve(currentMatrix)
   x$setinverse(inverse)
   inverse
       
}
