## Caching the Inverse of a Matrix

## Creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  cachedinverse <- NULL
  set <- function(y) {
    x <<- y
    cachedinverse <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) cachedinverse <<- inv
  getinverse <- function() cachedinverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Returns the inverse of the special "matrix" from makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
##    then this returns the cached inverse,
##    otherwise it will calculate the inverse, cache it, and return it
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}