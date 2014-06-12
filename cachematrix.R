## Create a cache matrix object for capturing inverse matrix
makeCacheMatrix <- function( m = matrix() ) {
  
  ## Initialize the inverse property
  initial <- NULL
  
  ## Method to set the matrix
  set <- function( matrix ) {
    m <<- matrix
    initial <<- NULL
  }
  
  ## Method to capture or return the matrix
  get <- function() {
    m
  }
  
  ## Method to set the inverse of the matrix
  setInverse <- function(inverse) {
    initial <<- inverse
  }
  
  # Capture the inverse of the matrix
  getInverse <- function() {
    i
  }
  
  # Return a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


# Compute the inverse of the special matrix returned by "makeCacheMatrix"
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  # Check if return is already set and return if it is
  if(!is.null(m)) {
    message("hey, let me capture cached data")
    return(m)
  }
  
  # Get the matrix from our object
  data <- x$get()
  
  # Matrix inverse using computation
  m <- solve(data) %*% data
  
  # Set the inverse to the object
  x$setInverse(m)
  m
}
