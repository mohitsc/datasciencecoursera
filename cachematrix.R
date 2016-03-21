## makeCacheMatrix constructs a list of functions that enables the inverse of a given matrix to be cached 
## the cacheSolve function solves the matrix (calculating inverse), this value is stored as a cache until a new matrix is input into the make Cache Matrix function

makeCacheMatrix <- function(x = matrix()) { 
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
        
}

## at this point we have a list of set, get, setinv, getinv. setinv and getinv and null at this point.
## To test "set" and "get", we can use "set" to force set a value...a$set(matrix(1:4,2,2))
## we can use "get" to retrieve the value that we set 

## now we will solve for the inverse of the matrix
cacheSolve <- function(x, ...) {
        m <- x$getinv()
        if(!is.null(m)) {
                message("Getting cached data, yo")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}

## setinv has been set to the inverse of the matrix
## when we run both functions after inputting a new matrix, 


## testing the function below this to make sure it works

a <- makeCacheMatrix(matrix(c(4,6,3,9),2,2))

a$get()

cacheSolve(a)

a$getinv()