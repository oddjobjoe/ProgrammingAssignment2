##This pair of functions will cache the inverse of a matrix

## makeCacheMatrix: Creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## cacheSolve: Computes the inverse of the special "matrix" returned by makeCacheMatrix above
## If inverse has already been calculated, then the cachesolve should retrieve the inverse
## from the cache.


cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- inverse(mat, ...)
        x$setinverse(m)
        m
}

##