## It is often useful to store a value for later us in a program.  R's lexical
## scoping design allows functions/programs to store values within different 
## environment levels. The two fucntions below demonstrate this capability.

## Below are two functions that are used to create a special object that stores
## a matrix and cache's its inverse.

makeCacheMatrix <- function(x = matrix()) {
        
        invMatrix <- NULL
        set <- function(y) {
                x <<- y
                invMatrix <<- NULL
        }
  
        get <- function() x
        setInvMatrix <- function(inverse) invMatrix <<- inverse
        getInvMatrix <- function() invMatrix
        list(set = set, 
             get = get, 
             setInvMatrix = setInvMatrix, 
             getInvMatrix = getInvMatrix)  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        
        ## Return a matrix that is the inverse of 'x'
        invMatrix <- x$getInvMatrix()
        if(!is.null(invMatrix)) {
                message("getting cached data")
                return(invMatrix)
        }
        matrix <- x$get()
        invMatrix <- solve(matrix, ...)
        x$setInvMatrix(invMatrix)
        invMatrix
}
